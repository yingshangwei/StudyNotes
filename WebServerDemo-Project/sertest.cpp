#include <stdio.h>
#include <iostream>
#include <string>
#include <sys/socket.h>
#include <sys/epoll.h>
#include <sys/types.h>
#include <sys/time.h>
#include <string.h>
#include <netinet/in.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <stdlib.h>
#include "mysocket.pb.h"
#include "mysocket.pb.cc"
#include <map>
#include <set>
#include <fstream>
#include <queue>
using namespace std;

#define ERRNP(s) fprintf(stderr, "%s error %s errno : %d\n", s,strerror(errno), errno)
#define ERRP(s) fprintf(stderr, "%s error\n", s)

#define filename "player.data"

#define MAXBUFF 4096
#define MAXEVENTS 64
#define MAXLISTENFD 1024

#define REGISTEREDTYPE 1
#define LOGINTYPE 2
#define OPERATETYPE 3
#define POSSYNTYPE 4
#define FRAMHEADTYPE 5
#define FRAMOPTYPE 6
#define FRAMPACKAGETYPE 7


#define MOVETYPE 1
#define SKILLTYPE 2

//#define NEEDPLAYER 1

const int server_ip_port = 10009;//server uses port

int Registered(RegisteredReq&,RegisteredRes&);//registered account
int Login(LoginReq& req,LoginRes& res);//login account
int Operate(OperateReq&,OperateRes&);//operate player
int InfSyn();//information synchronization to each login client


typedef struct PLAYER {
    string name;
    string password;
} Player;
map<string,Player> mp;
int ReadInfFromFile(map<string,Player>&);
int WriteInfToFile(map<string,Player>&);

//temp store fd stream struct
typedef struct FDBUFFINF {
    int count;//now store char count
    char buff[MAXBUFF];//stream temp in
} FdBuff;
typedef struct FDDATA {
    int fd;
    int type;
    int len;
    char buff[MAXBUFF];
} FdData;


#define HEADLEN 3
class Server {
public:
    char buff[MAXBUFF];//recv msg buff;
    char sbuff[MAXBUFF];//send msg buff
    int conn_fd;
    int listen_fd;//socket listen fd
    int epoll_fd;//epoll fd
    int ret;//temp return value
    struct epoll_event event;//temp event
    struct epoll_event* events;//wait to solve event
    int recv_len;//recv msg stream len

    map<int,FdBuff> fd_buff; //fd temp buff;

    queue<FdData> dataQ;//give out world data to use

    

    //create socket and init
    int InitSocket(int server_ip_port) {
        memset(buff,0,sizeof(buff));
        memset(sbuff,0,sizeof(sbuff));
        fd_buff.clear();
        conn_fd = -1;
        listen_fd = -1;
        epoll_fd = -1;
        ret = -1;

        //set sock addr
        struct sockaddr_in mysockaddr;
        memset(&mysockaddr,0,sizeof(mysockaddr));
        mysockaddr.sin_family = AF_INET;//set 
        mysockaddr.sin_addr.s_addr = htonl(INADDR_ANY);//set in ip
        mysockaddr.sin_port = htons(server_ip_port);//set ip port

        //create socket
        ret = listen_fd = socket(AF_INET,SOCK_STREAM,0);
        if(ret < 0) {
            ERRNP("socket create");
            return -1;
        }

        //bind port
        ret = bind(listen_fd,(struct sockaddr*)&mysockaddr,sizeof(mysockaddr));
        if(ret < 0) {
            ERRNP("socket bind");
            close(listen_fd);
            return -1;
        }

        //listen fd
        ret = listen(listen_fd,MAXLISTENFD);
        if(ret < 0) {
            ERRNP("listen fd");
            close(listen_fd);
            return -1;
        }

        //create epoll
        ret = epoll_fd = epoll_create(1);
        if(ret < 0) {
            ERRNP("epoll create");
            close(listen_fd);
            return -1;
        }

        //add listen_fd to epoll
        event.data.fd = listen_fd;
        event.events = EPOLLIN;
        ret = epoll_ctl(epoll_fd,EPOLL_CTL_ADD,listen_fd,&event);
        if(ret < 0) {
            ERRNP("epoll add listen fd");
            close(listen_fd);
            close(epoll_fd);
            return -1;
        }

        //malloc for events
        events = (struct epoll_event*)malloc(sizeof(struct epoll_event)*MAXEVENTS);
        if(events==NULL) {
            ERRP("events malloc");
            close(listen_fd);
            close(epoll_fd);
            return 0;
        }

    }


    int GetDatalen(char& a, char& b) {
        int len = a-1;
        len <<= 6;
        len += b-1;
        //TODO:len too long or other error judge, return -1
        return len;
    }


    //function to solve wait events
    int EventsSolve() {
        int n;

        //get wait to solve fd
        ret = n = epoll_wait(epoll_fd, events, MAXEVENTS, 5);
        if(ret < 0) {
            ERRNP("epoll wait");
            return -1;
        }

        for(int i = 0;i < n;i++) {
            int fd = events[i].data.fd;
            int event_fd = events[i].events;
            if((!(event_fd & EPOLLIN))) {
                ERRNP("wait event i");
                close(fd);
                continue;
            }
            else if(listen_fd == fd) {//new conn request
                struct sockaddr client_addr;
                socklen_t client_addr_len = sizeof(client_addr);
                
                //connet new client
                int new_conn_fd;
                ret = new_conn_fd = accept(fd,&client_addr,&client_addr_len);
                if(ret < 0) {
                    ERRNP("new conn fd accept");
                    continue;
                }

                //add new client fd to epoll
                event.data.fd = new_conn_fd;
                event.events = EPOLLIN;
                ret = epoll_ctl(epoll_fd,EPOLL_CTL_ADD,new_conn_fd,&event);
                if(ret < 0) {
                    ERRNP("new conn add epoll");
                    close(new_conn_fd);
                    continue;
                }
                cout << "new client connect" << endl;
            }
            else {
                //if now fd no buff   give it a buff
                if(fd_buff.find(fd) == fd_buff.end()) {
                   FdBuff temp;
                   temp.count = 0;
                   fd_buff[fd] = temp;
                }
                //cout << "recv fd " << fd << endl;

                //引用类型指向map中的对应fd
                FdBuff& t = fd_buff[fd];

                if(t.count<HEADLEN) {
                    ret = recv_len = recv(fd,t.buff+t.count,HEADLEN-t.count,MSG_DONTWAIT);
                    if(ret==0) {
                        ERRP("socket close");
                        close(fd);
                        continue;
                    }
                    if(ret < 0) {
                        ERRNP("recv msg");
                        close(fd);
                        continue;
                    }

                    t.count += recv_len;
                }
                else {
                    int datalen;
                    ret = datalen = GetDatalen(t.buff[1],t.buff[2]);
                    if(ret < 0) {
                        ERRP("data head solve");
                        close(fd);
                        continue;
                    }

                    ret = recv_len = recv(fd,t.buff+t.count,datalen+HEADLEN-t.count,MSG_DONTWAIT);
                    if(ret==0) {
                        ERRP("socket close");
                        close(fd);
                        continue;
                    }
                    if(ret < 0) {
                        ERRNP("recv msg");
                        close(fd);
                        continue;
                    }
                    t.count += recv_len;
                    
                    //data is whole then push it to msg queue
                    if(t.count == HEADLEN+datalen) {
                       FdData fddata;
                       fddata.fd = fd;
                       fddata.len = datalen;
                       fddata.type = t.buff[0];
                       memcpy(fddata.buff,t.buff+HEADLEN,datalen);
                       dataQ.push(fddata);
                       t.count = 0;
                    }
                }

                
                
            }
        }
        return 1;

    }

    int CloseFd(int fd) {
        if(fd_buff.find(fd)!=fd_buff.end()) {
           fd_buff.erase(fd_buff.find(fd));
           close(fd);    
        }
    }

    //send msg stream to fd, buff is msg stream, len is length of msg stream
    int send_len;
    int Send(int fd, char* buff, int optype, int datalen) {
        buff[0] = optype;
    
        buff[1] = (datalen>>6)+1;
        buff[2] = datalen-((datalen>>6)<<6)+1;

        if(fd_buff.find(fd) == fd_buff.end()) {
            ERRP("msg send fd not find");
            return -1;
        }

        ret = send_len = send(fd,buff,datalen+HEADLEN,0);
        //for(int i = 0;i < datalen+HEADLEN;i++) {
        //    cout << (int)buff[i] << " ";
        //} cout << endl;
        if(ret < 0) {
            ERRNP("send msg");
            close(fd);
            return -1;
        }

        return 1;
    }

    //broadcast buff to everyone in mp
    int Broadcast(map<int,string>& mp, char* buff, int datatype, int datalen) {
        buff[0] = datatype;
        
        buff[1] = (datalen>>6)+1;
        buff[2] = datalen-(datalen>>6)+1;

        int fd;
        for(map<int,string>::iterator it = mp.begin();it != mp.end();it++) {
            fd = it->first;
            //cout << "broadcast fd " << fd << endl;
            if(fd_buff.find(fd) == fd_buff.end()) {
                ERRP("broad cast");
                continue;
            } 
            ret = send(fd,buff,datalen+HEADLEN,0);
            if(ret < 0) {
                ERRNP("broad cast send");
                close(fd);
                continue;
            }
            //for(int i = 0;i < datalen + HEADLEN;i++) {
            //    cout << (int)buff[i] << " ";
            //} cout << endl;
        }
    }

    //close all fd
    int myclose() {
        close(epoll_fd);
        close(listen_fd);
        return 1;
    }
};

map<int,string> login_player_fd;
map<string,int> login_player_name;
map<string,int> login_player_nametoid;
map<int,FramOpt> optMp;//存储一帧的所有用户的操作
vector<FramPackage> fpdv;

class IDManger {
public :
    static int GetID() {
        static int ID = 0;
        return ++ID;
    }
};

#define EACHFRAMTIMELEN 20
#define MAXPLAYER 100
int ptof[MAXPLAYER];
int main()
{
    int NEEDPLAYER;
    cout << "please input player number : ";
    cin >> NEEDPLAYER;
    int ret = -1;   //recive return value to judge error
    mp.clear();
    ret = ReadInfFromFile(mp);
    if(ret < 0) {
        ERRP("Read error");
        return 0;
    }


    for(int i = 0;i < MAXPLAYER;i++) {
        ptof[i] = 0;
    }

    login_player_fd.clear();
    login_player_name.clear();
    optMp.clear();

    Server serv;
    serv.InitSocket(server_ip_port);
    double timelen = 0;

    bool gameplay = false;//flag game if begin
    struct timeval pre, now;//pre time  and  now time
    int nframid = 0;//now fram id
    
    bool iftimebegin = false;
    gettimeofday(&pre, NULL);

   
    FdData fddata;
    char* sbuff = serv.sbuff;
    char* buff;
    int type, len, fd, datalen;
    bool ifsend;
    int id, cnt;
    while(1) {
        ret = serv.EventsSolve();
        if(ret < 0) {
            ERRP("serv events solve");
            serv.myclose();
            break;
        }
        
        //游戏用户数量已满足要求，就开始游戏
        if(login_player_fd.size() == NEEDPLAYER) {
            gameplay = true;
        }/*
        else if(login_player_fd.size() > NEEDPLAYER) {
            ERRP("login player number bigger");
            serv.myclose();
            break;
        }*/


        while(serv.dataQ.size() > 0) {
            fddata = serv.dataQ.front();
            serv.dataQ.pop();

            type = fddata.type;//data type
            len = fddata.len;//data len
            fd = fddata.fd;//data from fd
            
            ifsend = true;//if need send msg

            buff = fddata.buff;//data stream buff pointer point fddata.buff

            switch(type) {
            case REGISTEREDTYPE : {
                                RegisteredReq req;
                                RegisteredRes res;    

                                ret = req.ParseFromArray(buff,len);
                                if(ret == false) {
                                    ERRP("registered req parsefromarray");
                                    break;
                                }

                                ret = Registered(req,res);
                                if(ret < 0) {
                                    ERRP("Registered");
                                    break;
                                }
                                
                                ret = res.SerializeToArray(sbuff+HEADLEN,MAXBUFF-HEADLEN);
                                if(ret == false) {
                                    ERRP("registered res serializetoarray");
                                    break;
                                }

                                datalen = res.ByteSize();
                                ret = serv.Send(fd,sbuff,REGISTEREDTYPE,datalen);
                                if(ret < 0) {
                                    ERRP("registered send msg");
                                    break;
                                }

                                break;
                        }
            case LOGINTYPE : {
                                LoginReq req;
                                LoginRes res;

                                ret = req.ParseFromArray(buff,len);
                                if(ret == false) {
                                    ERRP("login parsefromarray");
                                    continue;
                                }

                                ret = Login(req,res);
                                if(ret < 0) {
                                    ERRP("login");
                                    continue;
                                }

                                
                                //登录用户填入map表
                                if(res.res()==1) {
                                    if(login_player_name.find(req.name()) != login_player_name.end()) {
                                        close(login_player_name[req.name()]);
                                        login_player_fd.erase(login_player_fd.find(login_player_name[req.name()]));
                                        login_player_name[req.name()] = fd;
                                        login_player_fd[fd] = req.name();
                                        ptof[login_player_nametoid[req.name()]] = 0;
                                    }
                                    else {
                                        if(login_player_name.size() < NEEDPLAYER) {
                                            int id = login_player_nametoid[req.name()] = IDManger::GetID();
                                            cout << "the " << id << " people login" << endl;
                                            ptof[login_player_nametoid[req.name()]] = 0;
                                            login_player_fd[fd] = req.name();
                                            login_player_name[req.name()] = fd;

                                            FramOpt opt;
                                            opt.set_id(login_player_nametoid[req.name()]);
                                            opt.set_optype(LOGINTYPE);
                                            opt.set_doplayername(req.name());
                                            optMp[fd] = opt;
                                        }
                                        else {
                                            res.set_res(0);
                                        }
                                    }
                                }

                                ret = res.SerializeToArray(sbuff+HEADLEN,MAXBUFF-HEADLEN);
                                if(ret == false) {
                                    ERRP("login res serializetoarray");
                                    break;
                                }


                                datalen = res.ByteSize();
                                ret = serv.Send(fd,sbuff,LOGINTYPE,datalen);
                                if(ret < 0) {
                                    ERRP("Login");
                                    break;
                                }
                                break;
                            }
            case FRAMOPTYPE : {
                                   //cout << "operate type" << endl;
                                   if(gameplay==false) {
                                       break;
                                   }
                                   
                                   FramOpt req, res;
                                   ret = req.ParseFromArray(buff,len);
                                   if(ret < 0) {
                                       ERRP("fram opt req parsefromarray");
                                       break;
                                   }

                                   //cout << "recv op " << fd << " " << req.doplayername() << endl; 
                                   optMp[fd] = req;
                                   break;
                                }
            case POSSYNTYPE : {
                                  cout << "possyn type" << endl;
                                  break;
                            }
            default : {
                            ERRP("msg type recv");
                            break;
                    }
            }
        }

        //满足要求，游戏开始,开始发帧
        if(gameplay==true) {
            if(iftimebegin==false) {
                iftimebegin = true;
                gettimeofday(&pre,NULL);
            } 
            gettimeofday(&now,NULL);
            //cout << "timelen "<< timelen << endl;
            timelen += (double)((now.tv_sec - pre.tv_sec)*1000000+(now.tv_usec-pre.tv_usec))/1000;
            pre = now;
            if(timelen >= EACHFRAMTIMELEN) {
                sbuff = serv.sbuff; 
                cout << "fram id " << nframid << endl; 
                timelen -= EACHFRAMTIMELEN; 
                FramPackage fp;

                fp.set_framend(false);
                fp.set_framid(nframid);

                //向帧包里面添加操作opt
                FramOpt* optp;
                for(map<int,FramOpt>::iterator it = optMp.begin();it != optMp.end();it++) {
                    optp = 0;
                    optp = fp.add_opts();
                    *optp = it->second;
                }
                
                //序列化帧包

                fpdv.push_back(fp);
                optMp.clear();
                nframid++;
                
                for(map<int,string>::iterator it = login_player_fd.begin();it != login_player_fd.end();it++) {
                    id = login_player_nametoid[it->second];
                    cnt = 0;
                    while(ptof[id]+1<=nframid && ++cnt<=1000) {
                        //ptof[id]++;
                        datalen = fpdv[ptof[id]].ByteSize();
                        ret = fpdv[ptof[id]].SerializeToArray(sbuff+HEADLEN,MAXBUFF-HEADLEN);
                        if(ret == false) {
                            ERRP("run fram serializetoarry");
                            continue;
                        }
                        ret = serv.Send(it->first,sbuff,FRAMPACKAGETYPE,datalen);
                        if(ret < 0) {
                            ERRP("serv send run fram");
                            //serv.CloseFd(it->first);
                            break;
                        }
                        ptof[id]++;
                    }
                }
                
                //fpdv.push_back(fp);
                //optMp.clear();
                //nframid++;
            }
        }

    }

    ret = WriteInfToFile(mp);
    if(ret < 0) {
        cout << "write inf error" << endl;
    }

    serv.myclose();

    return 0;
}
int Registered(RegisteredReq& req, RegisteredRes& res) {
    cout << "reg beg " << req.name() << " " << req.password() << endl;
    if(mp.find(req.name()) == mp.end() || mp[req.name()].password.length() == 0) {
        Player temp;
        temp.name = req.name();
        temp.password = req.password();
        mp[temp.name] = temp;
        cout << "register yes " << temp.name << endl;
        res.set_res(1);
    }
    else {
        res.set_res(0);
        cout << "registered " << req.name() << " || " << mp[req.name()].password.length() << endl;
    }
    cout << "registered " << res.res() << endl;
    return 1;
}
int Login(LoginReq& req, LoginRes& res) {
    if(mp.find(req.name()) != mp.end() && mp[req.name()].password == req.password()) {
        res.set_res(1);
        cout << req.name() << endl;
    }
    else {
        cout << req.name() << " " << req.password() << " " << mp[req.name()].password << endl;
        res.set_res(0);
    }
    return 1;
}
int ReadInfFromFile(map<string,Player>& mp) {
    fstream input(filename, ios::in | ios::binary);
    string name, password;
    Player temp;
    while(input >> name >> password) {
        temp.name = name;
        temp.password = password;
        mp[name] = temp;
    }
    input.close();
    return 1;
}
int WriteInfToFile(map<string,Player>& mp) {
    fstream output(filename, ios::out | ios::trunc | ios::binary);
    map<string,Player>::iterator it;
    for(it = mp.begin();it != mp.end();it++) {
        output << it->first << " " << it->second.password << endl;
    }
    output.close();
    return 1;
}

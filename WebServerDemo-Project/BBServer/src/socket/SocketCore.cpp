#include "SocketCore.h"

namespace NetWork {
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

}


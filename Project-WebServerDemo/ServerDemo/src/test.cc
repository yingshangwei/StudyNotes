#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <string.h>
#include <errno.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <sys/un.h>
#include <sys/stat.h>
#include <netdb.h>
#include <sys/wait.h>
#include <arpa/inet.h>

#include <iostream>
#include <sys/epoll.h>
#include <map>

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "message.h"
#include "parser.h"
#include "serialiser.h"
#include "errors.h"

#include <queue>

#include </usr/include/mysql/mysql.h>
using namespace std;



class Mysql {
public :
    MYSQL *conn = nullptr;
    MYSQL_RES *result;
    MYSQL_ROW row;
    int res;
    int Connect() {
        conn = new MYSQL();
        mysql_init(conn);
        auto p = mysql_real_connect(conn,"localhost","yswdra","yswdra","mqtt",0,NULL,0);
        if(!p) return -1;
    }
    int Query(char *sql) {
        res=mysql_query(conn,sql);
        if(res) {
            cout<<"query error "<<mysql_error(conn)<<endl;
            return false;
        } else {
            result = mysql_store_result(conn);
            if(result){
                int num_fields = mysql_num_fields(result);
                int num_rows = mysql_num_rows(result);
                cout << num_rows << " " << num_fields << endl;
                for(int i=0;i<num_rows;i++){
                    row = mysql_fetch_row(result);
                    if(row<=0) break;
                    for(int j=0;j<num_fields;j++){
                        cout<<row[j]<<"\t";
                    }
                    cout<<endl;
                }
            }
        }
        return res;
    }
    int AddNewTheme(string themeName) {
        //"insert into test values('user','123456')"
        res = mysql_query(conn,(string("")+"insert into theme values('" + themeName + "')").c_str());
        cout << "add new theme " + themeName + (res?"failed":"successful") << endl;
        return res;
    }
    int AddNewThemeMsg(string themeName, string msg) {
        res = mysql_query(conn,(string("")+"insert into thememsg values('" + themeName + "'" + ",'" + msg + "'" + ")").c_str());
        cout << "add new thememsg " + themeName + ":" + msg + "\t" + (res?"failed":"successful") << endl;
        return res;
    }
};
Mysql db;

//namespace server***************************************start****************************************
namespace server {
    #define ERRNP(s) fprintf(stderr, "%s error %s errno : %d\n", s,strerror(errno), errno)
    #define ERRP(s) fprintf(stderr, "%s error\n", s)

    const int MAX_LISTENFD = 1024; //最大监听端口数
    const int MAX_EVENTS = 1024;   //epoll最大事件数
    const int MAX_BUFF = 1024;     //读取缓冲区最大容量

    const int DEFAULt_PORT = 1883; //默认连接的端口

    class basic_server {
    public :
        int server_fd;                //服务器自身的fd
        int epoll_fd;                 //服务器中的epoll所使用的fd
        struct epoll_event event;     //用来做epoll event的临时变量
        struct epoll_event* events;   //用来指向epoll中待处理事件的内存块
        
        char buff[MAX_BUFF<<2]; //临时缓冲区

        int res;//接收函数返回值用，判断程序是否成功运行

        //存储连接的客户端的信息
        struct ClientInfo {
            int connectionTime;    //连接的时间
            string ip;             //客户端的IP
            //int port;            //客户端使用的端口
            int maxAliveTime;      //最大存活时间
            
            char buff[MAX_BUFF<<2];   //当前客户端的缓冲区
            int length;

            //用mqtt协议解析数据流所要使用
            mqtt_parser_t parser;
            //mqtt_serialiser_t serialiser;
            mqtt_message_t message;
            queue<mqtt_message_t> msgQueue;

            size_t nread = 0;
            int rc = 0, loops = 0;

            ClientInfo() : maxAliveTime(INT32_MAX), length(0) {
                initParser();
            };
            void initParser() {
                mqtt_parser_init(&parser);
                //mqtt_serialiser_init(&serialiser);
                mqtt_message_init(&message);
                nread = 0;
            }
            bool ifAlive() { return true; }
            int update(char *newData, int newDataLen) {
                //新增数据流
                newData[newDataLen] = 0;
                for(int i = 0;i < newDataLen;i++) {
                    buff[length++] = newData[i];
                }
                //length += newDataLen;
                cout << "update clien********************************" << endl;
                cout << "length :" << length << endl;
                for(int i = 0;i < length;i++) {
                    printf("0x%02x,", (uint8_t)buff[i]);
                } cout << endl;
                do {
                    //printf("  loop %d\n", ++loops);
                    //printf("    state: %d\n", parser.state);
                    //printf("    offset: %zu\n", nread);
                    rc = mqtt_parser_execute(&parser, &message, (uint8_t*)buff, length, &nread);
                    //printf("    rc: %d\n", rc);

                    if (rc == MQTT_PARSER_RC_WANT_MEMORY) {
                    //printf("    bytes requested: %zu\n", parser.buffer_length);
                        mqtt_parser_buffer(&parser, (uint8_t*)malloc(parser.buffer_length), parser.buffer_length);
                    }
                } while (rc == MQTT_PARSER_RC_CONTINUE || rc == MQTT_PARSER_RC_WANT_MEMORY);

                if (rc == MQTT_PARSER_RC_ERROR) {
                    printf("  error: %s\n", mqtt_error_string(parser.error));
                    return -1;
                }

                if(rc == MQTT_PARSER_RC_DONE) {
                    mqtt_message_dump(&message);
                    for(int i = nread;i < length;i++) {
                        buff[i-nread] = buff[i];
                    }
                    cout << "msg done" << endl;
                    cout << length << " " << nread << endl;
                    //length = length-nread;
                    length = 0;
                    msgQueue.push(message);
                    initParser();
                }
                return 0;
            }
        };
        map<int,ClientInfo> fdToClient; //在服务器中，客户端所使用的fd和客户端信息的映射表

        int Init(int port=DEFAULt_PORT, string ip="") {
            //fdToClient.clear();
            struct sockaddr_in server_addr;//服务端的监听地址

            //init local listen ip and port
            memset(&server_addr,0,sizeof(server_addr));
            server_addr.sin_family = AF_INET;
            server_addr.sin_addr.s_addr = htonl(INADDR_ANY);
            inet_aton(ip.c_str(), &server_addr.sin_addr);
            server_addr.sin_port = htons(port);

            //create socket
            res = server_fd = socket(AF_INET,SOCK_STREAM,0);
            if(res < 0) {
                ERRNP("socket create");
                return -1;
            }

            //bind port
            res = bind(server_fd,(struct sockaddr*)&server_addr,sizeof(server_addr));
            if(res < 0) {
                ERRNP("socket bind");
                return -1;
            }

            //listen fd
            res = listen(server_fd,MAX_LISTENFD);
            if(res < 0) {
                ERRNP("listen fs");
                close(server_fd);
                return -1;
            }

            //create epoll
            res = epoll_fd = epoll_create(1);
            if(res < 0) {
                ERRNP("epoll create");
                close(server_fd);
                return -1;
            }

            //malloc for events
            events = (struct epoll_event*)malloc(sizeof(struct epoll_event)*MAX_EVENTS);
            if(events==NULL) {
                ERRP("events malloc");
                close(server_fd);
                close(epoll_fd);
                return 0;
            }

            //add server_fd to epoll
            event.data.fd = server_fd;
            event.events = EPOLLIN;
            res = epoll_ctl(epoll_fd,EPOLL_CTL_ADD,server_fd,&event);
            if(res < 0) {
                ERRNP("epoll add listen fd");
                close(server_fd);
                close(epoll_fd);
                return -1;
            }

            
            return 0;
        }

        int Start() {
            cout << "server begin to listen!" << endl;
            int n; //record count of epoll_wait's events
            while(1) {
                //get socket events
                res = n = epoll_wait(epoll_fd,events,MAX_EVENTS, 2);
                if(res < 0) {
                    ERRNP("epoll wait");
                    close(server_fd);
                    close(epoll_fd);
                    return -1;
                }

                for(int i = 0;i < n;i++) {
                    int fd = events[i].data.fd;
                    int event_type = events[i].events;
                    if(!(event_type&EPOLLIN)) {
                        ERRNP("wait event i");
                        close(fd);
                        continue;
                    } else if(server_fd == fd) { //new conn
                        struct sockaddr_in client_addr;
                        socklen_t client_addr_len = sizeof(client_addr);

                        //connet new client
                        int new_conn_fd;
                        res = new_conn_fd = accept(fd,(sockaddr*)&client_addr,&client_addr_len);
                        if(res < 0) {
                            ERRNP("new conn fd accept");
                            continue;
                        }
                        cout << "new conn ip : " << inet_ntoa(client_addr.sin_addr) << endl;

                        event.data.fd = new_conn_fd;
                        event.events = EPOLLIN;
                        res = epoll_ctl(epoll_fd,EPOLL_CTL_ADD,new_conn_fd,&event);
                        if(res < 0) {
                            ERRNP("new conn add epoll");
                            close(new_conn_fd);
                            continue;
                        }
                        cout << "new conn add epoll" << endl;


                        //将新连接的客户端的信息存入fd-clinet映射表中
                        ClientInfo client;
                        client.ip = inet_ntoa(client_addr.sin_addr);
                        fdToClient[new_conn_fd] = client;
                    } else {
                        int recv_len;
                        res = recv_len = recv(fd,buff,MAX_BUFF-1,MSG_DONTWAIT);
                        if(res < 0 || fdToClient.find(fd)==fdToClient.end()) {
                            ERRNP("recv msg from client");
                            close(fd);
                            continue;
                        }
                        if(recv_len==0) {
                            cout << "close " << fdToClient[fd].ip << endl;
                            close(fd);
                            continue;
                        }
                        buff[recv_len] = '\0';
                        res = fdToClient[fd].update(buff,recv_len);
                        if(res<0) {
                            close(fd);
                            cout << "client update error!" << endl;
                            continue;
                        }
                        cout << "msg len : " << recv_len << endl;
                        for(int i = 0;i < recv_len;i++) {
                            printf("0x%02x,", (uint8_t)buff[i]);
                        } cout << endl;
                        auto &tq = fdToClient[fd].msgQueue;
                        while(!tq.empty()) {
                            auto msg = tq.front();
                            tq.pop();
                            if(msg.common.type == MQTT_TYPE_CONNECT) {
                                mqtt_message_t message;

                                // message.common.type = MQTT_TYPE_CONNACK;
                                // message.common.length = 2;
                                // message.connack.

                                // mqtt_serialiser_t serialiser;
                                // size_t packet_length = mqtt_serialiser_size(&serialiser, &message);
                                // uint8_t* packet = (uint8_t*)malloc(packet_length);
                                // mqtt_serialiser_write(&serialiser, &message, packet, packet_length);
                                
                                uint8_t cmd[]={ 0x20/*报文类型*/, 0x02/*剩余长度*/ ,0x00,0x00/*最后两个字节可变报头表示返回状态码*/ };
                                res = send(fd,cmd,sizeof(cmd),0);
                                if(res<0) {
                                    ERRNP("send msg");
                                    close(fd);
                                    continue;
                                }
                            } else if(msg.common.type == MQTT_TYPE_SUBSCRIBE) {
                                cout << "send subscribe" << endl;
                                uint8_t cmd[] = { 
                                    0x90,0x04,
                                    (uint8_t)(msg.subscribe.message_id>>4&0x0f),(uint8_t)(msg.subscribe.message_id&0x0f),
                                    0x00,0x00
                                };
                                res = send(fd,cmd,sizeof(cmd),0);
                                if(res<0) {
                                    ERRNP("send msg");
                                    close(fd);
                                    continue;
                                }
                            } else if(msg.common.type == MQTT_TYPE_PUBLISH) {
                                string topic_name, content;
                                for(int i = 0;i < msg.publish.topic_name.length;i++) {
                                    topic_name.push_back(msg.publish.topic_name.data[i]);
                                }
                                for(int i = 0;i < msg.publish.content.length;i++) {
                                    content.push_back(msg.publish.content.data[i]);
                                }
                                res = db.AddNewTheme(topic_name);
                                res = db.AddNewThemeMsg(topic_name,content);
                            }
                        }
                    }
                }


            }
        }
    };

}
//namespace server**************************************end**********************************************



int main() {
    using namespace server;
    basic_server Server;
    char sql[] = "select * from theme";
    
    db.Connect();
    //db.AddNewTheme("testttt");
    //db.AddNewThemeMsg("testttt", "asdfhaksjdhflasd");
    //db.Query(sql);

    Server.Init();
    Server.Start();

    return 0;

}

/*
g++ -o  server-demo server-demo.cpp -I /usr/include/mysql -L/usr/lib/mysql -lmysqlclient -lm -lz

*/
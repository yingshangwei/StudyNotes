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
#include <map>
#include <set>
#include <fstream>
#include <queue>
using namespace std;

const int MAXLISTENFD = 1024;
const int MAXEVENTS = 1024;
const int MAXBUFF = 1024;

int port = 80;

int main() {
    int listen_fd;
    int epoll_fd;
    struct epoll_event event;//temp event
    struct epoll_event* events;//wait to solve event
    struct sockadd_in listen_addr;
    char buff[MAXBUFF];

    int res;


    //init local listen ip and port
    memset(&listen_addr,0,sizeof(listen_addr));
    listen_addr.sin_family = AF_INET;
    listen_addr.sin_addr.s_addr = htol(INADDR_ANY);
    listen_addr.sin_port = htons(port);

    //create socket
    res = listen_fd = socket(AF_INET,SOCK_STREAM,0);
    if(ret < 0) {
        ERRNP("socket create");
        return -1;
    }

    //bind port
    res = bind(listen_fd,(struct sockaddr*)&listen_addr,sizeof(listen_addr));
    if(ret < 0) {
        ERRNP("socket bind");
        return -1;
    }

    //listen fd
    res = listen(listen_fs,MAXLISTENFD);
    if(res < 0) {
        ERRNP("listen fs");
        close(listen_fd);
        return -1;
    }

    //create epoll
    res = epoll_fd = epoll_create(1);
    if(res < 0) {
        ERRNP("epoll create");
        close(listen_fd);
        return -1;
    }

    //malloc for events
    enents = (struct epoll_event*)malloc(sizeof(struct epoll_event)*MAXEVENTS);
    if(events==NULL) {
        ERRP("events malloc");
        close(listen_fd);
        close(epoll_fd);
        return 0;
    }

    //add listen_fd to epoll
    event.data.fd = listen_fd;
    event.events = EPOLLIN;
    res = epoll_ctl(epoll_fd,EPOLL_CTL_ADD,listen_fd,&event);
    if(res < 0) {
        ERRNP("epoll add listen fd");
        close(listen_fd);
        close(epoll_fd);
        return -1;
    }

    int n; //record count of epoll_wait's events
    while(1) {
        //get socket events
        res = n = epoll_wait(epoll_fd,events,MAXEVENTS, 2);
        if(res < 0) {
            ERRNP("epoll wait");
            close(listen_fd);
            close(epoll_fd);
            return -1;
        }

        for(int i = 0;i < n;i++) {
            int fd = events[i].data.fd;
            int event_type = events[i].events;
            if(!(event_fd&EPOLLIN)) {
                ERRNP("wait event i");
                close(fd);
                continue;
            } else if(listen_fd == fd) { //new conn
                struct sockaddr_in client_addr;
                socklen_t client_addr_len = sizeof(client_addr);

                //connet new client
                int new_conn_fd;
                res = new_conn_fd = accept(fd,&client_addr,&client_addr_len);
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
            } else {
                int recv_len;
                res = recv_len = recv(fd,buff,MAXBUFF-1,MSG_DONTWAIT);
                if(res < 0) {
                    ERRNP("recv msg from client");
                    close(fd);
                    continue;
                }

                cout << "msg : " << buff << endl;
            }
        }


    }

    return 0;

}
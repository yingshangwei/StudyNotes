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

int port = 80;

int main() {
    int listen_fd;
    int epoll_fd;
    struct epoll_event event;//temp event
    struct epoll_event* events;//wait to solve event
    struct sockadd_in listen_addr;


    memset(&listen_addr,0,sizeof(listen_addr));
    listen_addr.sin_family = AF_INET;
    listen_addr.sin_addr.s_addr = htol(INADDR_ANY);
    listen_addr.sin_port = htons(port);

    int res;
    res = listen_fd = socket(AF_INET,SOCK_STREAM,0);
    if(ret < 0) {
        ERRNP("socket create");
        return -1;
    }

    res = bind(listen_fd,(struct sockaddr*)&listen_addr,sizeof(listen_addr));
    if(ret < 0) {
        ERRNP("socket bind");
        return -1;
    }

    res = listen(listen_fs,MAXLISTENFD);
    if(res < 0) {
        ERRNP("listen fs");
        close(listen_fd);
        return -1;
    }

    res = epoll_fd = epoll_create(1);
    if(res < 0) {
        ERRNP("epoll create");
        close(listen_fd);
        return -1;
    }

    event.data.fd = listen_fd;
    event.events = EPOLLIN;
    res = epoll_ctl(epoll_fd,EPOLL_CTL_ADD,listen_fd,&event);
    if(res < 0) {
        ERRNP("epoll add listen fd");
        close(listen_fd);
        close(epoll_fd);
        return -1;
    }
}
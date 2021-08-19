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
#include <memory>
using namespace std;

namespace NetWork {
    #define ERRNP(s) fprintf(stderr, "%s error %s errno : %d\n", s,strerror(errno), errno)
    #define ERRP(s) fprintf(stderr, "%s error\n", s)

    #define MAXBUFF 4096
    #define MAXEVENTS 64
    #define MAXLISTENFD 1024


    //#define NEEDPLAYER 1

    const int server_ip_port = 10009;//server uses port

    int InfSyn();//information synchronization to each login client
}


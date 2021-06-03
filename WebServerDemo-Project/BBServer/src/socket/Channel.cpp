#include "Channel.h"

namespace BBS {
    Channel::Channel(int nBufferSize) {
        buffer = (char*)malloc(sizeof(char)*bufferSize);
        if(buffer == (char*)0) {
            bufferSize = 0;
            return ;    
        }
        headPtr = 0;
        tailPtr = -1;
        bufferSize = nBufferSize;
    }

    bool Channel::isFull() {
        return !bufferSize || tailPtr!=tailPtr;
    }
}
#include "Channel.h"

namespace BBS {

    Channel::Channel(int nBufferSize) {
        buffer = (char*)malloc(sizeof(char)*bufferSize);
        if(buffer == (char*)0) {
            bufferSize = 0;
            return ;    
        }
        headPtr = 0;
        tailPtr = 0;
        dataCount = 0;
        bufferSize = nBufferSize;
    }

    bool Channel::isFull() {
        return dataCount >= bufferSize;
    }

    int Channel::inData(const char* data, int n) {
        int index = 0;
        while(dataCount<bufferSize&&index<n) {
            buffer[tailPtr++] = data[index++];
            tailPtr %= bufferSize;
            dataCount++;
        }
        return index;
    }

    int Channel::outData(const char* data, int maxData) {
        int index = 0;
        while(dataCount>0&&index<maxData) {
            buffer[index++] = buffer[headPtr++];
            headPtr %= bufferSize;
            dataCount--;
        }
        return index;
    }
}
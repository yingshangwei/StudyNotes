#include "Channel.h"

namespace BBS {
    
    Channel::Channel(int nBufferSize) {
        bufferSize = nBufferSize>0?nBufferSize:DEFAULT_CHANNEL_BUFFER_SIZE;
        buffer = (char*)malloc(sizeof(char)*bufferSize);
        if(buffer == nullptr) {
            bufferSize = headPtr = tailPtr = dataCount = 0;
            return ;
        }
        headPtr = 0;
        tailPtr = 0;
        dataCount = 0;
    }
    Channel::~Channel() {
        if(buffer!=nullptr) free(buffer);
    }

    bool Channel::isFull() {
        return dataCount >= bufferSize;
    }

    int Channel::reset(int n) {
        std::lock_guard<std::mutex> lock(channelMutex);
        if(n != bufferSize && n >= 0) {
            if(buffer!=nullptr) free(buffer);
            bufferSize = n;
            buffer = (char*)malloc(sizeof(char)*bufferSize);
            if(buffer == nullptr) {
                bufferSize = headPtr = tailPtr = dataCount = 0;
                return -1;
            }
        }
        headPtr = 0;
        tailPtr = 0;
        dataCount = 0;
    }

    int Channel::inData(const char* data, int n) {
        std::lock_guard<std::mutex> lock(channelMutex);
        int index = 0;
        //TODO::优化数据拷贝方案，考虑memory copy
        while(dataCount<bufferSize&&index<n) {
            buffer[tailPtr++] = data[index++];
            tailPtr %= bufferSize;
            dataCount++;
        }
        return index;
    }

    int Channel::outData(const char* data, int maxData) {
        std::lock_guard<std::mutex> lock(channelMutex);
        int index = 0;
        if(maxData < 0) maxData = bufferSize;
        //TODO::优化数据拷贝方案，考虑memory copy
        while(dataCount>0&&index<maxData) {
            buffer[index++] = buffer[headPtr++];
            headPtr %= bufferSize;
            dataCount--;
        }
        return index;
    }
}
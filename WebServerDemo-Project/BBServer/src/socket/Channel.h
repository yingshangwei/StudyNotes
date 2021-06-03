#include <iostream>
#include <cstdlib>
#include <mutex>

using namespace std;

namespace BBS {
    const int DEFAULT_CHANNEL_BUFFER_SIZE = 1024;
    class Channel {
    public :
        Channel(int nBufferSize = DEFAULT_CHANNEL_BUFFER_SIZE);
        bool isFull();
        virtual int inData(const char* data, int n);
        virtual int outData(const char* data, int maxData = -1);

    private:
        char *buffer;
        int bufferSize;
        int headPtr, tailPtr;
        int dataCount;
                
    };

}
#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>
#include <string>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <map>
#include <set>

using namespace std;

class Server {
public :
    static string fun(string msg) {
        return "respone : " + msg;
    }
};

class Proxy {
public :
    static string request(string msg) {
        return Server::fun(msg);
    }
};

class Client {
public :
    string request(string msg) {
        return Proxy::request(msg);
    }
    void listen() {
        while(1) {
            string msg;
            cout << "Please cin msg : " << endl;
            cin >> msg;
            cout << request(msg) << endl;
        }
    }
};

int main() {
    Client client;
    client.listen();


    int T;
    cin >> T;
    return 0;
}

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

class AbstractProduct {
public :
    virtual void operaction() = 0;
};

class Hardware : public AbstractProduct{
public :
    virtual void operaction() = 0;
};

class Printer : public Hardware {
public :
    void operaction() {
        cout << "print!" << endl;
    }
};

class Copier : public Hardware {
public :
    void operaction() {
        cout << "copy!" << endl;
    }
};

class Software : public AbstractProduct {
public :
    virtual void operaction() = 0;
};

class BankCardRecognitionSystem : public Software {
public :
    void operaction() {
        cout << "bank card recognition!" << endl;
    }
};

class IDCardRecognitionSystem : public Software {
public :
    void operaction() {
        cout << "ID card recognition!" << endl;
    }
};

class DriverLicenseRecognitionSystem : public Software {
public :
    void operaction() {
        cout << "driver license recognition!" << endl;
    }
};

class AbstractFactory {
public :
    virtual AbstractProduct* createProduct(int type) = 0;
};

class HardwareFactory : public AbstractFactory {
public :
    AbstractProduct* createProduct(int type) {
        switch(type) {
            case 1 : return new Printer();
            case 2 : return new Copier();
            default : {
                cout << "can't product this type product!" << endl;
                return nullptr;
            }
        }
    }
};

class SoftwareFactory : public AbstractFactory {
public :
    AbstractProduct* createProduct(int type) {
        switch(type) {
            case 1 : return new BankCardRecognitionSystem();
            case 2 : return new IDCardRecognitionSystem();
            case 3 : return new DriverLicenseRecognitionSystem();
            default : {
                cout << "can't product this type product!" << endl;
                return nullptr;
            }
        }
    }
};

int main() {
    HardwareFactory hdfc;
    SoftwareFactory stfc;
    AbstractProduct *a = hdfc.createProduct(1), *b = hdfc.createProduct(2);
    AbstractProduct *aa = stfc.createProduct(1), *bb = stfc.createProduct(2), *cc = stfc.createProduct(3);

    a->operaction();
    b->operaction();
    aa->operaction();
    bb->operaction();
    cc->operaction();

    int T;
    cin >> T;
    return 0;
}

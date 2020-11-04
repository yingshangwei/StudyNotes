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

template<typename T>
class Element {
public :
    T a;
    Element *pre, *next;
    Element(T e) : a(e), pre(nullptr), next(nullptr) {}
};

template<typename T>
class Sequence {
public :
    virtual void push(T e) {
        if(tail == nullptr) {
            head = tail = new Element<T>(e);
        } else {
            tail->next = new Element<T>(e);
            tail->next->pre = tail;
            tail = tail->next;
        }
    }
    virtual T pop() {
        if(tail==nullptr) {
            cout << "error" << endl;
            return T();
        } else {
            T res = tail->a;
            Element<T> *temp = tail->pre;
            delete tail;
            if(temp==nullptr) {
                head = tail = nullptr;
            } else {
                temp->next = nullptr;
            }
            tail = temp;
            return res;
        }
    }

    Element<T> *head = nullptr, *tail = nullptr;
};

template<typename T>
class Queue : public Sequence<T> {
public :
    T pop() {
        if(this->head==nullptr) {
            cout << "error" << endl;
            return T();
        } else {
            T res = this->head->a;
            Element<T> *temp = this->head->next;
            delete this->head;
            if(temp==nullptr) {
               this->head = this->tail = nullptr;
            } else {
                this->head = temp;
                this->head->pre = nullptr;
            }
            return res;
        }
    }
};

template<typename T>
class Stack : public Sequence<T> {
};

int main() {

    Queue<int> q;
    cout << "test : queue" << endl;
    cout << "push : ";
    for(int i = 0; i < 10;i++) {
        cout << i << " ";
        q.push(i);
    } cout << endl;
    cout << "pop : ";
    for(int i = 0;i < 10;i++) {
        cout << q.pop() << " ";
    } cout << endl;

    Stack<int> st;
    cout << "test : stack" << endl;
    cout << "push : ";
    for(int i = 0; i < 10;i++) {
        cout << i << " ";
        st.push(i);
    } cout << endl;
    cout << "pop : ";
    for(int i = 0;i < 10;i++) {
        cout << st.pop() << " ";
    } cout << endl;


    int T;
    cin >> T;
    return 0;
}

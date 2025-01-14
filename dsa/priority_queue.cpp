#include <bits/stdc++.h>
#define SIZE 10

using namespace std;

struct item {
        int number;
       
        // higher number, higher priority
        int priority;
};

item pq[SIZE];

void enqueue(int number, int priority) {
        int i = 1;
        while (pq[i].priority > priority && i <= SIZE) {
                i++;
        }
        for (int j = SIZE; j > i; j--) {
                pq[j] = pq[j - 1];
        }
        pq[i].number = number;
        pq[i].priority = priority;
}

item dequeue() {
        item temp = pq[1];
        for (int i = 1; i < SIZE; i++) {
                pq[i] = pq[i + 1];
        }
        return temp;
}

void print() {
        for (int i = 1; i <= SIZE; i++) {
                cout << pq[i].number << " ";
        }
        cout << endl;
}

void extract_max() {
        cout << dequeue().number << endl;
}


int main() {
        enqueue(3, 1);
        enqueue(2, 2);
        enqueue(8, 3);
        enqueue(2, 4);
        enqueue(1, 5);
        enqueue(0, 6);

        print();
}

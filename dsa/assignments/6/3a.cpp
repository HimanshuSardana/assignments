// Find the size of a circular linked list
#include <bits/stdc++.h>

using namespace std;

struct Node {
        int data;
        Node* next;
};

Node* createNode(int d) {
        Node* newNode = new Node();
        newNode->data = d;
        newNode->next = NULL;
        return newNode;
}

void printList(Node* head) {
        Node* temp = head;
        while (temp) {
                cout << temp->data << " ";
                temp = temp->next;
        }
        cout << endl;
}

int main() {
        Node* head = createNode(1);
        head->next = createNode(2);
        head->next->next = createNode(3);
        head->next->next->next = createNode(4);
        head->next->next->next->next = head;

        Node* temp = head;
        int size = 0;
        do {
                size++;
                temp = temp->next;
        } while (temp != head);

        cout << "Size of the circular linked list is: " << size << endl;

        return 0;
}

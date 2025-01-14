// Find size of doubly linked list
#include <bits/stdc++.h>

using namespace std;

struct Node {
        int data;
        Node* next;
        Node* prev;
};

Node* createNode(int d) {
        Node* newNode = new Node();
        newNode->data = d;
        newNode->next = NULL;
        newNode->prev = NULL;
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

int size(Node* head) {
        Node* temp = head;
        int count = 0;
        while (temp) {
                count++;
                temp = temp->next;
        }
        return count;
}

int main() {
        Node* head = createNode(1);
        head->next = createNode(2);
        head->next->prev = head;
        head->next->next = createNode(3);
        head->next->next->prev = head->next;
        head->next->next->next = createNode(4);
        head->next->next->next->prev = head->next->next;

        printList(head);
        cout << "Size of doubly linked list is: " << size(head) << endl;

        return 0;
}

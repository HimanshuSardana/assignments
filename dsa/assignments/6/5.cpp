// check if a linked list is circular
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

bool isCircular(Node* head) {
        Node* temp = head;
        while (temp) {
                if (temp->next == head) {
                        return true;
                }
                temp = temp->next;
        }
        return false;
}

int main() {
        Node* head = createNode(1);
        head->next = createNode(2);
        head->next->next = createNode(3);
        head->next->next->next = createNode(4);
        head->next->next->next->next = head;

        if (isCircular(head)) {
                cout << "It is circular" << endl;
        } else {
                cout << "It is not circular" << endl;
        }

        return 0;
}

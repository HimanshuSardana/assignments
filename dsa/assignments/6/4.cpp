// In doubly linked list, check if the given linked list is palindrome or not.
#include <bits/stdc++.h>

using namespace std;

struct Node {
        char data;
        Node* prev;
        Node* next;
};

Node* createNode(char data) {
        Node* newNode = new Node();
        newNode->data = data;
        newNode->next = NULL;
        newNode->prev = NULL;

        return newNode;
}

void printList(Node* head) {
        while(head != NULL) {
                cout << head->data;
                head = head->next;
        }
}

int main() {
        vector<char> L = {'r', 'a', 'c', 'e', 'c', 'a', 'r'}; 

        Node* head = createNode(L[0]);
        Node* temp = head;
        for(int i = 1; i < L.size(); i++) {
                Node* newNode = createNode(L[i]);
                temp->next = newNode;
                newNode->prev = temp;
                temp = temp->next;
        }

        Node* tail = temp;

        printList(head);
        
        int flag = 0;
        while(head != NULL && tail != NULL) {
                if(head->data != tail->data) {
                        flag = 1;
                        break;
                }
                head = head->next;
                tail = tail->prev;
        }

        cout << flag;
}

#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
        int data;
        struct Node *next;
} Node;

Node *createNode(int data) {
        Node *newNode = (Node *)malloc(sizeof(Node));
        newNode->data = data;
        newNode->next = NULL;
        return newNode;
}

Node *insertAtBeginning(Node *head, int data) {
        Node *newNode = createNode(data);
        newNode->next = head;
        head = newNode;
}

Node *insertAtEnd(Node *head, int data) {
        Node *newNode = createNode(data);
        Node *temp = head;
        while(temp->next != NULL) {
                temp = temp->next;
        }
        temp->next = newNode;
}

int main() {
        Node *head = createNode(1);
        Node *second = createNode(2);
        Node *third = createNode(3);

        head->next = second;
        second->next = third;

        head = insertAtBeginning(head, 0);
        third = insertAtEnd(head, 4);

        Node *temp = head;
        while(temp != NULL) {
                printf("%d\n", temp->data);
                temp = temp->next;
        }

        return 0;
}

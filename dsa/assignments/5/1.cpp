/*Develop a menu driven program for the following operations of on a Singly Linked*/
/*List.*/
/*(a) Insertion at the beginning.*/
/*(b) Insertion at the end.*/
/*(c) Insertion in between (before or after a node having a specific value, say 'Insert a*/
/*new Node 35 before/after the Node 30').*/
/*(d) Deletion from the beginning.*/
/*(e) Deletion from the end.*/
/*(f) Deletion of a specific node, say 'Delete Node 60').*/
/*(g) Search for a node and display its position from head.*/
/*(h) Display all the node values*/

#include <bits/stdc++.h>

using namespace std;

struct Node {
        int data;
        Node* next;
};

Node* createNode(int data) {
        Node* newNode = new Node();
        newNode->data = data;
        newNode->next = NULL;
        return newNode;
}

void insertAtBeginning(Node** head, int data) {
        Node* newNode = createNode(data);
        newNode->next = *head;
        *head = newNode;
}

void insertAtEnd(Node** head, int data) {
        Node* newNode = createNode(data);
        if (*head == NULL) {
                *head = newNode;
                return;
        }
        Node* temp = *head;
        while (temp->next != NULL) {
                temp = temp->next;
        }
        temp->next = newNode;
}

void insertInBetween(Node** head, int data, int value) {
        Node* newNode = createNode(data);
        Node* temp = *head;
        while (temp->data != value) {
                temp = temp->next;
        }
        newNode->next = temp->next;
        temp->next = newNode;
}

void deleteFromBeginning(Node** head) {
        if (*head == NULL) {
                cout << "List is empty" << endl;
                return;
        }
        Node* temp = *head;
        *head = temp->next;
        delete temp;
}

void deleteFromEnd(Node** head) {
        if (*head == NULL) {
                cout << "List is empty" << endl;
                return;
        }
        Node* temp = *head;
        Node* prev = NULL;
        while (temp->next != NULL) {
                prev = temp;
                temp = temp->next;
        }
        prev->next = NULL;
        delete temp;
}

void deleteNode(Node** head, int value) {
        if (*head == NULL) {
                cout << "List is empty" << endl;
                return;
        }
        Node* temp = *head;
        Node* prev = NULL;
        while (temp->data != value) {
                prev = temp;
                temp = temp->next;
        }
        prev->next = temp->next;
        delete temp;
}

void searchNode(Node* head, int value) {
        Node* temp = head;
        int pos = 1;
        while (temp->data != value) {
                temp = temp->next;
                pos++;
        }
        cout << "Position of " << value << " is " << pos << endl;
}

void printList(Node* head) {
        Node* temp = head;
        while (temp != NULL) {
                cout << temp->data << " ";
                temp = temp->next;
        }
        cout << endl;
}

int main() {
        vector<int> values = {10, 20, 30, 40};
        Node* head = createNode(values[0]);

        Node* temp = head;
        for (int i = 1; i < values.size(); i++) {
                temp->next = createNode(values[i]);
                temp = temp->next;
        }
        cout << "1. Insert at beginning" << endl;
        cout << "2. Insert at end" << endl;
        cout << "3. Insert in between" << endl;
        cout << "4. Delete from beginning" << endl;
        cout << "5. Delete from end" << endl;
        cout << "6. Delete a specific node" << endl;
        cout << "7. Search for a node" << endl;
        cout << "8. Display all the node values" << endl;
        cout << "9. Exit" << endl;


        while(1) {
                int choice;
                cout << "Enter your choice: ";
                cin >> choice;

                switch(choice) {
                        case 1: {
                                int data;
                                cout << "Enter data: ";
                                cin >> data;
                                insertAtBeginning(&head, data);
                                break;
                        }

                        case 2: {
                                int data;
                                cout << "Enter data: ";
                                cin >> data;
                                insertAtEnd(&head, data);
                                break;
                        }

                        case 3: {
                                int data, value;
                                cout << "Enter data: ";
                                cin >> data;
                                cout << "Enter value: ";
                                cin >> value;
                                insertInBetween(&head, data, value);
                                break;
                        }

                        case 4: {
                                deleteFromBeginning(&head);
                                break;
                        }

                        case 5: {
                                deleteFromEnd(&head);
                                break;
                        }

                        case 6: {
                                int value;
                                cout << "Enter value: ";
                                cin >> value;
                                deleteNode(&head, value);
                                break;
                        }

                        case 7: {
                                int value;
                                cout << "Enter value: ";
                                cin >> value;
                                searchNode(head, value);
                                break;
                        }

                        case 8: {
                                printList(head);
                                break;
                        }

                        default: {
                                exit(0);
                        }
                }
        }
}

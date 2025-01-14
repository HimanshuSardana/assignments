/*Write a program to count the number of occurrences of a given key in a singly linked*/
/*list and then delete all the occurrences. For example, if given linked list is 1->2->1-*/
/*>2->1->3->1 and given key is 1, then output should be 4. After deletion of all the*/
/*occurrences of 1, the linked list is 2->2->3*/

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

void printList(Node* head) {
        Node* temp = head;
        while (temp != NULL) {
                cout << temp->data << " ";
                temp = temp->next;
        }
        cout << endl;
}

int main() {
        vector<int> values = {1,2,1,2,1,3,1};
        Node* head = createNode(values[0]);

        Node* temp = head;
        for (int i = 1; i < values.size(); i++) {
                temp->next = createNode(values[i]);
                temp = temp->next;
        }

        cout << "List before deletion: ";
        printList(head);

        int key = 1;
        int count = 0;

        Node* current = head;
        while (current != NULL) {
                if (current->data == key) {
                        count++;
                }
                current = current->next;
        }

        cout << "Number of occurrences of " << key << " is " << count << endl;

        Node* prev = NULL;
        Node* temp1 = head;

        while(temp1 != NULL) {
                if (temp1->data == key) {
                        if (prev == NULL) {
                                head = temp1->next;
                                delete temp1;
                                temp1 = head;
                        } else {
                                prev->next = temp1->next;
                                delete temp1;
                                temp1 = prev->next;
                        }
                } else {
                        prev = temp1;
                        temp1 = temp1->next;
                }
        }

        cout << "List after deletion: ";
        printList(head);
}

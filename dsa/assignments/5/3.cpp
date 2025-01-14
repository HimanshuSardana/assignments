// WAP to find the middle of a linked list

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
        vector<int> values = {1,2,3,4,5};
        Node* head = createNode(values[0]);

        Node* temp = head;
        for (int i = 1; i < values.size(); i++) {
                temp->next = createNode(values[i]);
                temp = temp->next;
        }

        Node* slow = head;
        Node* fast = head;

        while (fast != NULL && fast->next != NULL) {
                slow = slow->next;
                fast = fast->next->next;
        }

        cout << "Middle of the linked list is " << slow->data << endl;

}


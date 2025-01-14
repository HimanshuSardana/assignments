/*Display all the node values in a circular linked list, repeating value of head node at the*/
/*end too. For example, if elements present in the circular linked list starting from head*/
/*are 20 → 100 → 40 → 80 → 60, then output should be displayed as 20 100 40 80 60*/
/*20*/

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
        do {
                cout << temp->data << " ";
                temp = temp->next;
        } while (temp != head);
        cout << head->data;
        cout << endl;
}

int main() {
        Node* head = createNode(20);
        head->next = createNode(100);
        head->next->next = createNode(40);
        head->next->next->next = createNode(80);
        head->next->next->next->next = createNode(60);
        head->next->next->next->next->next = head;

        printList(head);

        return 0;
}



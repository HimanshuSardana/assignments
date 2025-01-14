#include <bits/stdc++.h>

using namespace std;

class Node {
public:
        int data;
        Node* next;
};

void push(Node** head_ref, int new_data) {
        Node* new_node = new Node();
        new_node->data = new_data;
        new_node->next = (*head_ref);
        (*head_ref) = new_node;
}

void printList(Node* node) {
        while (node != NULL) {
                cout << node->data << " ";
                node = node->next;
        }
        cout << endl;
}


int main() {
        Node* head1 = NULL;
        Node* head2 = NULL;
        Node* unionList = NULL;
        Node* intersectionList = NULL;
        map<int, int> m;

        vector<int> n1 = {1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
        vector<int> n2 = {1, 0, 3, 4, 5, 6, 7, 8, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};

        for (int i = 0; i < n1.size(); i++) {
                m[n1[i]]++;
        }

        for (int i = 0; i < n2.size(); i++) {
                m[n2[i]]++;
        }

        for (auto i : m) {
                push(&unionList, i.first);
                if (i.second > 1) {
                        push(&intersectionList, i.first);
                }
        }

        cout << "Union List: ";
        printList(unionList);

        cout << "Intersection List: ";
        printList(intersectionList);
}


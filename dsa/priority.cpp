#include <bits/stdc++.h>

using namespace std;

struct Node {
        int data;
        Node *left;
        Node *right;
};

void printTree(Node* root) {
        if (root == NULL) {
                return;
        }
        cout << root->data << " ";
        printTree(root->left);
        printTree(root->right);
}

void insert(Node* newNode) {
        Node *root = new Node();
        root->data = 1;
}

int main() {
        Node *root = new Node();
        root->data = 1;

        Node *left = new Node();
        left->data = 2;

        Node *right = new Node();
        right->data = 3;

        root->left = left;
        root->right = right;

        printTree(root);
}

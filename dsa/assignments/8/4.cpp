// WAP to determine whether a tree is a bst or not
#include <bits/stdc++.h>

using namespace std;

struct Node {
        int data;
        Node* left;
        Node* right;
};

Node* createNode(int d) {
        Node* newNode = new Node();
        newNode->data = d;
        newNode->left = NULL;
        newNode->right = NULL;
        return newNode;
}

void printTree(Node* root) {
        cout << root->data << " ";
        if (root->left) printTree(root->left);
        if (root->right) printTree(root->right);
}

void inorder(Node* root, vector<int> &inorderList) {
        if (root != NULL) {
                inorder(root->left, inorderList);
                inorderList.push_back(root->data);
                inorder(root->right, inorderList);
        }
}

int main() {
        Node* root = createNode(5);
        root->left = createNode(3);
        root->right = createNode(7);
        root->left->left = createNode(2);
        root->left->right = createNode(4);
        root->right->left = createNode(6);
        root->right->right = createNode(8);

        printTree(root);

        vector<int> inorderList;

        inorder(root, inorderList);

        vector<int> sortedInorderList = inorderList;
        sort(sortedInorderList.begin(), sortedInorderList.end());

        if (inorderList == sortedInorderList) {
                cout << "It is a BST" << endl;
        } else {
                cout << "It is not a BST" << endl;
        }

        return 0;
}

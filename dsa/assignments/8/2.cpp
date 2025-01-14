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

void inorderSuccessor(Node* root, int data) {
        if (root == NULL) {
                cout << "Not found" << endl;
                return;
        }

        else if (root->data == data) {
                if (root->right) {
                        Node* temp = root->right;
                        while (temp->left) {
                                temp = temp->left;
                        }
                        cout << "Inorder successor is: " << temp->data << endl;
                } else {
                        cout << "No inorder successor" << endl;
                }
                return;
        }

        else if (data < root->data) {
                inorderSuccessor(root->left, data);
        } else {
                inorderSuccessor(root->right, data);
        }
}

void inorderPredecessor(Node* root, int data) {
        if (root == NULL) {
                cout << "Not found" << endl;
                return;
        }

        else if (root->data == data) {
                if (root->left) {
                        Node* temp = root->left;
                        while (temp->right) {
                                temp = temp->right;
                        }
                        cout << "Inorder predecessor is: " << temp->data << endl;
                } else {
                        cout << "No inorder predecessor" << endl;
                }
                return;
        }

        else if (data < root->data) {
                inorderPredecessor(root->left, data);
        } else {
                inorderPredecessor(root->right, data);
        }
}

void searchNode(Node* root, int data) {
        if (root == NULL) {
                cout << "Not found" << endl;
                return;
        }

        else if (root->data == data) {
                cout << "Found" << endl;
                return;
        }

        else if (data < root->data) {
                searchNode(root->left, data);
        } else {
                searchNode(root->right, data);
        }
}

void insert(Node* root, int d) {
        if(root == NULL) {
                root = createNode(d);
                return;
        }
        else if (d < root->data) {
                if (root->left) insert(root->left, d);
                else root->left = createNode(d);
        } else {
                if (root->right) insert(root->right, d);
                else root->right = createNode(d);
        }
}

int maxDepth(Node* root) {
        if (root == NULL) {
                return 0;
        }

        int leftDepth = 1 + maxDepth(root->left);
        int rightDepth = 1 + maxDepth(root->right);

        return max(leftDepth, rightDepth);
}

int minDepth(Node* root) {
        if (root == NULL) {
                return 0;
        }

        int leftDepth = 1 + minDepth(root->left);
        int rightDepth = 1 + minDepth(root->right);

        return min(leftDepth, rightDepth);
}

int main() {
        vector<int> l = {10, 5, 2, 7, 1, 9, 4, 2};

        // make bst from the list
        Node* root = createNode(l[0]);
        for (int i = 1; i < l.size(); i++) {
                insert(root, l[i]);
        }

        printTree(root);

        searchNode(root, 7);
        searchNode(root, 8);

        inorderSuccessor(root, 7);
        inorderSuccessor(root, 9);

        inorderPredecessor(root, 7);
        inorderPredecessor(root, 9);
}

#include <bits/stdc++.h>
#include <pthread.h>

using namespace std;

struct Node {
        int data;
        Node* left;
        Node* right;
};

Node* createNode(int data) {
        Node* newNode = new Node();
        newNode->data = data;
        newNode->left = newNode->right = NULL;
        return newNode;
}

void preorder(Node* root) {
        if(root != NULL) {
                cout << root->data << " ";
                preorder(root->left);
                preorder(root->right);
        }
}

void postorder(Node* root) {
        if(root != NULL) {
                postorder(root->left);
                postorder(root->right);
                cout << root->data << " ";
        }
}

void inorder(Node* root) {
        if(root != NULL) {
                inorder(root->left);
                cout << root->data << " ";
                inorder(root->right);
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

int main() {
       vector<int> l = {3, 2, 7, 1, 8, 0, 12}; 
        Node* root = createNode(l[0]);
        for(int i = 1; i < l.size(); i++) {
                insert(root, l[i]);
        }

        cout << "Preorder: ";
        preorder(root);

        cout << "\nPostorder: ";
        postorder(root);

        cout << "\nInorder: ";
        inorder(root);

}

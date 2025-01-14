### BST
### Assignment 8
##### By Himanshu Sardana

**Q1: Write program using functions for binary tree traversals: Pre-order, In-order and Post-order using recursive approach.** 
```c++
#include <bits/stdc++.h>

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
```

**Q2: Implement following functions for Binary Search Trees
(a) Search a given item (Recursive & Non-Recursive)
(b) Maximum element of the BST
(c) Minimum element of the BST
(d) In-order successor of a given node the BST
(e) In-order predecessor of a given node the BST** 
```c++
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
```

**Q3: Write a program for binary search tree (BST) having functions for the following
operations:
(a) Insert an element (no duplicates are allowed),
(b) Delete an existing element,
(c) Maximum depth of BST
(d) Minimum depth of BST** 
```c++
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

        cout << endl;

        searchNode(root, 7);

        cout << maxDepth(root) << "\n";
        cout << minDepth(root) << "\n";
}
```

**Q4: Write a program to determine whether a given binary tree is a BST or not.** 
```c++
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
```


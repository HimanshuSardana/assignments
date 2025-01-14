#include <stdio.h>
#include <stdlib.h>

struct Node {
        int data;
        struct Node* left;
        struct Node* right;
} Node;

struct Node* createNode(int data) {
        struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
        newNode->data = data;
        newNode->left = NULL;
        newNode->right = NULL;
        return newNode;
}

void inorder(struct Node* root) {
        if (root == NULL) return ;
        inorder(root->left);
        printf("%d ", root->data);
        inorder(root->right);
}

void preorder(struct Node* root) {
        if (root == NULL) return ;
        inorder(root->left);
        inorder(root->right);
        printf("%d ", root->data);
}

void postorder(struct Node* root) {
        if (root == NULL) return ;
        printf("%d ", root->data);
        inorder(root->left);
        inorder(root->right);
}

int main() {
        struct Node* root = createNode(3);
        struct Node* second = createNode(1);
        struct Node* third = createNode(2);
        struct Node* fourth = createNode(5);

        root->left = second;
        root->right = third;
        second->left = fourth;
        inorder(root);
}

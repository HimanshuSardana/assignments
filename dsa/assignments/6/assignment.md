### Circular Linked List
### Assignment 6
##### By: Himanshu Sardana

**Q2: Display all the node values in a circular linked list, repeating value of head node at the end too. For example, if elements present in the circular linked list starting from head are 20 → 100 → 40 → 80 → 60, then output should be displayed as 20 100 40 80 60 20 ** 

```c++
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
```

**Q3: Write a program to find size of
i. Doubly Linked List.
```c++
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
        while (temp) {
                cout << temp->data << " ";
                temp = temp->next;
        }
        cout << endl;
}

int main() {
        Node* head = createNode(1);
        head->next = createNode(2);
        head->next->next = createNode(3);
        head->next->next->next = createNode(4);
        head->next->next->next->next = head;

        Node* temp = head;
        int size = 0;
        do {
                size++;
                temp = temp->next;
        } while (temp != head);

        cout << "Size of the circular linked list is: " << size << endl;

        return 0;
}
```

ii. Circular Linked List.** 
```c++
#include <bits/stdc++.h>

using namespace std;

struct Node {
        int data;
        Node* next;
        Node* prev;
};

Node* createNode(int d) {
        Node* newNode = new Node();
        newNode->data = d;
        newNode->next = NULL;
        newNode->prev = NULL;
        return newNode;
}

void printList(Node* head) {
        Node* temp = head;
        while (temp) {
                cout << temp->data << " ";
                temp = temp->next;
        }
        cout << endl;
}

int size(Node* head) {
        Node* temp = head;
        int count = 0;
        while (temp) {
                count++;
                temp = temp->next;
        }
        return count;
}

int main() {
        Node* head = createNode(1);
        head->next = createNode(2);
        head->next->prev = head;
        head->next->next = createNode(3);
        head->next->next->prev = head->next;
        head->next->next->next = createNode(4);
        head->next->next->next->prev = head->next->next;

        printList(head);
        cout << "Size of doubly linked list is: " << size(head) << endl;

        return 0;
}
```

**Q4: Write a program to check if a doubly linked list of characters is palindrome or not.** 
```c++
#include <bits/stdc++.h>

using namespace std;

struct Node {
        char data;
        Node* prev;
        Node* next;
};

Node* createNode(char data) {
        Node* newNode = new Node();
        newNode->data = data;
        newNode->next = NULL;
        newNode->prev = NULL;

        return newNode;
}

void printList(Node* head) {
        while(head != NULL) {
                cout << head->data;
                head = head->next;
        }
}

int main() {
        vector<char> L = {'r', 'a', 'c', 'e', 'c', 'a', 'r'}; 

        Node* head = createNode(L[0]);
        Node* temp = head;
        for(int i = 1; i < L.size(); i++) {
                Node* newNode = createNode(L[i]);
                temp->next = newNode;
                newNode->prev = temp;
                temp = temp->next;
        }

        Node* tail = temp;

        printList(head);
        
        int flag = 0;
        while(head != NULL && tail != NULL) {
                if(head->data != tail->data) {
                        flag = 1;
                        break;
                }
                head = head->next;
                tail = tail->prev;
        }

        cout << flag;
}
```

**Q5: Write a program to check if a linked list is Circular Linked List or not.** 
```c++
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
        while (temp) {
                cout << temp->data << " ";
                temp = temp->next;
        }
        cout << endl;
}

bool isCircular(Node* head) {
        Node* temp = head;
        while (temp) {
                if (temp->next == head) {
                        return true;
                }
                temp = temp->next;
        }
        return false;
}

int main() {
        Node* head = createNode(1);
        head->next = createNode(2);
        head->next->next = createNode(3);
        head->next->next->next = createNode(4);
        head->next->next->next->next = head;

        if (isCircular(head)) {
                cout << "It is circular" << endl;
        } else {
                cout << "It is not circular" << endl;
        }

        return 0;
}
```

# Hashing Assignment
##### By Himanshu Sardana

**Q1: Write a program to determine the most frequent element in an array. If there are multiple elements that are appearing the maximum number of times, then print any one of them.** 
```cpp
#include <bits/stdc++.h>

using namespace std;

int main()
{
        vector<int> n = {1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
        map<int, int> m;

        for (int i = 0; i < n.size(); i++)
        {
                m[n[i]]++;
        }

        int max = 0;
        int maxElement = 0;

        for (auto i : m)
        {
                if (i.second > max)
                {
                        max = i.second;
                        maxElement = i.first;
                }
        }

        cout << "Most frequent element is: " << maxElement << endl;
}
```

**Q2: An array A[] of n numbers and another number x is given to you. Write a program to check whether or not there exist two elements in A[] whose sum is exactly x.** 
```cpp
#include <bits/stdc++.h>

using namespace std;

int main() {
        vector<int> n = {1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
        int x = 10;
        map<int, int> m;

        for (int i = 0; i < n.size(); i++) {
                m[n[i]]++;
        }

        for (int i = 0; i < n.size(); i++) {
                if (m[x - n[i]] > 0) {
                        cout << "Yes, there exist two elements in A[] whose sum is exactly " << x << endl;
                        cout << "The elements are: " << n[i] << " and " << x - n[i] << endl;
                        return 0;
                }
        }

        cout << "No, there does not exist two elements in A[] whose sum is exactly " << x << endl;
        return 0;
}
```

**Q3: You are provided with two arrays. Write a program to find numbers which are present in first array, but not present in the second array.** 
```cpp
#include <bits/stdc++.h>

using namespace std;

int main() {
        vector<int> n1 = {1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
        vector<int> n2 = {1, 0, 3, 4, 5, 6, 7, 8, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
        map<int, int> m;

        for (int i = 0; i < n2.size(); i++) {
                m[n2[i]]++;
        }

        for (int i = 0; i < n1.size(); i++) {
                if (m[n1[i]] == 0) {
                        cout << n1[i] << " ";
                }

        }

        for (int i = 0; i < n2.size(); i++) {
                if (m[n2[i]] == 0) {
                        cout << n2[i] << " ";
                }

        }


        cout << endl;
        return 0;
}
```

**Q4: Write a program that creates union and intersection lists from the two Linked Lists given as an input. The union list contains unique elements present in both the input Linked Lists and intersection list contains common elements present in the given lists. Order of elements in output lists doesn’t matter** 
```cpp
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
```

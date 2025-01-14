/*Q2: An array A[] of n numbers and another number x is given to you. Write a program to check whether or not there exist two elements in A[] whose sum is exactly x.*/
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


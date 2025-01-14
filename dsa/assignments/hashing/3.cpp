/*Q3: You are provided with two arrays. Write a program to find numbers which are present in first array, but not present in the second array.*/
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


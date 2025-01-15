#include <bits/stdc++.h>

using namespace std;

void merge(vector<int>& v, int l, int m, int r) {
        int n1 = m - l + 1;
        int n2 = r - m;

        vector<int> L(n1);
        vector<int> R(n2);

        for(int i = 0; i < n1; i++) {
                L[i] = v[l + i];
        }

        for(int i = 0; i < n2; i++) {
                R[i] = v[m + 1 + i];
        }

        int i = 0;
        int j = 0;
        int k = l;

        while(i < n1 && j < n2) {
                if(L[i] <= R[j]) {
                        v[k] = L[i];
                        i++;
                } else {
                        v[k] = R[j];
                        j++;
                }
                k++;
        }

        while(i < n1) {
                v[k] = L[i];
                i++;
                k++;
        }

        while(j < n2) {
                v[k] = R[j];
                j++;
                k++;
        }
}

void mergeSort(vector<int>& v, int l, int r) {
        if(l >= r) {
                return;
        }

        int m = l + (r - l) / 2;
        mergeSort(v, l, m);
        mergeSort(v, m + 1, r);
        merge(v, l, m, r);
}

int main() {
        vector<int> v = {12, 11, 13, 5, 6, 7};
        mergeSort(v, 0, v.size() - 1);
        for(int i : v) {
                cout << i << " ";
        }
}

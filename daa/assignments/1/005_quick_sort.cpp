#include <bits/stdc++.h>

using namespace std;

// quick sort
int partition(vector<int> &v, int low, int high) {
        int pivot = v[high];
        int i = low - 1;
        for (int j = low; j < high; j++) {
                if (v[j] < pivot) {
                        i++;
                        swap(v[i], v[j]);
                }
        }
        swap(v[i + 1], v[high]);
        return i + 1;
}

void quick_sort(vector<int> &v, int low, int high) {
        if (low < high) {
                int pi = partition(v, low, high);
                quick_sort(v, low, pi - 1);
                quick_sort(v, pi + 1, high);
        }
}

int main() {
        vector<int> v = {4, 2, 6, 9, 2};
        quick_sort(v, 0, v.size() - 1);

        for (int i = 0; i < v.size(); i++) {
                cout << v[i] << " ";
        }
}

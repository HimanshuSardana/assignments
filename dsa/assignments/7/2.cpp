/*. A slightly improved selection sort – We know that selection sort algorithm takes the minimum on*/
/*every pass on the array, and place it at its correct position. The idea is to take also the maximum on*/
/*every pass and place it at its correct position. So in every pass, we keep track of both maximum and minimum*/
/**/

#include <bits/stdc++.h>

using namespace std;

void selectionSort(vector<int>& arr) {
    int n = arr.size();

    for(int i = 0; i < n-1; i++) {
        int min_index = i;
        int max_index = i;

        for(int j = i+1; j < n-i; j++) {
            if(arr[j] < arr[min_index]) {
                min_index = j;
            }

            if(arr[j] > arr[max_index]) {
                max_index = j;
            }
        }

        swap(arr[i], arr[min_index]);

        if(max_index == i) {
            swap(arr[n-i-1], arr[min_index]);
        } else {
            swap(arr[n-i-1], arr[max_index]);
        }
    }
}

int main() {
        vector<int> arr = {2, 6, 1, 9, 7, 2, 3};
        selectionSort(arr);
        
        for(int i = 0; i < arr.size(); i++) {
                cout << arr[i] << " ";
        }
        cout << endl;
}

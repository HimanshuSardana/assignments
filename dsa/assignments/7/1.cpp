#include <bits/stdc++.h>

using namespace std;

void selectionSort(vector<int>& arr) {
    int n = arr.size();

    for(int i = 0; i < n-1; i++) {
        int min_index = i;

        for(int j = i+1; j < n; j++) {
            if(arr[j] < arr[min_index]) {
                min_index = j;
            }
        }

        swap(arr[i], arr[min_index]);
    }
}

void insertionSort(vector<int>& arr) {
    int n = arr.size();

    for(int i = 1; i < n; i++) {
        int key = arr[i];
        int j = i-1;

        while(j >= 0 && arr[j] > key) {
            arr[j+1] = arr[j];
            j--;
        }

        arr[j+1] = key;
    }
}

void bubbleSort(vector<int>& arr) {
    int n = arr.size();

    for(int i = 0; i < n-1; i++) {
        for(int j = 0; j < n-i-1; j++) {
            if(arr[j] > arr[j+1]) {
                swap(arr[j], arr[j+1]);
            }
        }
    }
}

void partition(vector<int>& arr, int low, int high, int& pivot) {
    int i = low - 1;
    int j = low;
    int pivot_value = arr[high];

    while(j < high) {
        if(arr[j] < pivot_value) {
            i++;
            swap(arr[i], arr[j]);
        }
        j++;
    }

    swap(arr[i+1], arr[high]);
    pivot = i+1;
}

void quickSort(vector<int>& arr, int low, int high) {
    if(low < high) {
        int pivot;
        partition(arr, low, high, pivot);

        quickSort(arr, low, pivot-1);
        quickSort(arr, pivot+1, high);
    }
}

int main() {
        vector<int> arr = {2, 6, 1, 9, 7, 2, 3};

        /*selectionSort(arr);*/
        /*insertionSort(arr);*/
        /*bubbleSort(arr);*/
        quickSort(arr, 0, arr.size()-1);

        for(int i = 0; i < arr.size(); i++) {
            cout << arr[i] << " ";
        }
}

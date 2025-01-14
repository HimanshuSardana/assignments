### Sorting
### Assignment 7
##### By Himanshu Sardana

**Q1: Write a program to implement following sorting techniques:
a. Selection Sort
b. Insertion Sort
c. Bubble Sort
d. Merge Sort
e. Quick Sort** 
```c++
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
```

**Q2: A slightly improved selection sort – We know that selection sort algorithm takes the minimum on every pass on the array, and place it at its correct position. The idea is to take also the maximum on every pass and place it at its correct position. So in every pass, we keep track of both maximum and minimum and array becomes sorted from both ends. Implement this logic** 
```c++
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
```

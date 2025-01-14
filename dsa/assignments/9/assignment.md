### Heaps
### Assignment 9
##### By Himanshu Sardana

**Q1: Implement Heapsort (Increasing/Decreasing order).** 
```c++
#include <bits/stdc++.h>

using namespace std;

void heapify(vector<int>& arr, int n, int i) {
    int largest = i;
    int l = 2*i + 1;
    int r = 2*i + 2;

    if(l < n && arr[l] > arr[largest]) {
        largest = l;
    }

    if(r < n && arr[r] > arr[largest]) {
        largest = r;
    }

    if(largest != i) {
        swap(arr[i], arr[largest]);
        heapify(arr, n, largest);
    }
}

void heapsort(vector<int>& arr) {
    int n = arr.size();

    for(int i = n/2 - 1; i >= 0; i--) {
        heapify(arr, n, i);
    }

    for(int i = n-1; i > 0; i--) {
        swap(arr[0], arr[i]);
        heapify(arr, i, 0);
    }
}

void printArray(vector<int>& arr) {
    for(int i = 0; i < arr.size(); i++) {
        cout << arr[i] << " ";
    }
    cout << endl;
}

int main() {
        vector<int> arr = {2, 6, 1, 9, 7, 2, 3};
        heapsort(arr);

        printArray(arr);
}
```

**Q2: Implement priority queues using heaps.** 
```c++
#include <bits/stdc++.h>

using namespace std;

class PriorityQueue {
    vector<int> arr;
    int heap_size;

    int parent(int i) {
        return (i-1)/2;
    }

    int left(int i) {
        return 2*i + 1;
    }

    int right(int i) {
        return 2*i + 2;
    }

    void heapify(int i) {
        int l = left(i);
        int r = right(i);
        int largest = i;

        if(l < heap_size && arr[l] > arr[largest]) {
            largest = l;
        }

        if(r < heap_size && arr[r] > arr[largest]) {
            largest = r;
        }

        if(largest != i) {
            swap(arr[i], arr[largest]);
            heapify(largest);
        }
    }

    public:
    PriorityQueue() {
        heap_size = 0;
    }

    void insert(int key) {
        heap_size++;
        int i = heap_size - 1;
        arr.push_back(key);

        while(i != 0 && arr[parent(i)] < arr[i]) {
            swap(arr[i], arr[parent(i)]);
            i = parent(i);
        }
    }

    int getMax() {
        return arr[0];
    }

    void extractMax() {
        if(heap_size == 0) {
            return;
        }

        if(heap_size == 1) {
            heap_size--;
            arr.pop_back();
            return;
        }

        arr[0] = arr[heap_size - 1];
        heap_size--;
        arr.pop_back();
        heapify(0);
    }
};

int main() {
        PriorityQueue pq;
        pq.insert(3);
        pq.insert(2);
        pq.insert(15);
        
        cout << pq.getMax() << endl;
        pq.extractMax();
        cout << pq.getMax() << endl;
        pq.extractMax();
        cout << pq.getMax() << endl;
        pq.extractMax();
        cout << pq.getMax() << endl;
}
```

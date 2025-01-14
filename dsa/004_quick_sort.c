#include <stdio.h>

void quick_sort(int arr[], int left, int right) {
    if (left >= right) return;
    int i = left, j = right;
    int pivot = arr[left];
    while (i < j) {
        while (i < j && arr[j] >= pivot) j--;
        arr[i] = arr[j];
        while (i < j && arr[i] <= pivot) i++;
        arr[j] = arr[i];
    }
    arr[i] = pivot;
    quick_sort(arr, left, i - 1);
    quick_sort(arr, i + 1, right);
}

int main() {
        int arr[] = {3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5};
        int len = sizeof(arr) / sizeof(arr[0]);
        quick_sort(arr, 0, len - 1);
        for (int i = 0; i < len; i++) {
                printf("%d ", arr[i]);
        }
        printf("\n");
        return 0;
}

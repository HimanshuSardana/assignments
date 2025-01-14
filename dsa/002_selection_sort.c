#include <stdio.h>

int main() {
        int arr[5] = {4,2,3,5,1};

        for (int i = 0; i < 5; i++) {
                int min = i;
                for (int j = i+1; j < 5; j++) {
                        if (arr[j] < arr[min]) {
                                min = j;
                        }
                }
                int temp = arr[i];
                arr[i] = arr[min];
                arr[min] = temp;
        }

        for(int i = 0; i < 5; i++) {
                printf("%d ", arr[i]);
        }

}

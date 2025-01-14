#include <bits/stdc++.h>

using namespace std;

int main() {
        vector<int> v = {-2, -5, 6, -2, -3, 1, 5, -6};
        int currSum = 0;
        int maxSum = INT_MIN;

        for(int i : v) {
                currSum += i;
                if(currSum < 0) {
                        currSum = 0;
                }
                maxSum = max(maxSum, currSum);
        }

        cout << maxSum;
}

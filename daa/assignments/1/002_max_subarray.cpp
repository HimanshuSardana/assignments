// A = [-2, -5, 6, -2, -3, 1, 5, -6], Find subarray that has max sum
#include <bits/stdc++.h>

using namespace std;

int main() {
        vector<int> v = {-2, -5, 6, -2, -3, 1, 5, -6};
        int n = v.size();
        int max_sum = INT_MIN;

        vector<int> prefix_sum(n);

        prefix_sum[0] = v[0];
        for (int i = 1; i < n; i++) {
                prefix_sum[i] = prefix_sum[i - 1] + v[i];
        }

        for(int i : v) {
                cout << i << " ";
        }

        cout << "\n";

        for(int i : prefix_sum) {
                cout << i << " ";
        }

        int max_i = 0;
        int max_j = 0;

        for (int i = 0; i < n; i++) {
                for (int j = i; j < n; j++) {
                        int sum = prefix_sum[j] - prefix_sum[i] + v[i];
                        max_sum = max(max_sum, sum);
                        if (max_sum == sum) {
                                max_i = i;
                                max_j = j;
                        }
                }
        }

        cout << "\nMax sum: " << max_sum << "\n";

        for(int i = max_i; i <= max_j; i++) {
                cout << v[i] << " ";
        }
}

// Prefix sum

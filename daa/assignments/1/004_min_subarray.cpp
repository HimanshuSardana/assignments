// A = [-2, -5, 6, -2, -3, 1, 5, -6], Find subarray that has min sum
#include <bits/stdc++.h>

using namespace std;

int main() {
        vector<int> v = {-2, -5, 6, -2, -3, 1, 5, -6};
        int n = v.size();
        int min_sum = INT_MAX;

        vector<int> prefix_sum(n);

        prefix_sum[0] = v[0];
        for (int i = 1; i < n; i++) {
                prefix_sum[i] = prefix_sum[i - 1] + v[i];
        }

        /*for(int i : v) {*/
        /*        cout << i << " ";*/
        /*}*/
        /**/
        /*cout << "\n";*/
        /**/
        /*for(int i : prefix_sum) {*/
        /*        cout << i << " ";*/
        /*}*/

        int min_i = 0;
        int min_j = 0;

        for (int i = 0; i < n; i++) {
                for (int j = i; j < n; j++) {
                        int sum = prefix_sum[j] - prefix_sum[i] + v[i];
                        min_sum = min(min_sum, sum);
                        if (min_sum == sum) {
                                min_i = i;
                                min_j = j;
                        }
                }
        }

        cout << "Min sum: " << min_sum << "\n";

        for(int i = min_i; i <= min_j; i++) {
                cout << v[i] << " ";
        }
}

// Prefix sum

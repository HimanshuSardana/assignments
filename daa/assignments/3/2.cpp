/*There are 3 matrices of dimensions 2×1, 1×3, and 3×4, using Matrix Chain Multiplication find the most efficient way to multiply these matrices together such that the total number of element multiplications is minimum*/
#include <bits/stdc++.h>

using namespace std;

int main() {
        vector<int> arr = {2, 1, 3, 4};
        int n = arr.size();

        vector<vector<int>> dp(n, vector<int>(n, 0));

        for (int len = 2; len < n; len++) {
                for (int i = 1; i < n - len + 1; i++) {
                        int j = i + len - 1;
                        dp[i][j] = INT_MAX;
                        for (int k = i; k < j; k++) {
                                dp[i][j] = min(dp[i][j], dp[i][k] + dp[k + 1][j] + arr[i - 1] * arr[k] * arr[j]);
                        }
                }
        }

        cout << "Minimum number of multiplications: " << dp[1][n - 1] << endl;
}


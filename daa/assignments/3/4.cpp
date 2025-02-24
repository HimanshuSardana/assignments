/*The Maximal Square Problem involves finding the largest square that can be formed in a given binary matrix. The binary matrix consists of 0s and 1s, where 1s represent parts of the square and 0s represent empty spaces.*/
#include <bits/stdc++.h>

using namespace std;

int main() {
        vector<vector<int>> matrix = {
                {1, 0, 1, 0, 0},
                {1, 0, 1, 1, 1},
                {1, 1, 1, 1, 1},
                {1, 0, 0, 1, 0}
        };

        int n = matrix.size();
        int m = matrix[0].size();

        vector<vector<int>> dp(n + 1, vector<int>(m + 1, 0));
        int max_side = 0;

        for (int i = 1; i <= n; i++) {
                for (int j = 1; j <= m; j++) {
                        if (matrix[i - 1][j - 1] == 1) {
                                dp[i][j] = 1 + min({dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]});
                                max_side = max(max_side, dp[i][j]);
                        }
                }
        }

        cout << "Maximum side of the square: " << max_side << endl;
}


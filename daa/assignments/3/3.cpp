/*Given N = 3 items where each item has some weight and profit associated with it `profit[] = {1, 2, 3}`, `weight[] = {4, 5, 1}` and also given a bag with capacity W=4, [i.e., the bag can hold at most W weight in it]. Put the items into the bag such that the sum of profits associated with them is the maximum possible with the constraint either put an item completely into the bag or cannot put it at all.*/
#include <bits/stdc++.h>

using namespace std;

int main() {
        vector<int> profit = {1, 2, 3};
        vector<int> weight = {4, 5, 1};
        int W = 4;
        int n = profit.size();

        vector<vector<int>> dp(n + 1, vector<int>(W + 1, 0));

        for (int i = 1; i <= n; i++) {
                for (int w = 1; w <= W; w++) {
                        if (weight[i - 1] <= w) {
                                dp[i][w] = max(dp[i - 1][w], profit[i - 1] + dp[i - 1][w - weight[i - 1]]);
                        } else {
                                dp[i][w] = dp[i - 1][w];
                        }
                }
        }

        cout << "Maximum profit: " << dp[n][W] << endl;
}


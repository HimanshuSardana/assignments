/*Given an array arr[] of length n and an integer target, the task is to find
 * the subsets with a sum equal*/
/*to target.*/
/*Input: arr[] = {2, 3, 7, 8, 10}, target = 10*/
/*Output: All the possible subsets are [2, 8], [3, 7], [10]*/

#include <bits/stdc++.h>

using namespace std;

int main() {
  vector<int> arr = {2, 3, 7, 8, 10};
  int target = 10;

  int n = arr.size();

  vector<vector<int>> dp(n + 1, vector<int>(target + 1, 0));

  for (int i = 0; i <= n; i++) {
    dp[i][0] = 1;
  }

  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= target; j++) {
      if (arr[i - 1] <= j) {
        dp[i][j] = dp[i - 1][j] + dp[i - 1][j - arr[i - 1]];
      } else {
        dp[i][j] = dp[i - 1][j];
      }
    }
  }

  if (dp[n][target] == 0) {
    cout << "No subset with the given sum" << endl;
    return 0;
  }

  vector<int> v;

  function<void(int, int)> printSubsets = [&](int i, int sum) {
    if (i == 0) {
      if (sum == 0) {
        for (int i = v.size() - 1; i >= 0; i--) {
          cout << v[i] << " ";
        }
        cout << endl;
      }
      return;
    }

    if (dp[i - 1][sum]) {
      printSubsets(i - 1, sum);
    }

    if (sum >= arr[i - 1] && dp[i - 1][sum - arr[i - 1]]) {
      v.push_back(arr[i - 1]);
      printSubsets(i - 1, sum - arr[i - 1]);
      v.pop_back();
    }
  };

  printSubsets(n, target);
}

#include <bits/stdc++.h>

using namespace std;

vector<vector<int>> generate_subsets(vector<int> &arr, int index) {
  if (index == arr.size()) {
    return {{}};
  }

  vector<vector<int>> subsets = generate_subsets(arr, index + 1);
  vector<vector<int>> new_subsets;

  for (const auto &subset : subsets) {
    vector<int> new_subset = subset;
    new_subset.push_back(arr[index]);
    new_subsets.push_back(new_subset);
  }

  subsets.insert(subsets.end(), new_subsets.begin(), new_subsets.end());
  return subsets;
}

int main() {
  vector<int> arr = {10, 7, 5, 18, 12, 20, 15};
  int req_sum = 35;
  int correct_subsets = 0;

  vector<vector<int>> subsets = generate_subsets(arr, 0);
  for (const auto &subset : subsets) {
    int sum = 0;
    for (int num : subset) {
      sum += num;
    }
    if (sum == req_sum) {
      correct_subsets++;
      cout << "Subset: ";
      for (int num : subset) {
        cout << num << " ";
      }
      cout << endl;
    }
  }

  cout << "Total subsets with sum " << req_sum << ": " << correct_subsets
       << endl;
}

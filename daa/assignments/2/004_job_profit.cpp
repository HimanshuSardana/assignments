#include <bits/stdc++.h>

using namespace std;

int main() {
        vector<int> jobIDs = {'a', 'b', 'c', 'd'};
        vector<int> deadlines = {4, 1, 1, 1};
        vector<int> profits = {20, 10, 40, 30};

        int n = jobIDs.size();

        int totalProfit = 0;
        vector<int> result(n, -1);

        vector<pair<int, int>> jobs(n);
        for (int i = 0; i < n; i++) {
                jobs[i] = {profits[i], deadlines[i]};
        }

        sort(jobs.begin(), jobs.end(), greater<pair<int, int>>());

        vector<bool> slot(n, false);

        for (int i = 0; i < n; i++) {
                for (int j = min(n, jobs[i].second) - 1; j >= 0; j--) {
                        if (!slot[j]) {
                                slot[j] = true;
                                result[j] = i;
                                break;
                        }
                }
        }

        for (int i = 0; i < n; i++) {
                if (result[i] != -1) {
                        totalProfit += jobs[result[i]].first;
                }
        }

        cout << "Total profit: " << totalProfit << endl;

}

#include <algorithm>
#include <bits/stdc++.h>

using namespace std;

bool comp(pair<int, int> p1, pair<int, int> p2) {
        return p1.second > p2.second;
}

int main() {
        // (deadline, profit)
        vector<pair<int, int>> jobs = {{4, 20}, {1, 10}, {1, 40}, {1, 30}};
        int n = jobs.size();

        int totalProfit = 0;
        sort(jobs.begin(), jobs.end(), comp);

        int curr_time = 0;
        for(int i = 0; i < n; i++) {
                cout << jobs[i].first << " " << jobs[i].second << endl;
        }

        for(int i = 0; i < n; i++) {
                if(jobs[i].first <= curr_time) {
                        totalProfit += jobs[i].second;
                        cout << "Job " << jobs[i].first << " Profit: " << jobs[i].second << endl;
                }
        }
}

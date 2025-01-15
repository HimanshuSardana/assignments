#include <bits/stdc++.h>

using namespace std;

int main() {
        vector<int> start = {1, 3, 0, 5, 8, 5};
        vector<int> finish = {2, 4, 6, 7, 9, 9};

        int n = start.size();

        vector<pair<int, int>> activities;

        for (int i = 0; i < n; i++) {
                activities.push_back({finish[i], start[i]});
        }

        sort(activities.begin(), activities.end());

        int count = 1;
        int i = 0;

        for (int j = 1; j < n; j++) {
                if (activities[j].second >= activities[i].first) {
                        count++;
                        i = j;
                }
        }

        cout << count << endl;
}

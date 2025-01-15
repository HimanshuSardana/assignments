#include <bits/stdc++.h>

using namespace std;

int main() {
        vector<pair<int, int>> items = {{60, 10}, {100, 20}, {120, 30}};
        int capacity = 50;

        sort(items.begin(), items.end(), [](pair<int, int> a, pair<int, int> b) {
                return (double)a.first / a.second > (double)b.first / b.second;
        });

        double profit = 0;
        for (auto item : items) {
                if (capacity == 0) {
                        break;
                }

                int weight = min(capacity, item.second);
                profit += (double)weight * item.first / item.second;
                capacity -= weight;
        }

        cout << profit << endl;
}

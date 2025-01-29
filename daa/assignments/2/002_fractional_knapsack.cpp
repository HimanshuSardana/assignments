#include <bits/stdc++.h>

using namespace std;

bool comparator(pair<int, int> a, pair<int, int> b) {
        return (double)a.second/a.first > (double)b.second/b.first;
}

int main() {
        // (weight, profit)
        vector<pair<int, int>> items = {{18, 25}, {15, 24}, {10, 15}};
        vector<double> unit_profits = {1.388, 1.6, 1.5};
        sort(items.begin(), items.end(), comparator);
        sort(unit_profits.begin(), unit_profits.end(), greater<double>());

        int max_wt = 20;
        int current_wt = 0;
        int curr_item_index = 0;

        double profit = 0;

        while(current_wt < max_wt) {
                if(items[curr_item_index].first > 0) {
                        current_wt += 1;
                        items[curr_item_index].first -= 1;
                        profit += unit_profits[curr_item_index];
                }
                else {
                        curr_item_index += 1;
                }
        }

        cout << "profit: " << profit;
}

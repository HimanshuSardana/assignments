#include <bits/stdc++.h>

using namespace std;
        
int main() {
        int max_weight = 50;
        vector<int> weights = {10, 20, 30};
        vector<int> profits = {160, 100, 120};

        vector<int> profits2 = profits;

        int n = weights.size();

        vector<int> ans(n);
        int itemsCount = 0;
        int current_weight = 0;

        while(current_weight < max_weight && itemsCount < n) {
                int highestProfit = *max_element(profits.begin(), profits.end()); 
                int highestProfitIndex = find(profits.begin(), profits.end(), highestProfit) - profits.begin();

                int mostProfitableWeight = weights[highestProfitIndex];

                if(abs(max_weight - current_weight) >= mostProfitableWeight) {
                        current_weight += mostProfitableWeight;
                        weights[highestProfitIndex] = 0;
                        profits[highestProfitIndex] = 0;
                        ans[highestProfitIndex] = 1;
                }

                itemsCount += 1;
        }

        cout << current_weight << "\n";

        for(int i : ans) {
                cout << i << " ";
        }

        int max_profit = 0;
        for(int i = 0; i < n; i++) {
                max_profit += profits2[i] * ans[i];
        }

        cout << "\n" << max_profit;

}

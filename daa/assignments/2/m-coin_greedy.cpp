// 10
// 1 2 5 7

// Suppose 480rs
// denomination = 100, 50, 20, 10

#include <bits/stdc++.h>

using namespace std;

int main() {
        vector<int> denominations = {1, 2, 5, 7};
        int n = 10;

        int coins = 0;
        int curr_value = 0;

        while(curr_value < n) {
                int max_value = 0;
                for(int i = 0; i < denominations.size(); i++) {
                        if(denominations[i] + curr_value <= n) {
                                max_value = max(max_value, denominations[i]);
                        }
                }

                curr_value += max_value;
                coins++;
        }

        cout << coins << endl;
}

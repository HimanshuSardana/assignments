// 2. A = [2, 5, 8, 12, 16, 23, 38, 56, 72, 91], Binary Search to find 23
#include <bits/stdc++.h>

using namespace std;

int main() {
        vector<int> v = {2, 5, 8, 12, 16, 23, 38, 56, 72, 91};
        int target = 23;
        int low = 0;
        int high = v.size() - 1;

        int idx = 0;
        bool found = false;

        while(low <= high) {
                int mid = low + (high - low) / 2;
                if(v[mid] == target) {
                        found = true;
                        idx = mid;
                        break;
                } 

                else if(v[mid] < target) {
                        low = mid + 1;
                }

                else {
                        high = mid - 1;
                }
        }

        if(found) cout << "Element found at index " << idx << '\n';
        else cout << "Element not found" << "\n";
}

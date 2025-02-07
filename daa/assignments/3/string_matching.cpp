#include <bits/stdc++.h>

using namespace std;

int main() {
        string s1 = "agctagct";
        string s2 = "ag";

        int chars_matched = 0;
        vector<int> idxs;
        int freq = 0;

        for(int i = 0; i < s1.size(); i++) {
                if (s1[i] == s2[chars_matched] && chars_matched != s2.size() - 1) {
                        chars_matched++;
                }

                else if(s1[i] == s2[chars_matched] && chars_matched == s2.size() - 1) {
                        idxs.push_back(i - s2.size() + 1);
                        chars_matched = 0;
                        freq += 1;
                }

                else {
                        chars_matched = 0;
                }
        }

        cout << freq << endl;

        for(auto i : idxs) {
                cout << "Occurence of " << s2 << " at index: " << i << endl;
        }
}

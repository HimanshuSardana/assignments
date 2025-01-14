// input p, r
// input allocation_matrix (p x r)
// input maximum_matrix (p x r)
// calculate need_matrix (maximum - allocation)
// input available_resources vector
// initialize bool vector finished of size p with false as default 
// let completed = 0
// while completed < n
//     bool found = false (if safe sequence was found) 
//      loop i from 0 to p     
//              if(!finished[i])
//                      bool can_execute = true
//                      check if it can be fulfilled by checking need and available resources
//                              if not, can_execute = false, break
//                      if it can be, add allocation to available resources (freeing up resources)
//                      push i to safe sequence
//                      set finished[i] = true
//                      completed = 1
//                      found = true
//      if (!found) {
//              system is in unsafe state
//      }
//      else {
//              system is in safe state, print safe_sequence 
//      }
#include <bits/stdc++.h>

using namespace std;

int main() {
        int p, r;
        cout << "Enter number of processes: ";
        cin >> p;

        cout << "Enter number of resources: ";
        cin >> r;

        vector<vector<int>> allocation(p, vector<int>(r));
        cout << "Enter allocation matrix: " << endl;
        for(int i = 0; i < p; i++) {
                for(int j = 0; j < r; j++) {
                        cout << "Allocation[" << i <<"][" << j << "]: ";
                        cin >> allocation[i][j];
                }
        }

        vector<vector<int>> maximum(p, vector<int>(r));
        cout << "Enter maximum matrix: " << endl;
        for(int i = 0; i < p; i++) {
                for(int j = 0; j < r; j++) {
                        cout << "Maximum[" << i <<"][" << j << "]: ";
                        cin >> maximum[i][j];
                }
        }

        vector<vector<int>> need(p, vector<int>(r));
        for(int i = 0; i < p; i++) {
                for(int j = 0; j < r; j++) {
                        need[i][j] = maximum[i][j] - allocation[i][j];
                }
        }

        vector<int> available(r);
        cout << "Enter available resources: ";
        for(int i = 0; i < r; i++) {
                cin >> available[i];
        }

        vector<bool> finished(p, false);
        vector<int> safe_seq;

        int count = 0;

        while(count < p) {
                bool found = false;

                for(int i = 0; i < p; i++) {
                        if(!finished[i]) {
                                bool can_execute = true;

                                for(int j = 0; j < r; j++) {
                                        if(need[i][j] > available[j]) {
                                                can_execute = false;
                                                break;
                                        }
                                        if(can_execute) {
                                                for(int i = 0; j < r; i++) {
                                                        available[j] += allocation[i][j];
                                                        count++;
                                                        safe_seq.push_back(i);
                                                        finished[i] = true;
                                                        found = true;
                                                }
                                        }

                                }
                        }
                }

                if(!found) {
                        cout << "System is in unsafe state";
                }

                else {
                        cout << "System is in safe state";
                        for(int i = 0; i < p; i++) {
                                cout << safe_seq[i] << "->";
                        }
                }
        }


}

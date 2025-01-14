#include <bits/stdc++.h>
using namespace std;

int main() {
    int p, r;
    cout << "Enter the number of processes: ";
    cin >> p;

    cout << "Enter the number of resources: ";
    cin >> r;

    vector<vector<int>> allocation(p, vector<int>(r)); // Allocation matrix
    cout << "Enter allocation matrix:\n";
    for (int i = 0; i < p; i++) {
        for (int j = 0; j < r; j++) {
            cout << "Enter allocation for process " << i << " and resource " << j << ": ";
            cin >> allocation[i][j];
        }
    }

    vector<vector<int>> maximum(p, vector<int>(r)); // Maximum matrix
    cout << "Enter maximum matrix:\n";
    for (int i = 0; i < p; i++) {
        for (int j = 0; j < r; j++) {
            cout << "Enter maximum for process " << i << " and resource " << j << ": ";
            cin >> maximum[i][j];
        }
    }

    vector<vector<int>> need(p, vector<int>(r)); // Need matrix
    for (int i = 0; i < p; i++) {
        for (int j = 0; j < r; j++) {
            need[i][j] = maximum[i][j] - allocation[i][j];
        }
    }

    vector<int> available_resources(r); // Available resources vector
    cout << "Enter available resources: ";
    for (int i = 0; i < r; i++) {
        cin >> available_resources[i];
    }

    vector<bool> finished(p, false); // Finish vector to track process execution
    vector<int> safe_sequence;      // To store the safe sequence
    int count = 0;                  // Number of completed processes

    // Banker's Algorithm
    while (count < p) {
        bool found = false;

        for (int i = 0; i < p; i++) {
            if (!finished[i]) {
                bool can_execute = true;

                // Check if resources can be allocated to process i
                for (int j = 0; j < r; j++) {
                    if (need[i][j] > available_resources[j]) {
                        can_execute = false;
                        break;
                    }
                }

                if (can_execute) {
                    // Simulate resource allocation
                    for (int j = 0; j < r; j++) {
                        available_resources[j] += allocation[i][j];
                    }

                    safe_sequence.push_back(i);
                    finished[i] = true;
                    count++;
                    found = true;
                }
            }
        }

        if (!found) {
            cout << "System is in an unsafe state.\n";
            return 0; // Exit the program since no safe sequence exists
        }
    }

    // Safe state and safe sequence
    cout << "System is in a safe state.\n";
    cout << "Safe sequence: ";
    for (int i = 0; i < safe_sequence.size(); i++) {
        cout << "P" << safe_sequence[i];
        if (i < safe_sequence.size() - 1) cout << " -> ";
    }
    cout << endl;

    return 0;
}


#include <bits/stdc++.h>

using namespace std;

struct Process {
        int pid;
        int arrival_time;
        int burst_time; 
        int completion_time;
};

int main() {
        int n;
        cout << "Enter number of processees: ";
        cin >> n; 
        vector<Process> processes(n);

        for(int i = 0; i < n; i++) {
                processes[i].pid = i+1;
                cout << "Enter arrival time of process " << i+1 << ": ";
                cin >> processes[i].arrival_time;

                cout << "Enter burst time of process " << i+1 << ": ";
                cin >> processes[i].burst_time;

                cout << endl; 
        }

        cout << "PID\tAT\tBT\tCT\n";
        for(int i = 0; i < n; i++) {
                cout << processes[i].pid << "\t" << processes[i].arrival_time<< "\t" << processes[i].burst_time<< "\t" << processes[i].completion_time<< endl;
        }

}

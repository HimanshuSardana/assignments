// Sort by arrival time (if arrival time is same, sort by burst time)
// loop i from 0 to n
//      if current_time < processes[i].arrival_time
//              current_time = processes[i].arrival_time
//      processes[i].completion_time = current_time + processes[i].burst_time
//      current_time = processes[i].completion_time

#include <bits/stdc++.h>

using namespace std;

struct Process {
        int pid;
        int arrival_time;
        int burst_time;
        int completion_time;
};

bool compareArrivalTime(Process p1, Process p2) {
        if (p1.arrival_time == p2.arrival_time) {
                return p1.burst_time < p2.burst_time;
        }
        return p1.arrival_time < p2.arrival_time;
}

int main() {
        int n;
        cout << "Enter number of processes: ";
        cin >> n;

        vector<Process> processes(n);

        for(int i = 0; i < n; i++) {
                processes[i].pid = i+1;
                cout << "Enter arrival time of process " << i+1 << ": ";
                cin >> processes[i].arrival_time;

                cout << "Enter burst arrival time of process " << i+1 << ": ";
                cin >> processes[i].burst_time;
        }

        sort(processes.begin(), processes.end(), compareArrivalTime);

        int current_time = 0;
        for(int i = 0; i < n; i++) {
                if(current_time < processes[i].arrival_time) {
                        current_time = processes[i].arrival_time;
                }

                processes[i].completion_time = processes[i].burst_time + current_time;
                current_time = processes[i].completion_time;
        }

        cout << "PID\tAT\tBT\tCT\n";
        for(auto &p: processes) {
                cout << p.pid << "\t" << p.arrival_time << "\t" << p.burst_time << "\t" << p.completion_time << "\n";
        }

}

// Sort processes by arrival time (if same, sort by priority)
// loop over 0 to n 
//      if current time < arrival time of process[i]
//              current time = arrival time of process[i]
//
//      completion time = current time + burst time of process[i]
//      current time = completion time

#include <bits/stdc++.h>

using namespace std;


struct Process {
        int pid;
        int arrival_time;
        int burst_time;
        int completion_time;
        int priority; // Lower number --> higher priority
};

bool compareArrivalTime(Process p1, Process p2) {
        if (p1.arrival_time == p2.arrival_time) {
                return p1.priority < p2.priority;
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

                cout << "Enter burst time of process " << i+1 << ": ";
                cin >> processes[i].burst_time;

                cout << "Enter priority of process " << i+1 << ": ";
                cin >> processes[i].priority;
        }

        sort(processes.begin(), processes.end(), compareArrivalTime);

        int current_time = 0;
        for(int i = 0; i < n; i++) {
                if(processes[i].arrival_time > current_time) {
                        current_time++;
                }

                processes[i].completion_time = current_time + processes[i].burst_time;
                current_time = processes[i].completion_time;
        }

        cout << "PID\tAT\tBT\tPriority\tCT\n";
        for(auto &p: processes) {
                cout << p.pid << "\t" << p.arrival_time << "\t" << p.burst_time << "\t" << p.priority << "\t" << p.completion_time << "\n";
        }
}

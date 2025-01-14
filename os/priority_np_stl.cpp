#include <bits/stdc++.h>

using namespace std;

struct Process {
        int id;
        int arrival_time;
        int burst_time;
        int priority;
        int completion_time;
};

bool compare(Process p1, Process p2) {
        // higher priority -> lower number
        if (p1.arrival_time == p2.arrival_time) {
                return p1.priority < p2.priority; // lower number -> higher priority
        }

        return p1.arrival_time < p2.arrival_time;
}

int main() {
        int n;
        cout << "Enter the number of processes: ";
        cin >> n;

        vector<Process> processes(n);
        for (int i = 0; i < n; i++) {
                processes[i].id = i + 1;
                cout << "Enter arrival time of process " << i+1 << ": ";
                cin >> processes[i].arrival_time;

                cout << "Enter burst time of process " << i+1 << ": ";
                cin >> processes[i].burst_time;

                cout << "Enter priority of process " << i+1 << ": ";
                cin >> processes[i].priority;
        }

        sort(processes.begin(), processes.end(), compare);

        int current_time = 0;
        for(auto &p: processes) {
                if(p.arrival_time > current_time) {
                        // Idle CPU for p.arrival_time - current_time
                        current_time = p.arrival_time;
                }
                p.completion_time = current_time + p.burst_time;
                current_time = p.completion_time;
        }

        cout << "PID\tAT\tBT\tPriority\tCompletion Time\n";
        for(auto p: processes) {
                cout << p.id << "\t" << p.arrival_time << "\t" << p.burst_time << "\t" << p.priority << "\t" << p.completion_time << endl;
        }
}

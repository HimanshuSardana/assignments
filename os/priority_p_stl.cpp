#include <bits/stdc++.h>

using namespace std;

struct Process {
        int id;
        int arrival_time;
        int burst_time;
        int priority;
        int completion_time;
        int remaining_time;
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

        for(int i = 0; i < n; i++) {
                processes[i].id = i + 1;
                cout << "Enter arrival time of process " << i+1 << ": ";
                cin >> processes[i].arrival_time;

                cout << "Enter burst time of process " << i+1 << ": ";
                cin >> processes[i].burst_time;

                cout << "Enter priority of process " << i+1 << ": ";
                cin >> processes[i].priority;

                processes[i].remaining_time = processes[i].burst_time;
        }

        sort(processes.begin(), processes.end(), compare);

        int current_time = 0;
        int completed = 0;

        while(completed < n) {
                int selected_process = -1;
                int highest_priority = INT_MAX;

                for(int i = 0; i < n; i++) {
                        if(processes[i].arrival_time <= current_time && processes[i].priority < highest_priority && processes[i].remaining_time > 0) {
                                selected_process = i;
                                highest_priority = processes[i].priority;
                        }
                }

                if(selected_process == -1) { // No process available
                        current_time++;
                } else {
                        processes[selected_process].remaining_time--;
                        current_time++;

                        if(processes[selected_process].remaining_time == 0) {
                                processes[selected_process].completion_time = current_time;
                                completed++;
                        }
                }
        }

        cout << "PID\tAT\tBT\tPriority\tCompletion Time\n";
        for(auto p: processes) {
                cout << p.id << "\t" << p.arrival_time << "\t" << p.burst_time << "\t" << p.priority << "\t" << p.completion_time << endl;
        }
}

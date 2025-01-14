// Same as srtf just change comparator function to consider priority 
#include <bits/stdc++.h>

using namespace std;

struct Process {
        int pid;
        int arrival_time;
        int burst_time;
        int remaining_time;
        int completion_time;
        int priority; // lower number --> higher priority;
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
                cout << "Enter arrival time of process " << i + 1 << ": ";
                cin >> processes[i].arrival_time;

                cout << "Enter burst time of process " << i + 1 << ": ";
                cin >> processes[i].burst_time;

                cout << "Enter priority of process " << i + 1 << ": ";
                cin >> processes[i].priority;

                processes[i].remaining_time = processes[i].burst_time;
        }

        int completed = 0;
        int current_time = 0;

        while(completed != n) {
                sort(processes.begin(), processes.end(), compareArrivalTime);
                int min_remaining_time = INT_MAX;
                int min_remaining_time_index = -1;

                for(int i = 0; i < n; i++) {
                        if(processes[i].arrival_time < current_time && processes[i].remaining_time > 0 && processes[i].remaining_time < min_remaining_time) {
                                min_remaining_time = processes[i].remaining_time;
                                min_remaining_time_index = i;
                        }
                }

                if(current_time < processes[min_remaining_time_index].arrival_time) {
                        current_time++;
                        continue;
                }

                processes[min_remaining_time_index].remaining_time--;
                current_time++;

                if(processes[min_remaining_time_index].remaining_time == 0) {
                        completed++;
                        processes[min_remaining_time_index].completion_time = current_time;
                }
        }

                cout << "PID\tAT\tBT\tPriority\tCT\n";
        for(int i = 0; i < n; i++) {
                cout << processes[i].pid << "\t" << processes[i].arrival_time << "\t" << processes[i].burst_time << "\t" << processes[i].priority << "\t\t" << processes[i].completion_time << endl;
        }

}

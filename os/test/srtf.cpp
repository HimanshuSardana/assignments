// Let every process' remaining_time equal to its burst time
// Initialize completed_processes = 0
// while(completed_processes != n) {
//      sort by arrival_time (if same, sort by burst_time)
//      let min_time = INT_MAX
//      let min_time_process_index = -1
//
//      loop i from 0 to n
//              if (processes[i].arrival_time < current_time (i.e process has arrived) && processes[i].remaining_time < min_time && processes[i].remaining_time > 0) {
//                     min_time = processes[i].remaining_time 
//                     min_time_index = i
//              }
//              
//        // if no process has arrived yet
//        if(min_time_process_index == -1) {
//        current_time = processes[i].arrival_time
//        }
//
//        processes[i].remaining_time--
//        current_time++
//
//        if (processes[min_time_remaining_index].remaining_time == 0) {
//              completed++;
//              processes[min_time_remaining_index].completion_time = current_time
//        }
// }
#include <bits/stdc++.h>

using namespace std;

struct Process {
        int pid;
        int arrival_time;
        int burst_time;
        int completion_time;
        int remaining_time;
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
                processes[i].remaining_time = processes[i].burst_time;
        }

        int completed = 0;
        int current_time = 0;

        while(completed != n) {
                sort(processes.begin(), processes.end(), compareArrivalTime);

                int min_remaining_time = INT_MAX;
                int min_remaining_time_index = -1;

                for(int i = 0; i < n; i++) {
                        if(processes[i].arrival_time <= current_time && processes[i].remaining_time > 0 && processes[i].remaining_time < min_remaining_time) {
                                min_remaining_time = processes[i].remaining_time;
                                min_remaining_time_index = i;
                        }
                
                }
                if(min_remaining_time_index == -1) {
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

        cout << "PID\tAT\tBT\tCT\n";
        for(int i = 0; i < n; i++) {
                cout << processes[i].pid << "\t" << processes[i].arrival_time << "\t" << processes[i].burst_time << "\t" << processes[i].completion_time << endl;
        }
}

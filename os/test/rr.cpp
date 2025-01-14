// Same as SRTF/Preemtpive Priority, instead of remainingTime--, do remainingTime -= min(remainingTime, timeQuantum)
#include <bits/stdc++.h>

using namespace std;

struct Process {
        int pid;
        int arrivalTime;
        int burstTime;
        int completionTime;
        int remainingTime;
};

bool compareArrivalTime(Process p1, Process p2) {
        return p1.arrivalTime < p2.arrivalTime;
}

int main() {
        int n;
        cout << "Enter number of processes: ";
        cin >> n;
        vector<Process> processes(n);

        for(int i = 0; i < n; i++) {
                processes[i].pid = i+1;
                cout << "Enter arrival time of process " << i+1 << ": ";
                cin >> processes[i].arrivalTime;

                cout << "Enter burst time of process " << i+1 << ": ";
                cin >> processes[i].burstTime;

                cout << endl;
                processes[i].remainingTime = processes[i].burstTime;
        }

        int timeQuantum;
        cout << "Enter time quantum: ";
        cin >> timeQuantum;

        int completed = 0;
        int current_time = 0;

        while(completed != n) {
                int min_remaining_time = INT_MAX;
                int min_remaining_time_index = -1;

                for(int i = 0; i < n; i++) {
                        if(processes[i].arrivalTime < current_time && processes[i].remainingTime > 0 && processes[i].remainingTime < min_remaining_time) {
                                min_remaining_time_index = i;
                                min_remaining_time = processes[i].remainingTime;
                        }
                }

               if(min_remaining_time_index == -1) {
                        current_time++;
                        continue;
                }

                current_time += min(processes[min_remaining_time_index].remainingTime, timeQuantum);
                processes[min_remaining_time_index].remainingTime -= min(processes[min_remaining_time_index].remainingTime, timeQuantum);

                if(processes[min_remaining_time_index].remainingTime == 0) {
                        completed++;
                        processes[min_remaining_time_index].completionTime = current_time;
                }
        }


        cout << "PID\tAT\tBT\tCT\n";
        for(int i = 0; i < n; i++) {
                cout << processes[i].pid << "\t" << processes[i].arrivalTime << "\t" << processes[i].burstTime << "\t" << processes[i].completionTime << endl;
        }
}

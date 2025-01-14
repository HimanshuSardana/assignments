#include <bits/stdc++.h>
#include <climits>

using namespace std;

struct Process {
        int id;
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
        int completed = 0;
        int n;
        cout << "Enter the number of processes: ";
        cin >> n;

        vector<Process> processes(n);

        for(int i = 0; i < n; i++) {
                cout << "Enter arrival time of process " << i + 1 << ": ";
                cin >> processes[i].arrival_time;

                cout << "Enter burst time of process " << i + 1 << ": ";
                cin >> processes[i].burst_time;
                processes[i].remaining_time = processes[i].burst_time;
        }

        int current_time = 0;
        while(completed != n) {
                sort(processes.begin(), processes.end(), compareArrivalTime);
                int min_remaining_time = INT_MAX;
                int min_remaining_time_index = -1;

                for(int i = 0; i < n; i++) {
                        if(processes[i].arrival_time <= current_time && processes[i].remaining_time < min_remaining_time && processes[i].remaining_time > 0) {
                                min_remaining_time = processes[i].remaining_time;
                                min_remaining_time_index = i;
                        }
                }

                // no process available at current time, then increment the current time
                if(min_remaining_time_index == -1) {
                        current_time++;
                        continue;
                }

                processes[min_remaining_time_index].remaining_time--;
                current_time++;

                // process completed
                if(processes[min_remaining_time_index].remaining_time == 0) {
                        completed++;
                        processes[min_remaining_time_index].completion_time = current_time;
                }
        }

        cout << "Process\tArrival Time\tBurst Time\tCompletion Time\n";
        for(int i = 0; i < n; i++) {
                cout << i + 1 << "\t" << processes[i].arrival_time << "\t\t" << processes[i].burst_time << "\t\t" << processes[i].completion_time << "\n";
        }

}

#include <bits/stdc++.h>

using namespace std;

struct Process {
    int id;
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
        cout << "Enter the number of processes: ";
        cin >> n;

        vector<Process> processes(n);

        for(int i = 0; i < n; i++) {
                cout << "Enter arrival time of process " << i + 1 << ": ";
                cin >> processes[i].arrival_time;

                cout << "Enter burst time of process " << i + 1 << ": ";
                cin >> processes[i].burst_time;
        }

        sort(processes.begin(), processes.end(), compareArrivalTime);

        int current_time = 0;
        for(int i = 0; i < n; i++) {
                if(current_time < processes[i].arrival_time) {
                        current_time = processes[i].arrival_time;
                }
                current_time += processes[i].burst_time;
                processes[i].completion_time = current_time;
        }


        cout << "Process\tArrival Time\tBurst Time\tCompletion Time\n";
        for(int i = 0; i < n; i++) {
                cout << processes[i].id << "\t" << processes[i].arrival_time << "\t\t" << processes[i].burst_time << "\t\t" << processes[i].completion_time << "\n";
        }

}

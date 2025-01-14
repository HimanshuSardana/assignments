#include <bits/stdc++.h>

using namespace std;

struct Process {
        int pid;
        int arrivalTime;
        int burstTime;
        int completionTime;
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
        }

        sort(processes.begin(), processes.end(), compareArrivalTime);

        int currentTime = 0;
        for(int i = 0; i < n; i++) {
                if(currentTime < processes[i].arrivalTime) {
                        // If the process has not arrived yet
                        currentTime = processes[i].arrivalTime;
                }

                processes[i].completionTime = currentTime + processes[i].burstTime;  
                currentTime = processes[i].completionTime;
        }

        cout << "PID\tAT\tBT\tCT\n";
        for(int i = 0; i < n; i++) {
                cout << processes[i].pid << "\t" << processes[i].arrivalTime << "\t" << processes[i].burstTime << "\t" << processes[i].completionTime << endl;
        }
}

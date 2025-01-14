#include <bits/stdc++.h>
using namespace std;

struct Process {
        int id;
        int arrival_time;
        int burst_time;
        int completion_time;
        int remaining_time;
        int waiting_time;
        int turnaround_time;
};

bool compareArrivalTime(Process p1, Process p2) {
        return p1.arrival_time < p2.arrival_time;
}

int main() {
        int completed = 0;
        int n;
        cout << "Enter the number of processes: ";
        cin >> n;

        vector<Process> processes(n);

        for (int i = 0; i < n; i++) {
                processes[i].id = i + 1;
                cout << "Enter arrival time of process " << i + 1 << ": ";
                cin >> processes[i].arrival_time;

                cout << "Enter burst time of process " << i + 1 << ": ";
                cin >> processes[i].burst_time;
                processes[i].remaining_time = processes[i].burst_time;
                processes[i].waiting_time = 0;  // Initial waiting time
                processes[i].turnaround_time = 0; // Initial turnaround time
        }

        int current_time = 0;
        int time_quantum;
        cout << "Enter time quantum: ";
        cin >> time_quantum;

        // Sort processes by arrival time
        sort(processes.begin(), processes.end(), compareArrivalTime);

        vector<int> readyQueue;  // Queue of ready processes
        int i = 0; // To track the next process to add to the ready queue

        // Round Robin scheduling loop
        while (completed != n) {
                // Add processes that have arrived and are ready for execution
                while (i < n && processes[i].arrival_time <= current_time) {
                        readyQueue.push_back(i);
                        i++;
                }

                // Process the ready queue
                if (!readyQueue.empty()) {
                        int idx = readyQueue.front(); // Get the next process
                        readyQueue.erase(readyQueue.begin()); // Remove from ready queue

                        // Execute the process for a time quantum or remaining time
                        int time_to_run = min(time_quantum, processes[idx].remaining_time);
                        processes[idx].remaining_time -= time_to_run;
                        current_time += time_to_run;

                        // If the process is completed, update its completion time and calculate waiting and turnaround times
                        if (processes[idx].remaining_time == 0) {
                                processes[idx].completion_time = current_time;
                                processes[idx].turnaround_time = processes[idx].completion_time - processes[idx].arrival_time;
                                processes[idx].waiting_time = processes[idx].turnaround_time - processes[idx].burst_time;
                                completed++;
                        } else {
                                // If the process is not finished, add it back to the ready queue
                                readyQueue.push_back(idx);
                        }
                } else {
                        // If no processes are ready, increment the current time to the next process's arrival time
                        if (i < n) {
                                current_time = processes[i].arrival_time;
                        }
                }
        }

        // Display results
        cout << "Process\tArrival Time\tBurst Time\tCompletion Time\tWaiting Time\tTurnaround Time\n";
        for (int i = 0; i < n; i++) {
                cout << processes[i].id << "\t" << processes[i].arrival_time << "\t\t" 
                        << processes[i].burst_time << "\t\t" << processes[i].completion_time << "\t\t" 
                        << processes[i].waiting_time << "\t\t" << processes[i].turnaround_time << "\n";
        }

        // Calculate and display average waiting time and turnaround time
        double total_waiting_time = 0, total_turnaround_time = 0;
        for (int i = 0; i < n; i++) {
                total_waiting_time += processes[i].waiting_time;
                total_turnaround_time += processes[i].turnaround_time;
        }

        cout << "Average Waiting Time: " << total_waiting_time / n << "\n";
        cout << "Average Turnaround Time: " << total_turnaround_time / n << "\n";

        return 0;
}


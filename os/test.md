### FCFS
```c++
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
```

### SJF
```c++
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
```

### SRTF
```c++
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
```

### Priority Scheduling (Non-preemptive)
```c++
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
```

### Priority Scheduling (Preemptive)
```c++
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
```

### Round Robin
```c++
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
```

### Deadlock (Banker's Algorithm)
```c++
#include <bits/stdc++.h>
using namespace std;

int main() {
    int p, r;
    cout << "Enter the number of processes: ";
    cin >> p;

    cout << "Enter the number of resources: ";
    cin >> r;

    vector<vector<int>> allocation(p, vector<int>(r)); // Allocation matrix
    cout << "Enter allocation matrix:\n";
    for (int i = 0; i < p; i++) {
        for (int j = 0; j < r; j++) {
            cout << "Enter allocation for process " << i << " and resource " << j << ": ";
            cin >> allocation[i][j];
        }
    }

    vector<vector<int>> maximum(p, vector<int>(r)); // Maximum matrix
    cout << "Enter maximum matrix:\n";
    for (int i = 0; i < p; i++) {
        for (int j = 0; j < r; j++) {
            cout << "Enter maximum for process " << i << " and resource " << j << ": ";
            cin >> maximum[i][j];
        }
    }

    vector<vector<int>> need(p, vector<int>(r)); // Need matrix
    for (int i = 0; i < p; i++) {
        for (int j = 0; j < r; j++) {
            need[i][j] = maximum[i][j] - allocation[i][j];
        }
    }

    vector<int> available_resources(r); // Available resources vector
    cout << "Enter available resources: ";
    for (int i = 0; i < r; i++) {
        cin >> available_resources[i];
    }

    vector<bool> finished(p, false); // Finish vector to track process execution
    vector<int> safe_sequence;      // To store the safe sequence
    int count = 0;                  // Number of completed processes

    // Banker's Algorithm
    while (count < p) {
        bool found = false;

        for (int i = 0; i < p; i++) {
            if (!finished[i]) {
                bool can_execute = true;

                // Check if resources can be allocated to process i
                for (int j = 0; j < r; j++) {
                    if (need[i][j] > available_resources[j]) {
                        can_execute = false;
                        break;
                    }
                }

                if (can_execute) {
                    // Simulate resource allocation
                    for (int j = 0; j < r; j++) {
                        available_resources[j] += allocation[i][j];
                    }

                    safe_sequence.push_back(i);
                    finished[i] = true;
                    count++;
                    found = true;
                }
            }
        }

        if (!found) {
            cout << "System is in an unsafe state.\n";
            return 0; // Exit the program since no safe sequence exists
        }
    }

    // Safe state and safe sequence
    cout << "System is in a safe state.\n";
    cout << "Safe sequence: ";
    for (int i = 0; i < safe_sequence.size(); i++) {
        cout << "P" << safe_sequence[i];
        if (i < safe_sequence.size() - 1) cout << " -> ";
    }
    cout << endl;

    return 0;
}
```

### Producer Consumer Problem
```c++
#include <bits/stdc++.h>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <chrono>

using namespace std;

queue<int> buffer;
const int max_size = 10;
mutex mtx;
condition_variable cv;

void producer() {
        while (true) {
                unique_lock<mutex> lock(mtx); // RAII (Resource Acquisition Is Initialization)
                cv.wait(lock, [] { return buffer.size() < max_size; });
                buffer.push(1);
                cout << "Produced: " << buffer.size() << endl;
                lock.unlock();
                cv.notify_all();
                this_thread::sleep_for(chrono::milliseconds(1000));
        }
}

void consumer() {
        while (true) {
                unique_lock<mutex> lock(mtx);
                cv.wait(lock, [] { return buffer.size() > 0; });
                buffer.pop();
                cout << "Consumed: " << buffer.size() << endl;
                lock.unlock();
                cv.notify_all();
                this_thread::sleep_for(chrono::milliseconds(1000));
        }
}

int main() {
        int producer_count = 2;
        int consumer_count = 2;

        int itemsPerProducer = 10;
        int itemsPerConsumer = 10;

        vector<thread> producers;
        vector<thread> consumers;

        // Launch producer threads
        for (int i = 0; i < producer_count; i++) {
                producers.emplace_back(producer, i+1, itemsPerProducer);
        }

        // Launch consumer threads
        for(int i = 0; i < consumer_count; i++) {
                consumers.emplace_back(consumer, i+1, itemsPerConsumer);
        }

        // wait for producer threads to finish
        for (auto &t : producers) {
                t.join();
        }

        // wait for consumer threads to finish
        for (auto &t : consumers) {
                t.join();
        }

        cout << "Finished" << endl;
        return 0;
}
```

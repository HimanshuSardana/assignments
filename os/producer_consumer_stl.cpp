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

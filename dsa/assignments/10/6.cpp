// Implemenet Djikstra's algorithm using priority queue
#include <bits/stdc++.h>

using namespace std;

class Graph {
        int V, E;
        vector<pair<int, pair<int, int>>> edges;
public:
        Graph(int V, int E);
        void addEdge(int u, int v, int w);
        void dijkstra(int s);
};

Graph::Graph(int V, int E) {
        this->V = V;
        this->E = E;
}

void Graph::addEdge(int u, int v, int w) {
        edges.push_back({w, {u, v}});
}

void Graph::dijkstra(int s) {
        sort(edges.begin(), edges.end());

        vector<int> dist(V, INT_MAX);

        dist[s] = 0;

        priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> pq;

        pq.push({0, s});

        while(!pq.empty()) {
                int u = pq.top().second;
                pq.pop();

                for(auto edge : edges) {
                        int v = edge.second.second;
                        int w = edge.first;

                        if(dist[v] > dist[u] + w) {
                                dist[v] = dist[u] + w;
                                pq.push({dist[v], v});
                        }
                }
        }

        for(int i = 0; i < V; i++)
                cout << i << " " << dist[i] << endl;
}

int main() {
        Graph g(9, 14);
        g.addEdge(0, 1, 4);
        g.addEdge(0, 7, 8);
        g.addEdge(1, 2, 8);
        g.addEdge(1, 7, 11);
        g.addEdge(2, 3, 7);
        g.addEdge(2, 8, 2);
        g.addEdge(2, 5, 4);
        g.addEdge(3, 4, 9);
        g.addEdge(3, 5, 14);
        g.addEdge(4, 5, 10);
        g.addEdge(5, 6, 2);
        g.addEdge(6, 7, 1);
        g.addEdge(6, 8, 6);
        g.addEdge(7, 8, 7);

        g.dijkstra(0);

        return 0;
}

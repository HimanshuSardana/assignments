// Implement Prim's minimum spanning tree algorithm
#include <bits/stdc++.h>

using namespace std;

class Graph {
        int V, E;
        vector<pair<int, pair<int, int>>> edges;
public:
        Graph(int V, int E);
        void addEdge(int u, int v, int w);
        void primsMST();
};

Graph::Graph(int V, int E) {
        this->V = V;
        this->E = E;
}

void Graph::addEdge(int u, int v, int w) {
        edges.push_back({w, {u, v}});
}

void Graph::primsMST() {
        sort(edges.begin(), edges.end());

        vector<int> parent(V);

        for(int i = 0; i < V; i++)
                parent[i] = i;

        int mstWeight = 0;

        for(auto edge : edges) {
                int u = edge.second.first;
                int v = edge.second.second;

                int setU = u;
                int setV = v;

                while(parent[setU] != setU)
                        setU = parent[setU];

                while(parent[setV] != setV)
                        setV = parent[setV];

                if(setU != setV) {
                        mstWeight += edge.first;
                        parent[setU] = setV;
                }
        }

        cout << "Minimum Spanning Tree Weight: " << mstWeight << endl;
}

int main() {
        Graph g(4, 5);
        g.addEdge(0, 1, 10);
        g.addEdge(0, 2, 6);
        g.addEdge(0, 3, 5);
        g.addEdge(1, 3, 15);
        g.addEdge(2, 3, 4);

        g.primsMST();

        return 0;        
}

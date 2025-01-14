// Write a program to represent a graph using adjacency matrix/list and perform basic
/*operations like degree (in/out) of a vertex, adjacent vertices, number of edges, etc.*/

#include <bits/stdc++.h>

using namespace std;

class Graph {
        int V;
        list<int> *adj;
public:
        Graph(int V);
        void addEdge(int v, int w);
        void degree(int v);
        void adjacentVertices(int v);
        void numEdges();
};

Graph::Graph(int V) {
        this->V = V;
        adj = new list<int>[V];
}

void Graph::addEdge(int v, int w) {
        adj[v].push_back(w);
}

void Graph::degree(int v) {
        cout << "Degree of vertex " << v << " is " << adj[v].size() << endl;
}

void Graph::adjacentVertices(int v) {
        cout << "Adjacent vertices of vertex " << v << " are: ";
        for(auto i = adj[v].begin(); i != adj[v].end(); i++) {
                cout << *i << " ";
        }
        cout << endl;
}

void Graph::numEdges() {
        int count = 0;
        for(int i = 0; i < V; i++) {
                count += adj[i].size();
        }
        cout << "Number of edges in the graph are " << count << endl;
}

int main() {
        Graph g(4);
        g.addEdge(0, 1);
        g.addEdge(0, 2);
        g.addEdge(1, 2);
        g.addEdge(2, 0);
        g.addEdge(2, 3);
        g.addEdge(3, 3);

        g.degree(2);
        g.adjacentVertices(2);
        g.numEdges();

        return 0;
}

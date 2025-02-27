/*Write a program to implement depth first search algorithm.*/

#include <bits/stdc++.h>

using namespace std;

class Graph {
        int V;
        list<int> *adj;
public:
        Graph(int V);
        void addEdge(int v, int w);
        void DFS(int s);
};

Graph::Graph(int V) {
        this->V = V;
        adj = new list<int>[V];
}

void Graph::addEdge(int v, int w) {
        adj[v].push_back(w);
}

void Graph::DFS(int s) {
        bool *visited = new bool[V];
        for(int i = 0; i < V; i++)
                visited[i] = false;

        stack<int> stack;

        visited[s] = true;
        stack.push(s);

        list<int>::iterator i;

        while(!stack.empty()) {
                s = stack.top();
                cout << s << " ";
                stack.pop();

                for(i = adj[s].begin(); i != adj[s].end(); i++) {
                        if(!visited[*i]) {
                                visited[*i] = true;
                                stack.push(*i);
                        }
                }
        }
}

int main() {
        Graph g(4);
        g.addEdge(0, 1);
        g.addEdge(0, 2);
        g.addEdge(1, 2);
        g.addEdge(2, 0);
        g.addEdge(2, 3);
        g.addEdge(3, 3);

        cout << "Depth First Traversal starting from vertex 2: ";
        g.DFS(2);

        return 0;
}

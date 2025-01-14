### Graphs
### Assignment 10
##### by Himanshu Sardana

**Q1: Write a program to represent a graph using adjacency matrix/list and perform basic operations like degree (in/out) of a vertex, adjacent vertices, number of edges, etc.** 
```c++
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
```

**Q2: Write a program to implement breadth first search algorithm** 
```c++
#include <bits/stdc++.h>

using namespace std;

class Graph {
        int V;
        list<int> *adj;
public:
        Graph(int V);
        void addEdge(int v, int w);
        void BFS(int s);
};

Graph::Graph(int V) {
        this->V = V;
        adj = new list<int>[V];
}

void Graph::addEdge(int v, int w) {
        adj[v].push_back(w);
}

void Graph::BFS(int s) {
        bool *visited = new bool[V];
        for(int i = 0; i < V; i++)
                visited[i] = false;

        list<int> queue;

        visited[s] = true;
        queue.push_back(s);

        list<int>::iterator i;

        while(!queue.empty()) {
                s = queue.front();
                cout << s << " ";
                queue.pop_front();

                for(i = adj[s].begin(); i != adj[s].end(); i++) {
                        if(!visited[*i]) {
                                visited[*i] = true;
                                queue.push_back(*i);
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

        cout << "Breadth First Traversal starting from vertex 2: ";
        g.BFS(2);

        return 0;
}
```

**Q3: Write a program to implement depth first search algorithm** 
```c++
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
```

**Q4: Write a program to implement kruskal's minimum spanning tree algorithm.** 
```c++
#include <bits/stdc++.h>

using namespace std;

class Graph {
        int V, E;
        vector<pair<int, pair<int, int>>> edges;
public:
        Graph(int V, int E);
        void addEdge(int u, int v, int w);
        void kruskalMST();
};

Graph::Graph(int V, int E) {
        this->V = V;
        this->E = E;
}

void Graph::addEdge(int u, int v, int w) {
        edges.push_back({w, {u, v}});
}

void Graph::kruskalMST() {
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

        g.kruskalMST();

        return 0;        
}
```

**Q5: Write a program to implement prim's minimum spanning tree algorithm.** 
```c++
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
```

**Q6: Write a program to implement Dijkstra's shortest path algorithm** 
```c++
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
```

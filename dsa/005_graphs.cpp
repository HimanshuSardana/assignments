#include <bits/stdc++.h>

using namespace std;

class Graph {
        int V;
        list<int> *adj;
        void DFSUtil(int v, bool visited[]);
public:
        Graph(int V);
        void addEdge(int v, int w);
        void DFS(int v);
};

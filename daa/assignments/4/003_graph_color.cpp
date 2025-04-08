#include <bits/stdc++.h>
using namespace std;

bool isSafe(int node, int color, vector<vector<int>> &graph,
            vector<int> &colors) {
  for (int neighbor = 0; neighbor < graph.size(); neighbor++) {
    if (graph[node][neighbor] == 1 && colors[neighbor] == color)
      return false;
  }
  return true;
}

bool solve(int node, vector<vector<int>> &graph, int m, vector<int> &colors) {
  int n = graph.size();
  if (node == n)
    return true;

  for (int col = 1; col <= m; col++) {
    if (isSafe(node, col, graph, colors)) {
      colors[node] = col;

      if (solve(node + 1, graph, m, colors))
        return true;

      colors[node] = 0;
    }
  }
  return false;
}

bool graphColoring(vector<vector<int>> &graph, int m) {
  int n = graph.size();
  vector<int> colors(n, 0);

  return solve(0, graph, m, colors);
}

int main() {
  vector<vector<int>> graph = {{0, 1, 1}, {1, 0, 1}, {1, 1, 0}};

  int m = 3;

  if (graphColoring(graph, m))
    cout << "Graph can be colored with " << m << " colors.\n";
  else
    cout << "Graph cannot be colored with " << m << " colors.\n";

  return 0;
}

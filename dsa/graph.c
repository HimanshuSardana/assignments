#include <stdio.h>

int graph[100][100];

int main() {
        int n, m;
        printf("Enter the number of vertices and edges: ");
        scanf("%d %d", &n, &m);
        for (int i = 0; i < m; i++) {
                int u, v;
                printf("Enter the edge: ");
                scanf("%d %d", &u, &v);
                graph[u][v] = 1;
                graph[v][u] = 1;
        }
        for (int i = 0; i < n; i++) {
                printf("%d: ", i);
                for (int j = 0; j < n; j++) {
                if (graph[i][j] == 1) {
                        printf("%d ", j);
                }
                }
                printf("\n");
        }
        return 0;
}

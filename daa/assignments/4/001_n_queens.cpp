#include <bits/stdc++.h>

using namespace std;

bool isSafe(int board[][10], int row, int col, int n) {
  for (int i = 0; i < col; i++)
    if (board[row][i])
      return false;

  // Check upper diagonal on left side
  for (int i = row, j = col; i >= 0 && j >= 0; i--, j--)
    if (board[i][j])
      return false;

  // Check lower diagonal on left side
  for (int i = row, j = col; j >= 0 && i < n; i++, j--)
    if (board[i][j])
      return false;

  return true;
}

void printSolution(int board[][10], int n) {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++)
      cout << board[i][j] << " ";
    cout << endl;
  }
}

void solveNQUtil(int board[][10], int col, int n) {
  if (col >= n) {
    printSolution(board, n);
    cout << endl;
    return;
  }

  for (int i = 0; i < n; i++) {
    if (isSafe(board, i, col, n)) {
      board[i][col] = 1;
      solveNQUtil(board, col + 1, n);
      board[i][col] = 0; // backtrack
    }
  }
}

void solveNQ(int n) {
  int board[10][10] = {0};
  solveNQUtil(board, 0, n);
}

int main() {
  int n;
  cout << "Enter the value of n: ";
  cin >> n;
  solveNQ(n);
  return 0;
}

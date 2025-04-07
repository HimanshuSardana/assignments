#include <bits/stdc++.h>
using namespace std;

const int N = 9;

bool isSafe(vector<vector<int>> &board, int row, int col, int num) {
  for (int x = 0; x < N; x++) {
    if (board[row][x] == num || board[x][col] == num)
      return false;
  }

  // Check 3x3 box
  int startRow = row - row % 3;
  int startCol = col - col % 3;

  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 3; j++)
      if (board[startRow + i][startCol + j] == num)
        return false;

  return true;
}

bool solveSudoku(vector<vector<int>> &board) {
  for (int row = 0; row < N; row++) {
    for (int col = 0; col < N; col++) {
      if (board[row][col] == 0) {
        for (int num = 1; num <= 9; num++) {
          if (isSafe(board, row, col, num)) {
            board[row][col] = num;

            if (solveSudoku(board))
              return true;

            board[row][col] = 0;
          }
        }
        return false;
      }
    }
  }
  return true;
}

void printBoard(const vector<vector<int>> &board) {
  for (const auto &row : board) {
    for (int num : row)
      cout << num << " ";
    cout << "\n";
  }
}

int main() {
  vector<vector<int>> board = {
      {3, 0, 6, 5, 0, 8, 4, 0, 0}, {5, 2, 0, 0, 0, 0, 0, 0, 0},
      {0, 8, 7, 0, 0, 0, 0, 3, 1}, {0, 0, 3, 0, 1, 0, 0, 8, 0},
      {9, 0, 0, 8, 6, 3, 0, 0, 5}, {0, 5, 0, 0, 9, 0, 6, 0, 0},
      {1, 3, 0, 0, 0, 0, 2, 5, 0}, {0, 0, 0, 0, 0, 0, 0, 7, 4},
      {0, 0, 5, 2, 0, 6, 3, 0, 0}};

  if (solveSudoku(board))
    printBoard(board);
  else
    cout << "No solution exists\n";

  return 0;
}

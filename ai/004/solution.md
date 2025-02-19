# Artificial Intelligence Assignment 4
## By Himanshu Sardana

### Question 1
**If the initial and final states are as below and $H(n)$: number of misplaced tiles in the current state $n$ as compared to the goal node need to be considered as the heuristic function. You need to use Best First Search algorithm** 

```{=latex}
\begin{tikzpicture}
% Draw a 3x3 grid with the rows being:
%2 _ 3
%1 8 4
%7 6 5

\draw[step=1cm,gray,very thin] (0,0) grid (3,3);

\node at (0.5,2.5) {2};
\node at (1.5,2.5) { };
\node at (2.5,2.5) {3};

\node at (0.5,1.5) {1};
\node at (1.5,1.5) {8};
\node at (2.5,1.5) {4};

\node at (0.5,0.5) {7};
\node at (1.5,0.5) {6};
\node at (2.5,0.5) {5};

\end{tikzpicture}
```

```{=latex}
\begin{tikzpicture}
\draw[step=1cm,gray,very thin] (0,0) grid (3,3);

\node at (0.5,2.5) {1};
\node at (1.5,2.5) {2};
\node at (2.5,2.5) {3};

\node at (0.5,1.5) {8};
\node at (1.5,1.5) { };
\node at (2.5,1.5) {4};

\node at (0.5,0.5) {7};
\node at (1.5,0.5) {6};
\node at (2.5,0.5) {5};
\end{tikzpicture}
```

```python
import copy

initial = [[1, 2, 3], [8, 0, 4], [7, 6, 5]]
final = [[2, 8, 1], [0, 4, 3], [7, 6, 5]]

def h_score(state):
    score = 0
    for i in range(3):
        for j in range(3):
            if state[i][j] != final[i][j]:
                score += 1
    return score

def find_zero(matrix):
    for i in range(3):
        for j in range(3):
            if matrix[i][j] == 0:
                return i, j

def move_up(matrix):
    i, j = find_zero(matrix)
    if i == 0:
        return None
    else:
        new_matrix = copy.deepcopy(matrix)
        new_matrix[i][j], new_matrix[i-1][j] = new_matrix[i-1][j], new_matrix[i][j]
        return new_matrix

def move_down(matrix):
    i, j = find_zero(matrix)
    if i == 2:
        return None
    else:
        new_matrix = copy.deepcopy(matrix)
        new_matrix[i][j], new_matrix[i+1][j] = new_matrix[i+1][j], new_matrix[i][j]
        return new_matrix

def move_left(matrix):
    i, j = find_zero(matrix)
    if j == 0:
        return None
    else:
        new_matrix = copy.deepcopy(matrix)
        new_matrix[i][j], new_matrix[i][j-1] = new_matrix[i][j-1], new_matrix[i][j]
        return new_matrix

def move_right(matrix):
    i, j = find_zero(matrix)
    if j == 2:
        return None
    else:
        new_matrix = copy.deepcopy(matrix)
        new_matrix[i][j], new_matrix[i][j+1] = new_matrix[i][j+1], new_matrix[i][j]
        return new_matrix

def is_goal(matrix):
    return matrix == final

def print_matrix(matrix):
    for i in matrix:
        for j in i:
            if j == 0:
                print(' ', end=' ')
            else: 
                print(j, end=' ')
        print("")
    print()

def best_first_search(matrix):
    moves = [move_up, move_down, move_left, move_right]
    open_set = [(h_score(matrix), matrix, [])]  # (heuristic, state, path)
    visited = set()
    
    while open_set:
        open_set.sort()  
        _, current, path = open_set.pop(0)
        
        if is_goal(current):
            return path
        
        matrix_tuple = tuple(map(tuple, current))
        if matrix_tuple in visited:
            continue
        visited.add(matrix_tuple)
        
        for move in moves:
            new_matrix = move(current)
            if new_matrix and tuple(map(tuple, new_matrix)) not in visited:
                open_set.append((h_score(new_matrix), new_matrix, path + [new_matrix]))
    
    return None

result = best_first_search(initial)

if result:
    print("Solution found:")
    for step in result:
        print_matrix(step)
else:
    print("No solution found.")
```

### Question 2
**If the initial and final states have been changed as below and the approach you need to use is Hill Climbing searching algorithm** 

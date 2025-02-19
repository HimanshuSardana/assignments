import copy

initial = [[2, 8, 3], [1, 5, 4], [7, 6, 0]]
final = [[1, 2, 3], [8, 0, 4], [7, 6, 5]]

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

def hill_climbing_search(matrix):
    moves = [move_up, move_down, move_left, move_right]
    current = matrix
    path = [current]
    
    while True:
        best_move = None
        best_h = h_score(current)
        
        for move in moves:
            new_matrix = move(current)
            if new_matrix:
                new_h = h_score(new_matrix)
                if new_h < best_h:
                    best_h = new_h
                    best_move = new_matrix
        
        if best_move is None or is_goal(current):
            break
        
        current = best_move
        path.append(current)
    
    return path if is_goal(current) else None

result = hill_climbing_search(initial)

if result:
    print("Solution found:")
    for step in result:
        print_matrix(step)
else:
    print("No solution found.")

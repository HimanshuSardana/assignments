# 8 Puzzle Game
initial = [[1,2,3], [8,0,4], [7,6,5]]
final = [[2,8,1], [0,4,3], [7,6,5]]

import heapq
from copy import deepcopy

def find_blank(state):
    for i in range(len(state)):
        for j in range(len(state[i])):
            if state[i][j] == 0:
                return [i, j]
    return None

def manhattan_distance(state, goal):
    distance = 0
    for i in range(len(state)):
        for j in range(len(state[i])):
            if state[i][j] != 0:
                goal_i, goal_j = next((x, y) for x in range(len(goal)) for y in range(len(goal[x])) if goal[x][y] == state[i][j])
                distance += abs(i - goal_i) + abs(j - goal_j)
    return distance

def get_neighbors(state):
    neighbors = []
    blank = find_blank(state)
    x, y = blank[0], blank[1]

    # Directions: [name, dx, dy]
    directions = [
        ("up", -1, 0),
        ("down", 1, 0),
        ("left", 0, -1),
        ("right", 0, 1)
    ]

    for name, dx, dy in directions:
        nx, ny = x + dx, y + dy
        if 0 <= nx < len(state) and 0 <= ny < len(state[0]):  # Ensure move is within bounds
            new_state = deepcopy(state)
            new_state[x][y], new_state[nx][ny] = new_state[nx][ny], new_state[x][y]
            neighbors.append((name, new_state))

    return neighbors

def solve_puzzle(initial, goal):
    pq = []
    heapq.heappush(pq, (0, initial, []))  

    visited = set()  

    while pq:
        f_score, current_state, path = heapq.heappop(pq)

        if current_state == goal:
            return path

        state_tuple = tuple(tuple(row) for row in current_state)
        if state_tuple in visited:
            continue
        visited.add(state_tuple)

        for move_name, neighbor in get_neighbors(current_state):
            if tuple(tuple(row) for row in neighbor) not in visited:
                g_score = len(path) + 1  # Cost so far
                h_score = manhattan_distance(neighbor, goal)  # Heuristic
                f_score = g_score + h_score  # Total cost
                heapq.heappush(pq, (f_score, neighbor, path + [move_name]))

    return None  # No solution found

solution = solve_puzzle(initial, final)
print(solution)

from collections import deque

def water_jug_problem(jug1_capacity, jug2_capacity, target):
    visited = set()
    
    queue = deque()
    queue.append((0, 0))
    
    parent_map = {}
    parent_map[(0, 0)] = None
    
    while queue:
        current = queue.popleft()
        jug1, jug2 = current
        
        if jug1 == target or jug2 == target:
            return reconstruct_path(parent_map, current)
        
        if current in visited:
            continue
        visited.add(current)
        
        next_states = [
            (jug1_capacity, jug2),             
            (jug1, jug2_capacity),             
            (0, jug2),                         
            (jug1, 0),                         
            (jug1 - min(jug1, jug2_capacity - jug2), jug2 + min(jug1, jug2_capacity - jug2)),
            (jug1 + min(jug2, jug1_capacity - jug1), jug2 - min(jug2, jug1_capacity - jug1))
        ]
        
        for state in next_states:
            if state not in visited:
                queue.append(state)
                parent_map[state] = current
    
    return None

def reconstruct_path(parent_map, state):
    path = []
    while state:
        path.append(state)
        state = parent_map[state]
    return path[::-1]

jug1_capacity = int(input("Enter the capacity of Jug 1: "))
jug2_capacity = int(input("Enter the capacity of Jug 2: "))
target = int(input("Enter the target amount of water: "))

result = water_jug_problem(jug1_capacity, jug2_capacity, target)

if result:
    print("Solution:")
    for step in result:
        print(f"Jug 1: {step[0]}L, Jug 2: {step[1]}L")
else:
    print("No solution exists for the given inputs.")

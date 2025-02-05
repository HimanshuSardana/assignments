initial = {
    'A': 'Table',
    'B': 'Table',
    'C': 'B',
}

final = {
    'A': 'Table',
    'B': 'A',
    'C': 'B'
}

def generate_cases(state):
    movable_blocks = set(state.keys())  
    blocked_blocks = set(state.values()) - {'Table'}  
    top_blocks = movable_blocks - blocked_blocks 

    cases = []
    for block in top_blocks:
        for target in movable_blocks | {'Table'}:
            if block != target and state[block] != target:  
                cases.append((block, target))
    return cases

def move(state, case):
    block, target = case
    new_state = state.copy()

    for key, value in new_state.items():
        if value == block:  
            new_state[key] = 'Table'  

    new_state[block] = target  
    return new_state

def is_final(state):
    return state == final

def bfs():
    queue = [(initial, [])]

    while queue:
        state, path = queue.pop(0)

        if is_final(state):
            return path

        for case in generate_cases(state):
            new_state = move(state, case)
            new_path = path + [case]
            queue.append((new_state, new_path))

    return None

result = bfs()
for block, target in result:
    print(f'Move block {block} to {target}')


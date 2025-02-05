def uniform_cost_search(graph, start, goal):
    queue = [(0, start, [])]  # (cost, node, path)
    visited = set()
    
    while queue:
        queue.sort()  
        cost, node, path = queue.pop(0)
        
        if node in visited:
            continue
        
        path = path + [node]
        visited.add(node)
        
        if node == goal:
            return path, cost
        
        for neighbor, weight in graph.get(node, []):
            if neighbor not in visited:
                queue.append((cost + weight, neighbor, path))
    
    return None, float('inf') 

graph = {
    'A': [('S', 1), ('G', 10)],
    'S': [('B', 5), ('C', 15)],
    'B': [('G', 5)],
    'C': [('G', 5)],
    'G': []
}

path, cost = uniform_cost_search(graph, 'A', 'C')
print("Shortest Path:", path)
print("Total Cost:", cost)


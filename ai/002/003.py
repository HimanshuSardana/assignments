def travelling_salesman(graph, starting_node):
    visited = set()
    visited.add(starting_node)

    current_node = starting_node
    total_cost = 0
    path = [starting_node] 

    while len(visited) < len(graph):
        unvisited_neighbors = {node: cost for node, cost in graph[current_node].items() if node not in visited}
        if not unvisited_neighbors:
            break  
        next_node = min(unvisited_neighbors, key=unvisited_neighbors.get)
        total_cost += graph[current_node][next_node]
        visited.add(next_node)
        path.append(next_node)
        current_node = next_node

    total_cost += graph[current_node][starting_node]
    path.append(starting_node)

    return total_cost, path


graph = {
    1: {2: 10, 3: 15, 4: 20},
    2: {1: 10, 3: 35, 4: 25},
    3: {1: 15, 2: 35, 4: 30},
    4: {1: 20, 2: 25, 3: 30}
}

# Input starting node
starting_node = int(input("Enter the starting node: "))

# Call the function and print the result
cost, path = travelling_salesman(graph, starting_node)
print(f"Total cost: {cost}")
print(f"Path taken: {path}")


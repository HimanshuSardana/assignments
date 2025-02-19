class Node:
    def __init__(self, name, heuristic):
        self.name = name  
        self.heuristic = heuristic  
        self.children = []  
        self.cost = heuristic  
        self.best_path = None  

    def add_children(self, children):
        self.children = children

def ao_star(node, edge_cost=1):
    if not node.children:  
        return node.heuristic
    
    min_cost = float('inf')
    best_subpath = None

    for group in node.children:  
        total_cost = sum(ao_star(child, edge_cost) + edge_cost for child in group)
        
        if total_cost < min_cost:
            min_cost = total_cost
            best_subpath = group

    node.cost = min_cost
    node.best_path = best_subpath
    return node.cost

def print_solution(node):
    if not node.best_path:
        print(node.name, end=" ")
        return

    print(node.name, "→", end=" ")
    for child in node.best_path:
        print_solution(child)

A = Node('A', 0)
B = Node('B', 6)
C = Node('C', 12)
D = Node('D', 10)
G = Node('G', 5)
H = Node('H', 7)
E = Node('E', 4)
F = Node('F', 4)

B.add_children([[G, H]])  
D.add_children([[E, F]])  
A.add_children([[B], [C], [D]])  

ao_star(A)

print("\nOptimal Path:")
print_solution(A)


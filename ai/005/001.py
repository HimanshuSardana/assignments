import random

# Given data
items = [
    {"name": "A", "weight": 45, "value": 3},
    {"name": "B", "weight": 40, "value": 5},
    {"name": "C", "weight": 50, "value": 8},
    {"name": "D", "weight": 90, "value": 10},
]

max_weight = 100
population = ["1111", "1000", "1010", "1001"]
mutation_order = [3, 2, 1, 0]

def fitness(chromosome):
    total_weight = total_value = 0
    for i, bit in enumerate(chromosome):
        if bit == "1":
            total_weight += items[i]["weight"]
            total_value += items[i]["value"]
    return total_value if total_weight <= max_weight else 0

def crossover(parent1, parent2):
    point = len(parent1) // 2 
    return parent1[:point] + parent2[point:], parent2[:point] + parent1[point:]

def mutate(chromosome, iteration):
    idx = mutation_order[iteration % len(mutation_order)]
    chromosome = list(chromosome)
    chromosome[idx] = "0" if chromosome[idx] == "1" else "1"
    return "".join(chromosome)

for iteration in range(10):
    sorted_population = sorted(population, key=fitness, reverse=True)
    new_population = sorted_population[:2]
    
    offspring1, offspring2 = crossover(sorted_population[2], sorted_population[3])
    offspring1 = mutate(offspring1, iteration)
    population = new_population + [offspring1, offspring2]
    best = max(population, key=fitness)
    print(f"Iteration {iteration + 1}: Best Chromosome: {best}, Fitness: {fitness(best)}")

best_solution = max(population, key=fitness)
print(f"\nFinal Best Solution: {best_solution}, Fitness: {fitness(best_solution)}")

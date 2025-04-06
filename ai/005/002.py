import random

items = [
    {"name": "Mirror", "weight": 2, "value": 3},
    {"name": "Silver Nugget", "weight": 3, "value": 5},
    {"name": "Painting", "weight": 4, "value": 7},
    {"name": "Vase", "weight": 5, "value": 9},
]
max_weight = 9

population = ["1111", "1000", "1010", "1001"]

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

mutation_order = [2, 0, 3, 1]

for iteration in range(4):
    fitness_values = [(chrom, fitness(chrom)) for chrom in population]
    fitness_values.sort(key=lambda x: x[1], reverse=True)  # Sort by fitness (descending)

    new_population = [fitness_values[0][0], fitness_values[1][0]]
    child1, child2 = crossover(fitness_values[2][0], fitness_values[3][0])
    new_population.extend([child1, child2])

    mutation_index = mutation_order[iteration % len(mutation_order)]
    new_population[2] = mutate(new_population[2], mutation_index)
    population = new_population

best_solution = max(population, key=fitness)
best_items = [items[i]["name"] for i in range(4) if best_solution[i] == "1"]
best_value = fitness(best_solution)
best_weight = sum(items[i]["weight"] for i in range(4) if best_solution[i] == "1")

print("Best Selection (Binary):", best_solution)
print("Selected Items:", best_items)
print("Total Weight:", best_weight)
print("Total Value:", best_value)


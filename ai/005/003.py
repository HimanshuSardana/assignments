import random
import math

def evaluate(solution):
    a, b, c, d = solution
    clauses = [
        (not a or d),   # (¬a ∨ d)
        (c or b),       # (c ∨ b)
        (not c or not d),  # (¬c ∨ ¬d)
        (not d or not b),  # (¬d ∨ ¬b)
        (not a or not d)   # (¬a ∨ ¬d)
    ]
    return sum(clauses)  

def movegen(solution):
    new_solution = solution[:]
    index = random.randint(0, 3)  # Choose a random index
    new_solution[index] = 1 - new_solution[index]  # Flip the bit
    return new_solution

def simulated_annealing():
    current_solution = [1, 1, 1, 1]  
    best_solution = current_solution[:]
    best_score = evaluate(best_solution)

    T = 500  
    cooling_rate = 50
    random_numbers = [0.655, 0.254, 0.432] 

    for i in range(3):  
        new_solution = movegen(current_solution)
        new_score = evaluate(new_solution)
        current_score = evaluate(current_solution)

        if new_score > current_score:
            current_solution = new_solution  
        else:
            probability = math.exp((new_score - current_score) / T)
            if random_numbers[i] < probability:
                current_solution = new_solution

        if evaluate(current_solution) > best_score:
            best_solution = current_solution[:]
            best_score = evaluate(best_solution)

        T -= cooling_rate  

    return best_solution, best_score

best_solution, best_score = simulated_annealing()

print(f"Best Solution: {best_solution} (a={best_solution[0]}, b={best_solution[1]}, c={best_solution[2]}, d={best_solution[3]})")
print(f"Max Clauses Satisfied: {best_score}")


#import "temp2.typ": *
#set par(justify: true)
#title("Assignment 5: Scrum Simulation")

#question("Question 1")[
  Play the roles of Scrum Master, Product Owner, and Development Team in a simulated Scrum project.
]

#solution()[
  #v(2mm)
  #smallcaps()[*Project*]: \
  The project is a calculator application that performs basic arithmetic operations (addition, subtraction, multiplication, and division)

  #smallcaps()[*Product Backlog*]: \
  User should be able to: \
  + Add two numbers \
  + Subtract two numbers \
  + Multiply two numbers \
  + Divide two numbers \

  #line(length: 100%, stroke: 0.3pt)
  #smallcaps()[*Sprint Backlog(s)*]:
  #v(-2mm)
  #grid(columns: (1fr, 1fr), column-gutter: 4pt)[
    #smallcaps()[*Sprint 1*] \
    Add two numbers \

    #smallcaps()[*Sprint 2*] \
    Subtract two numbers \

  ][
    #smallcaps()[*Sprint 3*] \
    Multiply two numbers \

    #smallcaps()[*Sprint 4*] \
    Divide two numbers \
  ]
  #line(length: 100%, stroke: 0.3pt)
  #grid(columns: (1fr, 1fr), column-gutter: 16pt, row-gutter: 20pt)[
    #smallcaps()[*Sprint 1*]: \
    *Sprint Planning*: The team plans to implement the addition feature. \
    *Daily Scrum*: The team discusses progress and any blockers. \
    *Sprint Review*: The team demonstrates the addition feature to stakeholders. \
    *Sprint Retrospective*: The team reflects on the sprint and identifies improvements. \

    *Increment*: \
    ```python
    def add(a, b):
      return a + b
    ```
    \
  ][
    #smallcaps()[*Sprint 2*]: \
    *Sprint Planning*: The team plans to implement the subtraction feature. \
    *Daily Scrum*: The team discusses progress and any blockers. \
    *Sprint Review*: The team demonstrates the subtraction feature to stakeholders. \
    *Sprint Retrospective*: The team reflects on the sprint and identifies improvements. \

    *Increment*: \
    ```python
    def subtract(a, b):
      return a - b
    ```
  ][
    #smallcaps()[*Sprint 3*]: \
    *Sprint Planning*: The team plans to implement the multiplication feature. \
    *Daily Scrum*: The team discusses progress and any blockers. \
    *Sprint Review*: The team demonstrates the multiplication feature to stakeholders. \
    *Sprint Retrospective*: The team reflects on the sprint and identifies improvements. \

    *Increment*: \
    ```python
    def multiply(a, b):
    return a * b
    ```
  ][
    #smallcaps()[*Sprint 4*]: \
    *Sprint Planning*: The team plans to implement the division feature. \
    *Daily Scrum*: The team discusses progress and any blockers. \
    *Sprint Review*: The team demonstrates the division feature to stakeholders. \
    *Sprint Retrospective*: The team reflects on the sprint and identifies improvements. \

    *Increment*: \
    ```python
    def divide(a, b):
    if b == 0:
        return "Error: Division by zero"
    return a / b
    ```
  ]
]


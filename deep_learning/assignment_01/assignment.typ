#let assignment_no = state("assignment_no", 1);
#show raw.where(block: true): it => [
  #set text(font: "Iosevka NF")
  #block(width: 100%, fill: gray.lighten(90%), inset: 8pt)[
    #it
  ]
]
#show heading.where(level: 1): it => [
  #box(width: 100%, stroke: 1pt, height: 70pt)[
    #place(top + right, float: true, dy: 14mm, dx: -10mm)[
      #text(fill: gray.darken(30%), size: 16pt)[
        #smallcaps()[Assignment #assignment_no.get()]
      ]
    ]
    #place(bottom + right, float: true, dy: 2mm, dx: -5mm)[
      #box(fill: white, inset: (x: 10pt))[
        #text(weight: "bold", size: 24pt)[
          #smallcaps(it.body)
        ]
      ]
    ]
  ]
]

#let question(body) = [
  #box(width: 100%, stroke: 1pt, inset: (x: 10pt, y: 10pt))[
    #place(top + left, float: true, dy: -6mm, scope: "parent")[
      #box(fill: white, inset: (x: 8pt, y: 4pt))[
        #text(weight: "bold")[
          #smallcaps()[Question 1]
        ]
      ]
    ]
    #v(-10mm)
    #set text(size: 10pt)
    #body
  ]
]

= Perceptrons

#question()[
  Design perceptrons for the following logic gates
  + AND
  + OR
  + NAND
  + NOR
]

#smallcaps()[*Solution*]
+ AND Gate:
#table(columns: 3)[*X*][*Y*][*Output*][0][0][0][0][1][0][1][0][0][1][1][1]
```python
t = 1
f = 0

learning_rate = 0.1

threshold = 1.5

inputs = [(0, 0), (0, 1), (1, 0), (1, 1)]
outputs = [0, 0, 0, 1]


weights = [0.4, 0.6]


def activation(weighted_sum):
    if weighted_sum < threshold:
        return f
    return t


new_weights = weights
# print(new_weights)

for idx, input in enumerate(inputs):
    weighted_sum = inputs[idx][0] * weights[0] + inputs[idx][1] * weights[1]
    if activation(weighted_sum) != outputs[idx]:
        # update weights
        for i in range(len(weights)):
            # print(i)
            new_weights[i] = (
                learning_rate
                * (outputs[idx] - activation(weighted_sum))
                * inputs[idx][i]
            )
    if new_weights != weights:
        weights = new_weights
        # new_weights = []

    print(f"Epoch {idx}: {''.join(str(weights))}")
```

#enum.item(2)[OR Gate]
#table(columns: 3)[*X*][*Y*][*Output*][0][0][0][0][1][1][1][0][1][1][1][1]
```python
t = 1
f = 0

learning_rate = 0.1

threshold = 1.5

inputs = [(0, 0), (0, 1), (1, 0), (1, 1)]
outputs = [0, 1, 1, 1]


weights = [0.4, 0.6]


def activation(weighted_sum):
    if weighted_sum < threshold:
        return f
    return t


new_weights = weights
# print(new_weights)

for idx, input in enumerate(inputs):
    weighted_sum = inputs[idx][0] * weights[0] + inputs[idx][1] * weights[1]
    if activation(weighted_sum) != outputs[idx]:
        # update weights
        for i in range(len(weights)):
            # print(i)
            new_weights[i] = (
                learning_rate
                * (outputs[idx] - activation(weighted_sum))
                * inputs[idx][i]
            )
    if new_weights != weights:
        weights = new_weights
        # new_weights = []

    print(f"Epoch {idx}: {''.join(str(weights))}")
```
#enum.item(3)[NAND Gate]
#table(columns: 3)[*X*][*Y*][*Output*][0][0][1][0][1][1][1][0][1][1][1][0]
```python
t = 1
f = 0

learning_rate = 0.1

threshold = 1.5

inputs = [(0, 0), (0, 1), (1, 0), (1, 1)]
outputs = [1, 1, 1, 0]


weights = [0.4, 0.6]


def activation(weighted_sum):
    if weighted_sum < threshold:
        return f
    return t


new_weights = weights
# print(new_weights)

for idx, input in enumerate(inputs):
    weighted_sum = inputs[idx][0] * weights[0] + inputs[idx][1] * weights[1]
    if activation(weighted_sum) != outputs[idx]:
        # update weights
        for i in range(len(weights)):
            # print(i)
            new_weights[i] = (
                learning_rate
                * (outputs[idx] - activation(weighted_sum))
                * inputs[idx][i]
            )
    if new_weights != weights:
        weights = new_weights
        # new_weights = []

    print(f"Epoch {idx}: {''.join(str(weights))}")
```

#enum.item(4)[NOR Gate]
#table(columns: 3)[*X*][*Y*][*Output*][0][0][1][0][1][0][1][0][0][1][1][0]
```python
t = 1
f = 0

learning_rate = 0.1

threshold = 1.5

inputs = [(0, 0), (0, 1), (1, 0), (1, 1)]
outputs = [1, 0, 0, 0]


weights = [0.4, 0.6]


def activation(weighted_sum):
    if weighted_sum < threshold:
        return f
    return t


new_weights = weights
# print(new_weights)

for idx, input in enumerate(inputs):
    weighted_sum = inputs[idx][0] * weights[0] + inputs[idx][1] * weights[1]
    if activation(weighted_sum) != outputs[idx]:
        # update weights
        for i in range(len(weights)):
            # print(i)
            new_weights[i] = (
                learning_rate
                * (outputs[idx] - activation(weighted_sum))
                * inputs[idx][i]
            )
    if new_weights != weights:
        weights = new_weights
        # new_weights = []

    print(f"Epoch {idx}: {''.join(str(weights))}")
```

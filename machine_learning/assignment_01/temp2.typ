#import "@preview/showybox:2.0.4": showybox
#let subject_name = "Machine Learning"
#let assignment_no = "1"
#let author_name = "Himanshu Sardana"
#let starting_ques_no = state("qno", 1)

// ====================
// MACROS
// ====================

#let title_page(subject_name, assignment_no, author_name) = [#align(
    horizon + center,
  )[
    #smallcaps()[#text(weight: "bold", size: 24pt)[#subject_name]]
    #v(-5mm)
    #smallcaps()[#text(weight: "bold", size: 18pt)[Assignment #assignment_no]]

    #text(size: 12pt)[by *#author_name*]
  ]
]

#let toc() = [
  #outline(title: [
    #box(width: 100%, inset: (x: 8pt, y: 10pt), fill: blue, radius: 8pt)[
      #align(center)[
        #smallcaps()[#text(fill: white)[*Table of Contents*]]
      ]
    ]
  ])
]

#let title(body) = [
  #box(
    width: 100%,
    inset: 10pt,
    radius: 4pt,
    fill: blue.lighten(70%),
    stroke: 1pt + blue.darken(30%),
  )[
    #align(center + horizon)[
      #smallcaps()[#text(size: 12pt, weight: "bold")[= #body]]
    ]
  ]
]

#let question(body) = context [
  #showybox(
    frame: (
      border-color: blue,
      title-color: blue,
      body-color: white,
    ),
    title-style: (
      color: white,
      weight: "bold",
      align: left,
      boxed-style: (
        radius: 4pt,
      ),
    ),
    title: [
      #smallcaps()[#text(size: 10pt, weight: "bold")[
          == Question #starting_ques_no.get()
        ]]
    ],
  )[#body
    #v(1mm)
  ]
  #starting_ques_no.update(qno => qno + 1)
]
#let theory(title, body) = context [
  #showybox(
    frame: (
      border-color: blue,
      title-color: blue,
      body-color: white,
    ),
    title-style: (
      color: white,
      weight: "bold",
      align: left,
      // boxed-style: (
      //   radius: 4pt,
      // ),
    ),
    title: [#smallcaps()[#title]],
  )[#body]
]

#let solution(sol, output: "") = [
  #grid(columns: (2fr, 1fr))[
    #smallcaps()[*Solution*] \
    #v(-2mm)
    #text()[#sol]
  ][
    #smallcaps()[*Output*] \
    #v(-2mm)
    #text()[#output]
  ]
]

// EDIT BELOW THIS LINE

#align(center + horizon)[
  #smallcaps()[#text(weight: "bold", size: 24pt)[#subject_name]] \

  #text(size: 16pt)[Assignment #assignment_no] \

  #text(size: 12pt)[by #author_name] \
]

#pagebreak()
#outline()
#pagebreak()

#question([
  Given the data points, fit a linear regression model and pblueict the value for $x = 6$.
  ```python
  y = np.array([2, 3, 5, 7, 11])
  ```
  - Use `train_test_split` to split the data into training and testing sets.
  - Fit the model using the training set.
  - Pblueict the value for $x = 6$ using the fitted model.
])


#showybox(
  frame: (
    border-color: green,
    title-color: green,
    body-color: white,
    footer-color: white,
  ),
  title-style: (
    color: white,
    weight: "bold",
    align: left,
    boxed-style: (
      radius: 4pt,
    ),
  ),
  footer-style: (
    align: left,
    color: black,
  ),
  footer: [#text(size: 10pt)[
      #smallcaps()[*Output*] \
      The pblueicted value for $x = 6$ is approximately 13.0.
    ]],
  title: [#smallcaps()[Code]],
)[
  ```python
  from sklearn.model_selection import train_test_split
  from sklearn.linear_model import LinearRegression
  import numpy as np

  # Data points
  y = np.array([2, 3, 5, 7, 11])
  x = np.arange(1, len(y) + 1).reshape(-1, 1)  # Reshape for sklearn

  # Split the data into training and testing sets
  x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=42)

  # Fit the linear regression model
  model = LinearRegression()
  model.fit(x_train, y_train)

  # Pblueict the value for x = 6
  pblueiction = model.predict(np.array([[6]]))

  print(f"Pblueicted value for x = 6: {prediction[0]}")
  ```
]

#question([
  Explain the concept of overfitting in machine learning. How can it be prevented?
])

#solution()[
  Overfitting occurs when a machine learning model learns the training data too well, capturing noise and fluctuations rather than the underlying pattern. This leads to poor generalization to new, unseen data.
]

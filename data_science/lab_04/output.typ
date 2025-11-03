#import "@preview/showybox:2.0.4": showybox

#let title(body) = [
  #box(
    width: 100%,
    inset: 10pt,
    radius: 4pt,
    fill: olive,
    stroke: 1pt + olive,
  )[
    #align(center + horizon)[
      #smallcaps()[#text(
        font: "Montserrat",
        size: 10pt,
        weight: "bold",
        fill: white,
      )[= #body]]
    ]
  ]
]

#let question(qno, body) = [
  #showybox(
    frame: (
      border-color: olive,
      title-color: olive,
      body-color: olive.lighten(90%),
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
      #smallcaps()[#text(size: 8pt, weight: "semibold", font: "Montserrat")[
        == Question #qno
      ]]
    ],
  )[
    #text(font: "Montserrat", size: 10pt)[
      #body
    ]
    #v(1mm)
  ]
]

#let solution(content) = [
  #block(
    inset: 12pt,
    radius: 5pt,
    width: 100%,
    stroke: (thickness: 1.3pt, dash: "dashed", paint: olive),
    fill: olive.lighten(90%),
  )[
    #text(
      weight: "bold",
      size: 9pt,
      fill: olive,
      font: "Montserrat",
    )[#smallcaps()[Solution]] \
    #v(-2mm)
    #text(size: 10pt)[#content]
  ]
]

#let output(content) = [
  #block(inset: 5pt, radius: 5pt, width: 100%)[
    #text(
      weight: "bold",
      size: 9pt,
      fill: olive,
      font: "Montserrat",
    )[#smallcaps()[Output]] \
    #v(-2mm)
    #text(size: 10pt)[#content]
  ]
]

#title("Assignment 4")
#question("1", [
  Write R code to generate the following vectors, explore the functions seq() and rep() using the help on commands
  - 1.3 1.6 1.9 2.2 2.5 2.8 3.1 3.4 3.7 4.0 4.3 4.6 4.9
  - 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4
  - 14 12 10 8 6 4 2 0
  - 5 5 12 12 13 13 20 20
])

#solution()[```python
A <- seq(1.3, 4.9, 0.3)
B <- rep(seq(1, 4), 5)
C <- seq(14, 0, -2)
D <- rep(c(5, 12, 13, 20), each=2)
print(A)
print(B)
print(C)
print(D)
```]
#output()[```txt
  [1] 1.3 1.6 1.9 2.2 2.5 2.8 3.1 3.4 3.7 4.0 4.3 4.6 4.9
  [1] 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4
  [1] 14 12 10  8  6  4  2  0
  [1]  5  5 12 12 13 13 20 20
  ```
]
#question("2", [
  #set enum(numbering: "A (a)")
  Loading and exploring data structure Load the iris data that R provides internally by typing data(iris)
  + What sort of data type is iris?
  + How many rows (observations) and columns (variables) does the iris dataset have?
  + Which variable of the data frame iris is a factor and how many levels does it have?
    + The variable Species is a factor and it has 5 levels.
    + The variable Species is a factor and it has 3 levels.
    + The variable 'data.frame' is a factor and it has 150 levels.
    + The variable 'data.frame' is a factor and it has 5 levels.
])

#solution()[```python
attach(iris)

# A
class(iris)

# B
num_columns <- length(iris) # or ncol(iris)
num_rows <- nrow(iris)

cat("Number of columns: ", num_columns, "\n")
cat("Number of rows: ", num_rows)

# C
# (b) the variable Species is a factor and it has 3 levels
```]
#output()[```txt
  [1] "data.frame"
  Number of columns:  5
  Number of rows:  150
  ```
]
#question("3", [
  Use the “iris” dataset to find
  + The mean and standard deviation of the sepal width and sepal length for each type of species.
  + Create a new dataset called iris.class from the iris dataset. Use a loop and ifelse statement to create a vector in the iris.class dataset called Calyx.Width, which is “short” if Sepal.Length is less than 5, and otherwise is “long.” (The sepals of a flower are collectively known as the calyx.)
])

#solution()[```python
# A
print(aggregate(cbind(Sepal.Length, Sepal.Width) ~ Species, data = iris, FUN = mean))
print(aggregate(cbind(Sepal.Length, Sepal.Width) ~ Species, data = iris, FUN = sd))

# B
iris_class = data.frame(iris)
iris_class['Calyx.Width'] = ''

for (i in rownames(iris_class)) {
    sepal_length = iris_class[i, 'Sepal.Length']
    if (sepal_length > 5) {
        iris_class[i, 'Calyx.Width'] = "short"
    }
    else {
        iris_class[i, 'Calyx.Width'] = "long"
    }
}

print(head(iris_class))
```]
#output()[```txt
  Species Sepal.Length Sepal.Width
  1     setosa        5.006       3.428
  2 versicolor        5.936       2.770
  3  virginica        6.588       2.974

       Species Sepal.Length Sepal.Width
  1     setosa    0.3524897   0.3790644
  2 versicolor    0.5161711   0.3137983
  3  virginica    0.6358796   0.3224966

    Sepal.Length Sepal.Width Petal.Length Petal.Width Species Calyx.Width
  1          5.1         3.5          1.4         0.2  setosa       short
  2          4.9         3.0          1.4         0.2  setosa        long
  3          4.7         3.2          1.3         0.2  setosa        long
  4          4.6         3.1          1.5         0.2  setosa        long
  5          5.0         3.6          1.4         0.2  setosa        long
  6          5.4         3.9          1.7         0.4  setosa       short
  ```
]
#question("4", [
  Explore dataset- mtcars in R. You can get the structure and column names of data by typing the command str(mtcars) and names(mtcars) respectively. Write your code to subset the dataset- mtcars according to the following requirements
  + Select cars whose cyl (a column in the dataset) value is no smaller than 5.
  + Show all the fields (columns) of the first 10 cars.
  + Find all cars matching “Honda”
  + Find the average miles per gallon (mpg) for all number of cylinders.
])

#solution()[```python
attach(mtcars)

# A
fdf = mtcars['cyl' >= 5]
print(head(fdf))

# B
print(head(mtcars, n=10))

# C
honda_cars = data.frame()
for (i in rownames(mtcars)) {
    if(substr(i, 1, 5) == 'Honda') {
        honda_cars <- rbind(honda_cars, mtcars[i,,])
    }
}
print(honda_cars)

# D
print(aggregate(mpg ~ cyl, data = mtcars, FUN = mean))
```]
#output()[```txt
                     mpg cyl disp  hp drat    wt  qsec vs am gear carb
  Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
  Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
  Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
  Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
  Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
  Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1

                     mpg cyl  disp  hp drat    wt  qsec vs am gear carb
  Mazda RX4         21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
  Mazda RX4 Wag     21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
  Datsun 710        22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
  Hornet 4 Drive    21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
  Hornet Sportabout 18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
  Valiant           18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
  Duster 360        14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
  Merc 240D         24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
  Merc 230          22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
  Merc 280          19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4

               mpg cyl disp hp drat    wt  qsec vs am gear carb
  Honda Civic 30.4   4 75.7 52 4.93 1.615 18.52  1  1    4    2

      cyl        mpg
  1     4   26.66364
  2     6   19.74286
  3     8   15.10000
  ```
]

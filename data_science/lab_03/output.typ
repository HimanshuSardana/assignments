#import "@preview/showybox:2.0.4": showybox

#let question(number, body) = context [
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
          == Question #number
        ]]
    ],
  )[#body
    #v(1mm)
  ]
]
        #question("1",[Create an array A with elements `(12, 13, 14, 15, 16)` and display them.])
```python
A <- c(12, 13, 14, 15, 16)
A
```
=== #smallcaps()[Output]
```txt
[1] 12 13 14 15 16
```
#question("2",[Find the sum of all elements of `A`])
```python
sum(A)
```
=== #smallcaps()[Output]
```txt
[1] 70
```
#question("3",[Find the product of all elements of `A`])
```python
prod(A)
```
=== #smallcaps()[Output]
```txt
[1] 524160
```
#question("4",[Find the maximum and minimum element of `A`])
```python
max(A)
min(A)
```
=== #smallcaps()[Output]
```txt
[1] 16[1] 12
```
#question("5",[Find the range of array `A`])
```python
range(A)
```
=== #smallcaps()[Output]
```txt
[1] 12 16
```
#question("6",[Find the mean, variance and standard deviation and median of values of `A`])
```python
mean(A)
var(A)
sd(A)
```
=== #smallcaps()[Output]
```txt
[1] 14[1] 2.5[1] 1.581139
```
#question("7",[Sort the elements of A in both increasing and decreasing order and store them in `B` and `C`])
```python
B <- sort(A)
B

C <- sort(A, decreasing=TRUE)
C
```
=== #smallcaps()[Output]
```txt
[1] 12 13 14 15 16[1] 16 15 14 13 12
```
#question("8",[Create a matrix of 3x4 to have the set of natural numbers])
```python
mat <- matrix(seq(1, 12), nrow=3, ncol=4)
print(mat)
```
=== #smallcaps()[Output]
```txt
     [,1] [,2] [,3] [,4]
[1,]    1    4    7   10
[2,]    2    5    8   11
[3,]    3    6    9   12

```
#question("9",[Create MxN matrix by combining A, B and C row-wise (RW) and column-wise (CW).])
```python
rw <- rbind(A, B, C)
print(rw)

cw <- cbind(A, B, C)
print(cw)
```
=== #smallcaps()[Output]
```txt
  [,1] [,2] [,3] [,4] [,5]
A   12   13   14   15   16
B   12   13   14   15   16
C   16   15   14   13   12
      A  B  C
[1,] 12 12 16
[2,] 13 13 15
[3,] 14 14 14
[4,] 15 15 13
[5,] 16 16 12

```
#question("10",[Find the 10 and 3 row elements of RW])
```python
print(rw[10])
print(rw[3])
```
=== #smallcaps()[Output]
```txt
[1] 15
[1] 16

```
#question("11",[Find 1 and 4 columns of CW])
```python
print(cw[1])
print(cw[4])
```
=== #smallcaps()[Output]
```txt
[1] 12
[1] 15

```
#question("12",[Using both RW and CW find sub-matrices having elements `[2, 3]` and `[2, 4]`])
```python
print("First Matrix")
print(rw[2, 3])

print("Second Matrix")
print(rw[2, 4])
```
=== #smallcaps()[Output]
```txt
[1] "First Matrix"
 B 
14 
[1] "Second Matrix"
 B 
15 

```
```python
print("First Matrix")
print(cw[2, 3])

print("Second Matrix")
print(cw[2, 4])
```
=== #smallcaps()[Output]
```txt
[1] "First Matrix"
 C 
15 
[1] "Second Matrix"

```

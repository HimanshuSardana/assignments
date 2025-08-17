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
        #question("1",[ Create an array A with elements `(12, 13, 14, 15, 16)` and display them.])
```python
A <- c(12, 13, 14, 15, 16)
A
```
=== Output
```txt
[1] 12 13 14 15 16
``` #question("2",[ Find the sum of all elements of `A`])
```python
sum(A)
```
=== Output
```txt
[1] 70
``` #question("3",[ Find the product of all elements of `A`])
```python
prod(A)
```
=== Output
```txt
[1] 524160
``` #question("4",[ Find the maximum and minimum element of `A`])
```python
max(A)
min(A)
```
=== Output
```txt
[1] 16[1] 12
``` #question("5",[ Find the range of array `A`])
```python
range(A)
```
=== Output
```txt
[1] 12 16
``` #question("6",[ Find the mean, variance and standard deviation and median of values of `A`])
```python
mean(A)
var(A)
sd(A)
```
=== Output
```txt
[1] 14[1] 2.5[1] 1.581139
``` #question("7",[ Sort the elements of A in both increasing and decreasing order and store them in `B` and `C`])
```python
B <- sort(A)
B

C <- sort(A, decreasing=TRUE)
C
```
=== Output
```txt
[1] 12 13 14 15 16[1] 16 15 14 13 12
``` #question("8",[ Create a matrix of 3x4 to have the set of natural numbers])
```python
mat <- matrix(seq(1, 12), nrow=3, ncol=4)
print(mat)
```
=== Output
```txt
     [,1] [,2] [,3] [,4]
[1,]    1    4    7   10
[2,]    2    5    8   11
[3,]    3    6    9   12

``` #question("9",[ Create MxN matrix by combining A, B and C row-wise (RW) and column-wise (CW).])
```python
mat2 <- matrix(A, B, C)
print(mat2)
```
=== Output
```txt
Warning message in matrix(A, B, C):
“data length [5] is not a sub-multiple or multiple of the number of rows [12]”
      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12] [,13]
 [1,]   12   14   16   13   15   12   14   16   13    15    12    14    16
 [2,]   13   15   12   14   16   13   15   12   14    16    13    15    12
 [3,]   14   16   13   15   12   14   16   13   15    12    14    16    13
 [4,]   15   12   14   16   13   15   12   14   16    13    15    12    14
 [5,]   16   13   15   12   14   16   13   15   12    14    16    13    15
 [6,]   12   14   16   13   15   12   14   16   13    15    12    14    16
 [7,]   13   15   12   14   16   13   15   12   14    16    13    15    12
 [8,]   14   16   13   15   12   14   16   13   15    12    14    16    13
 [9,]   15   12   14   16   13   15   12   14   16    13    15    12    14
[10,]   16   13   15   12   14   16   13   15   12    14    16    13    15
[11,]   12   14   16   13   15   12   14   16   13    15    12    14    16
[12,]   13   15   12   14   16   13   15   12   14    16    13    15    12
      [,14] [,15] [,16]
 [1,]    13    15    12
 [2,]    14    16    13
 [3,]    15    12    14
 [4,]    16    13    15
 [5,]    12    14    16
 [6,]    13    15    12
 [7,]    14    16    13
 [8,]    15    12    14
 [9,]    16    13    15
[10,]    12    14    16
[11,]    13    15    12
[12,]    14    16    13

``` #question("10",[: Find the 10 and 3 row elements of RW])
#question("11",[: Find 1 and 4 columns of CW])
#question("12",[: Using both RW and CW find sub-matrices having elements `[2, 3]` and `[2, 4]`])

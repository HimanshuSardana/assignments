#import "./temp2.typ": *

#title("Assignment 1")

#question("Assign and print the values 23.4, 45 and 678 to the variables A, B and C")
#solution()[
  ```r
  A <- 23.4
  B <- 45
  C <- 678

  cat("A:", A, "\n")
  cat("B:", B, "\n")
  cat("C:", C, "\n")
  ```
]

#question("Display the entire variables you have created on the screen")
#solution()[
  ```r
  print(ls())
  ```
]

#question("Remove the variable C and display the remaining variables")
#solution()[
  ```r
  rm(C)
  print(ls())
  ```
]

#question("Create a comment 'I am learning R'")
#solution()[
  ```r
  # I am learning R
  ```
]

#question("Create a variable that can hold the values 0 and 1")
#solution()[
  ```r
  binary_variable <- c(0, 1)
  print(binary_variable)
  ```
]

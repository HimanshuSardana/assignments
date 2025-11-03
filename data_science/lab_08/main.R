# Create a data matrix named MARKS having marks of three subjects SUB1, SUB2 and SUB3 for 20 students.
# Use apply function
# a. To find total marks of each students.
# b. Append the total to the given MARKS dataset.
# c. To create a function called st.err()=sd(x)/sqrt(length(x)) to find the standard error in
# SUB1, SUB2, and SUB3.
# d. Add 0.25 bonus marks to each mark in SUB1, SUB2 and SUB3.

MARKS <- matrix(sample(50:100, 60, replace = TRUE), nrow = 20, ncol = 3)

# a
total_marks <- apply(MARKS, 1, sum) # 1 -> for applying function on rows
print(total_marks)

# b
MARKS <- cbind(MARKS, total_marks) # add total marks column
colnames(MARKS) <- c("SUB1", "SUB2", "SUB3", "Total") # adding extra col
print(MARKS)

# c
st.err <- function(x) {
        sd(x) / sqrt(length(x))
}

standard_errors <- apply(MARKS[, 1:3], 2, st.err) # 2 -> for applying function on columns
print(standard_errors)

# d
MARKS[, 1:3] <- MARKS[, 1:3] + 0.25 # add bonus marks to each subject
print(MARKS)

# Create three vectors V1, V2, and V3 from the SUB1, SUB2, and SUB3 above respectively.
# Use lapply() function to find the sum of all the marks in V1, V2, and V3.

V1 <- MARKS[, 1]
V2 <- MARKS[, 2]
V3 <- MARKS[, 3]

sums <- lapply(c(V1, V2, V3), sum)
print(sums)

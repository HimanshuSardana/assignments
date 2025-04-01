library("pracma")

f <- function(x, y) {
  ifelse(x >= 0 & x <= 3 & y >= 0 & y <= 2, (x+y)/30, 0);
}

# Display the joint mass function in rectangular (matrix) from
z = matrix(0, nrow=4, ncol=3)

for (i in 1:4) {
  for (j in 1:3) {
    z[i,j] = f(i-1, j-1)
  }
}

print(z)

# Check if f is a joint mass function (using sum())
result <- sum(z)
print(result)

# Find marginal distribution of g(x) at x = 0, 1, 2, 3
g <- function(x) {
  sapply(x, function(xi) sum(z[xi+1,]))
}

print(g(0:3))

# Find marginal distribution of h(y) at y = 0, 1, 2
h <- function(y) {
  sapply(y, function(yi) sum(z[, yi+1]))
}

print(h(0:2))

# Find the conditional probability at x = 0, given y = 1
g <- function(x) {
  sapply(x, function(xi) z[xi+1, 2] / sum(z[, 2]))
}

print(g(0:3))

# Find E(x), E(y), E(xy), Var(x), Var(y), Cov(x,y) and its correlation coefficient
E_x <- function() {
  sum((0:3) * g(0:3))
}

E_y <- function() {
  sum((0:2) * h(0:2))
}

E_xy <- function() {
  sum((0:3) * (0:2) * z)
}

Var_x <- function() {
  E_x()^2 - sum((0:3)^2 * g(0:3))
}

Var_y <- function() {
  E_y()^2 - sum((0:2)^2 * h(0:2))
}

Cov_xy <- function() {
  E_xy() - E_x() * E_y()
}

correlation_coefficient <- function() {
  Cov_xy() / (sqrt(Var_x()) * sqrt(Var_y()))
}

print(paste("E(x) =", E_x()))
print(paste("E(y) =", E_y()))
print(paste("E(xy) =", E_xy()))
print(paste("Var(x) =", Var_x()))
print(paste("Var(y) =", Var_y()))
print(paste("Cov(x,y) =", Cov_xy()))
print(paste("Correlation Coefficient =", correlation_coefficient()))

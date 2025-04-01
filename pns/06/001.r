library('pracma')
f <- function(x, y) {
  ifelse(x >= 0 & x <= 1 & y >= 0 & y <= 1, (2 * (2*x + 3*y)) / 5, 0);
}

# check if f is a joint density function
result <- integral2(f, 0, 1, 0, 1)$Q;
print(result)

# find marginal distribution of g(x) at x = 1
g <- function(x) {
  sapply(x, function(xi) integral(function(y) f(xi, y), 0, 1))
}
print(g(1))

# find marginal distribution of h(y) at y = 0
h <- function(y) {
  sapply(y, function(yi) integral(function(x) f(x, yi), 0, 1))
}
print(h(0))

# find the expected value of g(x, y) = xy
g <- function(x, y) {
  x * y * f(x, y)
}
result <- integral2(g, 0, 1, 0, 1)$Q;
print(result)

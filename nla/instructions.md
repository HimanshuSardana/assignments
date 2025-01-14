# Bisection Method
- Set a, b, tolerance, N, itr_counter
- if f(a)*f(b) = +ve, print no root in given interval
- while (b-a)/2 > tol
      c = avg of a and b
      if f(c) == 0 break
      if f(a)*f(c) < 0: b = c
      else: a = c;
      itr_counter++
      check if itr_counter > N, if yes, break
- print c

# Newton's Method
- Set f, syms x, x0, tolerance, N, itr_counter
- df = inline(diff(f, x))
- while itr_counter < N
  x1 = x0 - f(x0)/df(x0)
  if (abs(x1-x0) < tolerance) break
  x0 = x1
- print x1

# Fixed Point Iteration
- set g, x0, tolerance, N and itr_counter
- while itr_counter < N
  x1 = g(x0)
  if (abs(x1-x0) < tol) break;
  x0 = x1
- print x1

# Lagrange Interpolation
- set x and y vectors, and point p where value is to be found
- Let X be a point where value is to be found
- for i = 1:n (length of vectors, found by size(x, 2), returns no of columns)
    x1 = x
    x1(i) = []
    L(i) = prod(X - x1)/prod(x(i) - x1)
- Y = sum(y.*L)
- print Y

# Newton's Divided Difference
- Set x and y vectors, p
- create an nxn zero matrix dd
- Set first column of dd to values of y (dd(:, 1) = y(:))
- for j = 2:n
      for i = 1:n-j+1
        dd(i, j) = (dd(i+1, j-1) - dd(i, j-1))/(x(i+j-1) - x(i))
- Let f_p = dd(1, 1) and let productTerm = 1;
- for i = 2:n
productTerm *= p - x(i-1)
f_p += dd(1, i)*productTerm
- print f_p

# Composite Simpson's Rule
- Set f, a, b (lower and upper limits), N (no. of subintervals, must be even)
- h (width of each subinterval) = (b-a)/N
- sum = f(a) + f(b)
- Add odd-indexed terms multiplied by 4
       for i = 1:2:N-1
      x_i = a+(i*h)
      sum += 4*f(x_i)
- Add even-indexed terms multiplied by 2
       for i = 2:2:N-2
          x_i = a+(i*h)
          sum += 2*f(x_i)
- area = h/3*sum
- print area

# Composite Trapezoidal Rule
- Set f, a, b, N
- h = b-a/N
- sum = f(a) + f(b)
- Add all intermediate terms (2:n-1) multiplied by 2 ***
- area = h/2*sum
- print area

# Power Method
- Set A and initial guess x
- Let y = Ax
- K = max abs value in y
- x = (1/K)*y
- if K(n) - K(n-1) > error, repeat 3
- print K(n)

# Least Squares
- Make matrices
- Find a, b and c
- Plot graph and compare with original

# Gauss Elimination
- Set a and b matrices, and make an augmented matrix Aug [a b]
- N = no. of rows/no. of unknown variables
- Make an Nx1 zero matrix X
- Loop j = 1:N-1
      Loop i = j+1:N
        m = Aug(i, j)/Aug(j, j);
        Aug(i, :) = Aug(i, :) - m*Aug(j, :)
- Set X(N) = Aug(N, N+1)/Aug(N, N)
- Loop k = N-1:-1:1
      X(k) = (Aug(k, N+1) - Aug(k, k+1:N)*X(k+1:N)/Aug(k, k)
- Print x

# Gauss Siedel
- Set a, b, N (length(b))
- Make an Nx1 matrix X
- Set initial guess vector P
- for j = 1:max_itr
      for i = 1:N
        X(i) = (b(i)/a(i, i)) - (a(i, [1:i-1,i+1:N])*P([1:i-1,i+1:N]))/a(i, i)
        P(i) = X(i)
- Print X

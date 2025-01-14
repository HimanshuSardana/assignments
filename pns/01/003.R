n = as.integer(readline("Enter a number: "))

a = 0
b = 1

ctr = 0

while (ctr <= n) {
  print(a)
  c = a+b
  a = b
  b = c
  ctr = ctr + 1
}

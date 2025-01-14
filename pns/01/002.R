x = as.integer(readline("Enter a number: "))
ans = 1

if (x < 0) {
  print("Not applicable")
} else {
  while (x != 1) {
    ans = ans * x
    x = x - 1
  }
  print(ans)
}

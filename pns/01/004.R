a = as.integer(readline("Enter first number: "))
b = as.integer(readline("Enter second number: "))

op = as.character(readline("Enter operator (+, -, *, /): "))

if (op == "+") {
  print(a+b)
} else if (op == "-") {
  print(a-b)
} else if (op == "*") {
  print(a*b)
} else if (op == "/") {
  print(a/b)
} else {
  print("Invalid operator")
}

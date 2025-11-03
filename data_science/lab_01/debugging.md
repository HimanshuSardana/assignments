# Debugging - Part 1

Indications that something is not right.

- message
  - A generic notification/diagnostic message produced by the message
    function
  - Execution of the function continues
- warning
  - An indication that something is wrong but not necessarily fatal
  - Execution of the function continues
  - Generation by the warning function
- error
  - An indication that a fatal problem has occurred
  - Execution stops
  - Produced by the stop function
- condition
  - A generic concept for indicating that something unexpected can occur
  - Programmers can create their own conditions

Warnings:

```
log(-1) [1] NaN Warning message: In log(-1) : NaNs produced
```

Example:

```
 printmessage <- function(x) { +   if(x > 0) +       print("x is greater than zero") +   else +       print("x is less than or equal to zero") +   invisible(x) + }  > printmessage(1) [1] "x is greater than zero"  > printmessage(NA) Error in if (x > 0) print("x is greater than zero") else print("x is less than or equal to zero") : missing value where TRUE/FALSE needed
```

Another example:

```
> printmessage2 <- function(x) { +   if(is.na(x)) +       print("x is a missing value!") +   else if(x > 0) +       print("x is greater than zero") +   else +       print("x is less than or equal to zero") +   invisible(x) + } > x <- log(-1) Warning message: In log(-1) : NaNs produced > printmessage2(x) [1] "x is a missing value!"
```

How do you know that something is wrong with your function?

- What was you input? How did you call the function?
- What were you expecting? Output, message, other results?
- What did you get?
- How does what you get differ from what you were expecting?
- Were your expectations correct in the first place?
- Can you reproduce the problem (exactly)?

# Debugging - Part 2

The primary tools for debugging functions in R are:

- traceback
  - Prints out the function call stack after an error occurs
  - Does nothing if there's no error
- debug: Flags a function for debug mode which allows you to step through
  execution of a function in debug mode
- browser
  - Suspends the execution of a function wherever it is called and puts the
    function in debug mode
- trace: allows you to insert debugging code into a function in specific
  places
- recover: allows you to modify the error behavior so that you can browse the
  function call stack

These are interactive tools specifically designed to allow you to pick through a
function. There's also the more blunt technique of inserting print/cat
statements in the function.

# Debugging - Part 3

## traceback()

```
> mean(x) Error in mean(x) : object 'x' not found > traceback() 1: mean(x) >
```

Example:

```
> lm(y - x) Error in eval(expr, envir, enclos) : object 'y' not found > traceback() 7: eval(expr, envir, enclos) 6: eval(prevars, data, env) 5: model.frame.default(formula = y - x, drop.unused.levels = TRUE) 4: model.frame(formula = y - x, drop.unused.levels = TRUE) 3: eval(expr, envir, enclos) 2: eval(mf, parent.frame()) 1: lm(y - x)
```

## debug()

```
> debug(lm) > lm(y - x) debugging in: lm(y - x) debug: {     ret.x <- x     ret.y <- y     cl <- match.call() …     if (!qr)          z$qr <- NULL     z } Browse[2]> n debug: ret.x <- x Browse[2]> n debug: ret.y <- y Browse[2]> n debug: cl <- match.call() Browse[2]> n debug: mf <- match.call(expand.dots = FALSE) Browse[2]> n debug: m <- match(c("formula", "data", "subset", "weights", "na.action",      "offset"), names(mf), 0L)
```

## recover()

```
> options(error = recover) > read.csv('nosuchfile') Error in file(file, "rt") : cannot open the connection In addition: Warning message: In file(file, "rt") :   cannot open file 'nosuchfile': No such file or directory  Enter a frame number, or 0 to exit     1: read.csv("nosuchfile") 2: read.table(file = file, header = header, sep = sep, quote = quote, dec = dec, fil 3: file(file, "rt")  Selection:
```

## Summary

- There are three main indications of a problem/condition: message, warning,
  error
  - Only an error is fatal
- When analyzing a function with a problem, make sure you can reproduce the
  problem. clearly state your expectations and how the output differs from
  your expectation
- Interactive debugging tools traceback, debug, browser, trace, and recover
  can be used to find problematic code in functions
- Debugging tools are not a substitute for thinking!

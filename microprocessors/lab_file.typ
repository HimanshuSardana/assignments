#show raw.where(block: true): it => [
  #set text(font: "Iosevka NF")
  #v(-4mm)
  #h(1pt) #box(inset: 8pt, fill: gray.lighten(80%), width: 100%)[#it] #h(1pt)
]

#show raw.where(block: false): it => [
  #set text(font: "Iosevka NF")
  #h(1pt) #box(outset: 3pt, fill: gray.lighten(80%))[#it] #h(1pt)
]


#show heading.where(level: 2): it => [
  #align(left)[#text(size: 12pt)[#it]]
]

#show heading.where(level: 1): it => [
  #align(center)[#text(size: 18pt)[#it]]
]
#set par(justify: true)
#set page(paper: "a4")

#align(center)[
  #v(20mm)
  #smallcaps()[#text(size: 24pt, weight: "bold")[UCS615]] \

  #smallcaps()[#text(
    size: 24pt,
    weight: "bold",
  )[Microprocessor Based System Design]]
]

#place(center + horizon, dy: -20pt)[
  #image("assets/thapar.png", width: 50%)
]

#place(center + bottom, dy: -30pt)[
  #v(-20mm)
  #smallcaps()[#text(weight: "bold", size: 20pt)[Lab Manual]]
  #v(2mm)
  #text(size: 16pt)[Submitted By: \
    #table(columns: 2, stroke: 0pt, align: left)[*Himanshu Sardana*][*102303244*][*Nitish*][*102303239*][*Harith Khanna*][*102303243*][*Zorawar Singh Bajwa*][*102303238*][*Bir Mahinder Singh*][*102303247*]
  ]

  #text(size: 16pt)[Submitted To: *Dr. Yadwinder Singh*] \

  #text(size: 16pt)[Session: *January to May 2026*]
]

#pagebreak()

#outline(title: "Table of Contents", depth: 1)

#pagebreak()

= Experiment 1

== Objective
To write and execute an assembly language program using an 8086 microprocessor that adds two 16-bit numbers.

== Theory
The Intel 8086 microprocessor is a 16-bit processor which allows arithmetic operations like addition, subtraction, multiplication, and division. The `ADD` instruction is used to perform addition of two registers or a register and memory. When two 16-bit numbers are added, the result may or may not generate a carry which is stored in the carry flag (CF).

The 8086 architecture uses registers like AX, BX, CX, DX (general purpose registers) to perform such operations.

== Algorithm
The following is the step-by-step procedure followed to develop the assembly language program and
achieve the experiment's objective.
+ Start the program.
+ Load the first 16-bit number into register AX.
+ Load the second 16-bit number into register BX.
+ Add the contents of BX to AX using the ADD instruction.
+ Store or observe the result in AX.
+ Terminate the program using HLT.

== Program
The following is the assembly language program written to add two 16-bit numbers using the 8086 microprocessor.
```asm
MOV AX, 1234H  ; Load first number into AX
MOV BX, 1236H  ; Load second number into BX
ADD AX, BX     ; Add contents of BX to AX
HLT            ; Halt the program
```

== Output
The output of the program will be the sum of the two 16-bit numbers stored in register AX. For the given example, the result will be: `AX = 246AH`

== Precautions
+ Ensure that the numbers being added do not exceed the 16-bit limit (0 to 65535).
+ Always check the carry flag (CF) after addition to handle overflow situations.
+ Use appropriate registers for storing intermediate results to avoid data loss.
+ Test the program with different sets of numbers to ensure accuracy.

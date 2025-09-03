#import "@preview/showybox:2.0.4": showybox

#let title(body) = [
  #box(
    width: 100%,
    inset: 10pt,
    radius: 4pt,
    fill: olive,
    stroke: 1pt + olive,
  )[
    #align(center + horizon)[
      #smallcaps()[#text(
        font: "Montserrat",
        size: 10pt,
        weight: "bold",
        fill: white,
      )[= #body]]
    ]
  ]
]

#let question(qno, body) = [
  #showybox(
    frame: (
      border-color: olive,
      title-color: olive,
      body-color: olive.lighten(90%),
    ),
    title-style: (
      color: white,
      weight: "bold",
      align: left,
      boxed-style: (
        radius: 4pt,
      ),
    ),
    title: [
      #smallcaps()[#text(size: 8pt, weight: "semibold", font: "Montserrat")[
        == Question #qno
      ]]
    ],
  )[
    #text(font: "Montserrat", size: 10pt)[
      #body
    ]
    #v(1mm)
  ]
]

#let solution(content) = [
  #block(
    inset: 12pt,
    radius: 5pt,
    width: 100%,
    stroke: (thickness: 1.3pt, dash: "dashed", paint: olive),
    fill: olive.lighten(90%),
  )[
    #text(
      weight: "bold",
      size: 9pt,
      fill: olive,
      font: "Montserrat",
    )[#smallcaps()[Solution]] \
    #v(-2mm)
    #text(size: 10pt)[#content]
  ]
]

#let output(content) = [
  #block(inset: 5pt, radius: 5pt, width: 100%)[
    #text(
      weight: "bold",
      size: 9pt,
      fill: olive,
      font: "Montserrat",
    )[#smallcaps()[Output]] \
    #v(-2mm)
    #text(size: 10pt)[#content]
  ]
]

#title("Assignment 4.1")
#question("1", [Create a Data Frame (DF) for the given datase])

#solution()[```python
patient_ids <- seq(1, 4)
adm_dates <- c("10/15/2009", "11/1/2009", "10/21/2009", "10/28/2009")
ages <- c(25, 34, 28, 52)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")

df <- data.frame(patient_id = patient_ids,
		 adm_date = as.Date(adm_dates, format="%m/%d/%Y"),
		 age = ages,
		 diabetes = diabetes,
		 status = status)

print(df)
```]
#output()[```txt
    patient_id   adm_date age diabetes    status
  1          1 2009-10-15  25    Type1      Poor
  2          2 2009-11-01  34    Type2  Improved
  3          3 2009-10-21  28    Type1 Excellent
  4          4 2009-10-28  52    Type1      Poor
  ```
]
#question("2", [
  Perform the following operation on DF
  #set enum(numbering: "(a)")
  + Extract PatientID and Age in Subset 1.
  + Identify the Type1 patients from DF.
  + Count the patient of Poor status.
  + Print the summary of the DF
  + Find the average age of patient having Diabetes
  + Input more patient data from the keyboard.
])

#solution()[```python
subset1 <- df[, c("patient_id", "age")]
type1_patients <- df[df$diabetes == "Type1", ]
poor_status_count <- sum(df$status == "Poor")
avg_age <- mean(df$age)

print(subset1)
print(type1_patients)
print(poor_status_count)
print(df_summary <- summary(df))
print(avg_age)

new_patient <- data.frame(patient_id = as.integer(readline(prompt="Enter Patient ID: ")),
			  adm_date = as.Date(readline(prompt="Enter Admission Date (MM/DD/YYYY): "), format="%m/%d/%Y"),
			  age = as.integer(readline(prompt="Enter Age: ")),
			  diabetes = readline(prompt="Enter Diabetes Type (Type1/Type2): "),
			  status = readline(prompt="Enter Status (Poor/Improved/Excellent): "))

```]
#output()[```txt
    patient_id age
  1          1  25
  2          2  34
  3          3  28
  4          4  52
    patient_id   adm_date age diabetes    status
  1          1 2009-10-15  25    Type1      Poor
  3          3 2009-10-21  28    Type1 Excellent
  4          4 2009-10-28  52    Type1      Poor

  [1] 2

     patient_id      adm_date               age          diabetes
   Min.   :1.00   Min.   :2009-10-15   Min.   :25.00   Length:4
   1st Qu.:1.75   1st Qu.:2009-10-19   1st Qu.:27.25   Class :character
   Median :2.50   Median :2009-10-24   Median :31.00   Mode  :character
   Mean   :2.50   Mean   :2009-10-24   Mean   :34.75
   3rd Qu.:3.25   3rd Qu.:2009-10-29   3rd Qu.:38.50
   Max.   :4.00   Max.   :2009-11-01   Max.   :52.00
      status
   Length:4
   Class :character
   Mode  :character



  [1] 34.75

  Enter Patient ID:  5
  Enter Admission Date (MM/DD/YYYY):  06/04/2005
  Enter Age:  12
  Enter Diabetes Type (Type1/Type2):  Type1
  Enter Status (Poor/Improved/Excellent):  Excellent
  ```
]
#question(
  "3",
  [
    Create a list named MyList having title “My First List” and criteria having following items:
    #set enum(numbering: "(a)")
    + Age vector a = (12, 14,16, 20)
    + A two dimensional matrix with 5 rows.
    + A score vector with values s = (‘First’, ‘Second’, ‘Third’)
  ],
)

#solution()[```python
myList <- list(
  title = "My First List",
  criteria = list(
    age_vector = c(12, 14, 16, 20),
    matrix_2d = matrix(1:10, nrow = 5),
    score_vector = c('First', 'Second', 'Third')
  )
)

print(myList)
print(myList$criteria)
print(myList$criteria$age_vector)

```]
#output()[```txt
  $title
  [1] "My First List"

  $criteria
  $criteria$age_vector
  [1] 12 14 16 20

  $criteria$matrix_2d
       [,1] [,2]
  [1,]    1    6
  [2,]    2    7
  [3,]    3    8
  [4,]    4    9
  [5,]    5   10

  $criteria$score_vector
  [1] "First"  "Second" "Third"


  $age_vector
  [1] 12 14 16 20

  $matrix_2d
       [,1] [,2]
  [1,]    1    6
  [2,]    2    7
  [3,]    3    8
  [4,]    4    9
  [5,]    5   10

  $score_vector
  [1] "First"  "Second" "Third"

  [1] 12 14 16 20
  ```
]

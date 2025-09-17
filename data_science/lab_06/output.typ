#import "@preview/showybox:2.0.4": showybox

#let title(body) = [
  #box(
    width: 100%,
    inset: 10pt,
    radius: 4pt,
    fill: blue,
    stroke: 1pt + blue,
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
      border-color: blue,
      title-color: blue,
      body-color: blue.lighten(90%),
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
    stroke: (thickness: 1.3pt, dash: "dashed", paint: blue),
    fill: blue.lighten(90%),
  )[
    #text(
      weight: "bold",
      size: 9pt,
      fill: blue,
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
      fill: blue,
      font: "Montserrat",
    )[#smallcaps()[Output]] \
    #v(-2mm)
    #text(size: 10pt)[#content]
  ]
]

#title("Assignment 5")
#question(
  "1",
  [Read the “daily_show_guests.csv” file from GitHub in the R and print the first 10 records],
)

#solution()[```python
data <- read.csv("./daily_show_guests.csv")
print(head(data, 10))
```]
#output()[```txt
     YEAR GoogleKnowlege_Occupation    Show    Group   Raw_Guest_List
  1  1999                     actor 1/11/99   Acting   Michael J. Fox
  2  1999                  Comedian 1/12/99   Comedy  Sandra Bernhard
  3  1999        television actress 1/13/99   Acting    Tracey Ullman
  4  1999              film actress 1/14/99   Acting Gillian Anderson
  5  1999                     actor 1/18/99   Acting David Alan Grier
  6  1999                     actor 1/19/99   Acting  William Baldwin
  7  1999           Singer-lyricist 1/20/99 Musician    Michael Stipe
  8  1999                     model 1/21/99    Media   Carmen Electra
  9  1999                     actor 1/25/99   Acting  Matthew Lillard
  10 1999         stand-up comedian 1/26/99   Comedy      David Cross
  ```
]
#question(
  "2",
  [Display the “column names” of the table and rename the columns as: - year: YEAR; job: GoogleKnowlege_Occupation; date: Show; category: Group; guest_name: Raw_Guest_List.],
)

#solution()[```python
library(dplyr)

data <- rename(data, "year" = "YEAR", "job" = "GoogleKnowlege_Occupation", "guest_name" = "Raw_Guest_List", "date" = "Show", "category" = "Group")
# or (using pipes)
# data <- data %>% rename("year" = "YEAR")
print(head(data))
print(colnames(data))
```]
#output()[```txt
    year                job    date category       guest_name
  1 1999              actor 1/11/99   Acting   Michael J. Fox
  2 1999           Comedian 1/12/99   Comedy  Sandra Bernhard
  3 1999 television actress 1/13/99   Acting    Tracey Ullman
  4 1999       film actress 1/14/99   Acting Gillian Anderson
  5 1999              actor 1/18/99   Acting David Alan Grier
  6 1999              actor 1/19/99   Acting  William Baldwin
  [1] "year"       "job"        "date"       "category"   "guest_name"
  ```
]
#question("3", [Create a report having year, date, and guest_name.])

#solution()[```python
report <- data.frame(data['year'], data['date'], data['guest_name'])
# or (using select)
# report <- select(year, date, guest_name(
head(report)
```]
#output()[```txt
    year date    guest_name
  1 1999 1/11/99 Michael J. Fox
  2 1999 1/12/99 Sandra Bernhard
  3 1999 1/13/99 Tracey Ullman
  4 1999 1/14/99 Gillian Anderson
  5 1999 1/18/99 David Alan Grier
  6 1999 1/19/99 William Baldwin
  ```
]
#question(
  "4",
  [Use “select” (dplyr) function to print all the record except “year”],
)

#solution()[```python
records <- select(data, -year)
print(head(records))
```]
#output()[```txt
                   job    date category       guest_name
  1              actor 1/11/99   Acting   Michael J. Fox
  2           Comedian 1/12/99   Comedy  Sandra Bernhard
  3 television actress 1/13/99   Acting    Tracey Ullman
  4       film actress 1/14/99   Acting Gillian Anderson
  5              actor 1/18/99   Acting David Alan Grier
  6              actor 1/19/99   Acting  William Baldwin
  ```
]
#question("5", [Extract the list of peoples who are “actor” only name is “ABC”])

#solution()[```python
print(filter(data, job == 'actor', guest_name=='Paul Rudd'))
```]
#output()[```txt
     year   job     date category guest_name
  1  1999 actor  12/6/99   Acting  Paul Rudd
  2  2001 actor  11/5/01   Acting  Paul Rudd
  3  2002 actor   8/8/02   Acting  Paul Rudd
  4  2003 actor   5/8/03   Acting  Paul Rudd
  5  2004 actor  2/11/04   Acting  Paul Rudd
  6  2005 actor   8/8/05   Acting  Paul Rudd
  7  2007 actor   6/5/07   Acting  Paul Rudd
  8  2008 actor  11/6/08   Acting  Paul Rudd
  9  2009 actor  3/11/09   Acting  Paul Rudd
  10 2010 actor 12/15/10   Acting  Paul Rudd
  11 2012 actor  2/23/12   Acting  Paul Rudd
  12 2013 actor   3/4/13   Acting  Paul Rudd
  13 2015 actor  7/20/15   Acting  Paul Rudd
  ```
]
#question("6", [Arrange the records in-order of date.])

#solution()[```python
# arrange(data, desc(date))
ordered_data <- arrange(data, date)
print(head(ordered_data))
```]
#output()[```txt
    year             job    date       category    guest_name
  1 2007         actress  1/1/07         Acting  Meryl Streep
  2 2007          author  1/1/07          Media  Sam Sheridan
  3 2008          Author  1/1/08          Media  Peggy Noonan
  4 2008      Consultant  1/1/08 Political Aide      Tim Gunn
  5 2008 television host  1/1/08          Media Conan O'Brien
  6 2000 football player 1/10/00      Athletics   Joe Montana
  ```
]
#question(
  "7",
  [Add one column to the database with the name “Experience”. (Help: mutate() function in dplyr)],
)

#solution()[```python
print(Sys.Date())
# data <- mutate(data, Experience=10)
# print(data['Experience'])
data_2 <- mutate(data, exp=difftime(Sys.Date(), as.numeric(year)))
print(head(data_2))
```]
#output()[```txt
  [1] "2025-09-10"
    year                job    date category       guest_name           exp
  1 1999              actor 1/11/99   Acting   Michael J. Fox 20340.98 days
  2 1999           Comedian 1/12/99   Comedy  Sandra Bernhard 20340.98 days
  3 1999 television actress 1/13/99   Acting    Tracey Ullman 20340.98 days
  4 1999       film actress 1/14/99   Acting Gillian Anderson 20340.98 days
  5 1999              actor 1/18/99   Acting David Alan Grier 20340.98 days
  6 1999              actor 1/19/99   Acting  William Baldwin 20340.98 days
  ```
]

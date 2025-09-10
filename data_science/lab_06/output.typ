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

#solution()[```r
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

#solution()[```r
data <- rename(data, "year" = "YEAR", "job" = "GoogleKnowlege_Occupation", "date" = "Show", "category" = "Group", "guest_name" = "Raw_Guest_List")
print(head(data))
```]
#output()[```txt
    year                job    date category       guest_name
  1 1999              actor 1/11/99   Acting   Michael J. Fox
  2 1999           Comedian 1/12/99   Comedy  Sandra Bernhard
  3 1999 television actress 1/13/99   Acting    Tracey Ullman
  4 1999       film actress 1/14/99   Acting Gillian Anderson
  5 1999              actor 1/18/99   Acting David Alan Grier
  6 1999              actor 1/19/99   Acting  William Baldwin
  ```
]
#question("3", [Create a report having year, date, and guest_name.])

#solution()[```r
report <- data.frame(data['year'], data['date'], data['guest_name'])
head(report)
```]
#output()[```txt
    year    date guest_name
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

#solution()[```r
select(data, job, date, category, guest_name)
```]
#output()[```txt
       job                           date  category   guest_name
  1    actor                      1/11/99  Acting     Michael J. Fox
  2    Comedian                   1/12/99  Comedy     Sandra Bernhard
  3    television actress         1/13/99  Acting     Tracey Ullman
  4    film actress               1/14/99  Acting     Gillian Anderson
  5    actor                      1/18/99  Acting     David Alan Grier
  6    actor                      1/19/99  Acting     William Baldwin
  7    Singer-lyricist            1/20/99  Musician   Michael Stipe
  8    model                      1/21/99  Media      Carmen Electra
  9    actor                      1/25/99  Acting     Matthew Lillard
  10   stand-up comedian          1/26/99  Comedy     David Cross
  11   actress                    1/27/99  Acting     Yasmine Bleeth
  12   actor                      1/28/99  Acting     D. L. Hughley
  13   television actress         10/18/99 Acting     Rebecca Gayheart
  14   Comedian                   10/19/99 Comedy     Steven Wright
  15   actress                    10/20/99 Acting     Amy Brenneman
  16   actress                    10/21/99 Acting     Melissa Gilbert
  17   actress                    10/25/99 Acting     Cathy Moriarty
  18   comedian                   10/26/99 Comedy     Louie Anderson
  19   actress                    10/27/99 Acting     Sarah Michelle Gellar
  20   Singer-songwriter          10/28/99 Musician   Melanie C
  21   actor                      10/4/99  Acting     Greg Proops
  22   television personality     10/5/99  Media      Maury Povich
  23   actress                    10/6/99  Acting     Brooke Shields
  24   Comic                      10/7/99  Comedy     Molly Shannon
  25   actor                      11/1/99  Acting     Chris O'Donnell
  26   actress                    11/15/99 Acting     Christina Ricci
  27   Singer-songwriter          11/16/99 Musician   Tori Amos
  28   actress                    11/17/99 Acting     Yasmine Bleeth
  29   comedian                   11/18/99 Comedy     Bill Maher
  30   actress                    11/2/99  Acting     Jennifer Love Hewitt
  ⋮    ⋮                          ⋮        ⋮          ⋮
  2664 stand-up comedian          6/10/15  Comedy     Colin Quinn
  2665 actor                      6/11/15  Acting     Mark Ruffalo
  2666 screenwriter               6/15/15  Media      Judd Apatow
  2667 actor                      6/16/15  Acting     Aziz Ansari
  2668 us president               6/17/15  Politician Bill Clinton
  2669 activist                   6/18/15  Advocacy   Malala Yousafzai
  2670 nyc mayor                  6/2/15   Politician Bill de Blasio
  2671 united states senator      6/22/15  Politician Al Franken
  2672 television Series Creator  6/23/15  Media      Seth MacFarlane
  2673 legal analyst              6/24/15  Misc       Andrew Napolitano
  2674 Comedian                   6/25/15  Comedy     Richard Lewis
  2675 actress                    6/29/15  Acting     Taylor Schilling
  2676 actress                    6/3/15   Acting     Melissa McCarthy
  2677 actor                      6/30/15  Acting     Jon Hamm
  2678 actor                      6/4/15   Acting     Steve Buscemi
  2679 First Minister of Scotland 6/8/15   Politician Nicola Sturgeon
  2680 actor                      6/9/15   Acting     Nick Offerman
  2681 United States Senator      7/1/15   Politician Kirsten Gillibrand
  2682 Author                     7/2/15   Media      Sarah Vowell
  2683 actor                      7/20/15  Acting     Paul Rudd
  2684 us president               7/21/15  Politician Barack Obama
  2685 actor                      7/22/15  Acting     Jake Gyllenhaal
  2686 Writer                     7/23/15  Media      Ta-Nehisi Coates
  2687 author                     7/27/15  Media      David McCullough
  2688 actor                      7/28/15  Acting     Tom Cruise
  2689 biographer                 7/29/15  Media      Doris Kearns Goodwin
  2690 director                   7/30/15  Media      J. J. Abrams
  2691 stand-up comedian          8/3/15   Comedy     Amy Schumer
  2692 actor                      8/4/15   Acting     Denis Leary
  2693 comedian                   8/5/15   Comedy     Louis C.K.
  ```
]
#question("5", [Extract the list of peoples who are “actor” only name is “ABC”])

#solution()[```r
filtered_data <- filter(data, job == 'actor')
select(filtered_data, guest_name)
```]
#output()[```txt
      guest_name
  1   Michael J. Fox
  2   David Alan Grier
  3   William Baldwin
  4   Matthew Lillard
  5   D. L. Hughley
  6   Greg Proops
  7   Chris O'Donnell
  8   Michael Boatman
  9   David Boreanaz
  10  Paul Rudd
  11  Rob Schneider
  12  Mike Judge
  13  Dave Foley
  14  Jerry O'Connell
  15  Brendan Fraser
  16  Hootie & the Blowfish, Billy Crystal
  17  Frank DeCaro's Oscar Special, John Larroquette
  18  Joseph Gordon-Levitt
  19  Eric McCormack
  20  Omar Epps
  21  Ryan Phillippe
  22  Ian McKellen
  23  Jon Voight
  24  Stephen Baldwin
  25  Ernie Hudson
  26  Jackie Chan
  27  Rob Estes
  28  Seth Green
  29  Thomas Gibson
  30  Ted Danson
  ⋮   ⋮
  567 Jim Parsons
  568 James McAvoy
  569 Seth Rogen
  570 Christopher Walken
  571 Kevin Hart
  572 Robert De Niro
  573 Tom Cruise
  574 George Takei
  575 Elisabeth Moss
  576 Bill Hader
  577 Ben Affleck
  578 Oscar Isaac
  579 Colin Firth
  580 Martin Short
  581 Bob Odenkirk
  582 Rob Corddry
  583 Kevin Hart
  584 Will Ferrell
  585 Robert Smigel
  586 Billy Crystal
  587 Peter Dinklage
  588 Mark Ruffalo
  589 Aziz Ansari
  590 Jon Hamm
  591 Steve Buscemi
  592 Nick Offerman
  593 Paul Rudd
  594 Jake Gyllenhaal
  595 Tom Cruise
  596 Denis Leary
  ```
]
#question("6", [Arrange the records in-order of date.])

#solution()[```r
# arrange(data, desc(date))
arrange(data, date)
```]
#output()[```txt
       year job                          date    category
  1    2007 actress                      1/1/07  Acting
  2    2007 author                       1/1/07  Media
  3    2008 Author                       1/1/08  Media
  4    2008 Consultant                   1/1/08  Political Aide
  5    2008 television host              1/1/08  Media
  6    2000 football player              1/10/00 Athletics
  7    2001 singer                       1/10/01 Musician
  8    2002 actor                        1/10/02 Acting
  9    2005 lawyer                       1/10/05 Misc
  10   2006 actor                        1/10/06 Acting
  11   2007 former governor of arkansas  1/10/07 Politician
  12   2008 television personality       1/10/08 Media
  13   2011 actor                        1/10/11 Acting
  14   2012 legal analyst                1/10/12 Misc
  15   2013 actor                        1/10/13 Acting
  16   2000 actor                        1/11/00 Acting
  17   2001 actress                      1/11/01 Acting
  18   2005 actor                        1/11/05 Acting
  19   2006 Broadcaster                  1/11/06 Media
  20   2007 Film actor                   1/11/07 Acting
  21   2010 lawyer                       1/11/10 Misc
  22   2011 actor                        1/11/11 Acting
  23   2012 former us senator            1/11/12 Politician
  24   1999 actor                        1/11/99 Acting
  25   2000 rapper                       1/12/00 Musician
  26   2004 Comedian                     1/12/04 Comedy
  27   2005 actor                        1/12/05 Acting
  28   2006 lawyer                       1/12/06 Misc
  29   2009 author                       1/12/09 Media
  30   2010 Editor                       1/12/10 Media
  ⋮    ⋮    ⋮                            ⋮       ⋮
  2664 2010 singer-songwriter            9/30/10 Musician
  2665 2013 television host              9/30/13 Media
  2666 2014 actor                        9/30/14 Acting
  2667 1999 actor                        9/30/99 Acting
  2668 1999 comedian                     9/30/99 Comedy
  2669 2008 Former Governor of Arkansas  9/4/08  Politician
  2670 2012 Journalist                   9/4/12  Media
  2671 2013 Astrophysicist               9/4/13  Science
  2672 2014 singer-songwriter            9/4/14  Musician
  2673 2000 film actor                   9/5/00  Acting
  2674 2008 0                            9/5/08  NA
  2675 2012 United States Senator        9/5/12  Politician
  2676 2013 actor                        9/5/13  Acting
  2677 2000 actor                        9/6/00  Acting
  2678 2005 doctor                       9/6/05  Science
  2679 2011 former governor of louisiana 9/6/11  Politician
  2680 2012 economist                    9/6/12  Academic
  2681 2000 Band                         9/7/00  Musician
  2682 2005 actor                        9/7/05  Acting
  2683 2010 Consultant                   9/7/10  Political Aide
  2684 2011 neurosurgeon                 9/7/11  Science
  2685 2012 NA                           9/7/12  NA
  2686 2005 journalist                   9/8/05  Media
  2687 2010 United States Senator        9/8/10  Politician
  2688 2011 actress                      9/8/11  Acting
  2689 2002 actress                      9/9/02  Acting
  2690 2003 united states senator        9/9/03  Politician
  2691 2010 Columnist                    9/9/10  Media
  2692 2013 Journalist                   9/9/13  Media
  2693 2014 United States Senator        9/9/14  Politician
       guest_name
  1    Meryl Streep
  2    Sam Sheridan
  3    Peggy Noonan
  4    Tim Gunn
  5    Conan O'Brien
  6    Joe Montana
  7    Vitamin C
  8    Jack Black
  9    John Grisham
  10   Albert Brooks
  11   Fmr. Gov. Mike Huckabee
  12   Lou Dobbs
  13   Denis Leary
  14   Andrew Napolitano
  15   Josh Brolin
  16   Will Ferrell
  17   Julia Stiles
  18   Samuel L. Jackson
  19   Peter Bergen
  20   Peter O'Toole
  21   John Yoo
  22   Colin Firth
  23   Jim DeMint
  24   Michael J. Fox
  25   Ice Cube
  26   Richard Lewis
  27   Dennis Quaid
  28   Edward Lazarus
  29   Maxwell Kennedy
  30   Paul Ingrassia
  ⋮    ⋮
  2664 Justin Timberlake
  2665 Bill O'Reilly
  2666 Ben Affleck
  2667 Bruce McCulloch and Mark McKinney
  2668 Bruce McCulloch and Mark McKinney
  2669 Mike Huckabee
  2670 Tom Brokaw
  2671 Mario Livio
  2672 Adam Levine
  2673 Donal Logue
  2674 (no guest)
  2675 Kirsten Gillibrand
  2676 Michael C. Hall
  2677 Greg Kinnear
  2678 Dr. Marc Siegel
  2679 Buddy Roemer
  2680 Austan Goolsbee
  2681 Spinal Tap
  2682 Samuel L. Jackson
  2683 Tim Gunn
  2684 Dr. Sanjay Gupta
  2685 none
  2686 Brian Williams
  2687 Tim Kaine
  2688 Marion Cotillard
  2689 Lorraine Bracco
  2690 Al Franken
  2691 Meghan McCain
  2692 Sheri Fink
  2693 Kirsten Gillibrand
  ```
]
#question(
  "7",
  [Add one column to the database with the name “Experience”. (Help: mutate() function in dplyr)],
)

//  the r pipe operator, written as %>%, is used to pass the output of one function directly as
//  the input to the next function, making code more readable and concise.
//  it is commonly used in the tidyverse ecosystem (e.g., dplyr, tidyr).
//  Eg: data_2 <- data %>% rename(yEaR=year)

#solution()[```r
data <- mutate(data, Experience=10)
data['Experience']
```]
#output()[```txt
       Experience
  1    10
  2    10
  3    10
  4    10
  5    10
  6    10
  7    10
  8    10
  9    10
  10   10
  11   10
  12   10
  13   10
  14   10
  15   10
  16   10
  17   10
  18   10
  19   10
  20   10
  21   10
  22   10
  23   10
  24   10
  25   10
  26   10
  27   10
  28   10
  29   10
  30   10
  ⋮    ⋮
  2664 10
  2665 10
  2666 10
  2667 10
  2668 10
  2669 10
  2670 10
  2671 10
  2672 10
  2673 10
  2674 10
  2675 10
  2676 10
  2677 10
  2678 10
  2679 10
  2680 10
  2681 10
  2682 10
  2683 10
  2684 10
  2685 10
  2686 10
  2687 10
  2688 10
  2689 10
  2690 10
  2691 10
  2692 10
  2693 10
  ```
]

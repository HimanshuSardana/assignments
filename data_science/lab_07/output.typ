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

#title("Assignment 6")
#question(
  "1",
  [Create the following data set with 20 different years and perform the following operations using `dplyr` library.],
)

#solution()[```python
# Question 1: Create the following data set with 20 different years and perform the following operations using „dplyr‟ library.
df <- data.frame(
  country = rep(c("India", "USA", "China", "Brazil", "UK", "Germany", "France", "Italy", "Canada", "Australia", "Japan", "South Korea", "Mexico", "South Africa", "Russia", "Spain", "Netherlands", "Sweden", "Norway", "Denmark", "Finland", "Poland", "Portugal", "Argentina", "Chile", "Colombia", "New Zealand", "Thailand", "Vietnam", "Philippines"), each = 2),
  continent = rep(c("Asia", "North America", "Asia", "South America", "Europe", "Europe", "Europe", "Europe", "North America", "Oceania", "Asia", "Asia", "North America", "Africa", "Europe", "Europe", "Europe", "Europe", "Europe", "Europe", "Europe", "Europe", "Europe", "South America", "South America", "South America", "Oceania", "Asia", "Asia", "Asia"), each = 2),
  year = rep(2000:2014, times = 2),
  lifeExp = runif(60, 60, 85),
  pop = sample(1e6:1.4e9, 60, replace = TRUE),
  gdpPerc = sample(3000:60000, 60, replace = TRUE)
)

print(summary(df))
```]
#output()[```txt
          country           continent            year           lifeExp
   Length:60          Length:60          Min.   :2000   Min.   :60.26
   Class :character   Class :character   1st Qu.:2003   1st Qu.:68.36
   Mode  :character   Mode  :character   Median :2007   Median :72.52
                                         Mean   :2007   Mean   :73.13
                                         3rd Qu.:2011   3rd Qu.:78.68
                                         Max.   :2014   Max.   :84.47
           pop                 gdpPerc
   Min.   :8.012e+06   Min.   : 4276
   1st Qu.:2.126e+08   1st Qu.:14291
   Median :6.008e+08   Median :26167
   Mean   :6.287e+08   Mean   :28973
   3rd Qu.:1.007e+09   3rd Qu.:41720
   Max.   :1.313e+09   Max.   :58945
  ```
]
#question("1. (a)", [How many unique countries per continent.])

#solution()[```python
library(dplyr)
unique_countries <- select(df, country, continent) %>%
  distinct() %>%
  group_by(continent) %>%
  summarise(unique_countries = n())

print(unique_countries)
```]
#output()[```txt
  # A tibble: 6 × 2
    continent     unique_countries
    <chr>                    <int>
  1 Africa                       1
  2 Asia                         7
  3 Europe                      13
  4 North America                3
  5 Oceania                      2
  6 South America                4
  ```
]
#question(
  "1. (b)",
  [Which European nation had the lowest GDP per capita in a given year?],
)

#solution()[```python
lowest_gdp_europe <- df %>%
  filter(continent == "Europe") %>%
  group_by(year) %>%
  select(country, year, gdpPerc) %>%
  arrange(gdpPerc) %>%
  slice(1)

print(lowest_gdp_europe)
```]
#output()[```txt
  # A tibble: 15 × 3
  # Groups:   year [15]
     country      year gdpPerc
     <chr>       <int>   <int>
   1 Spain        2000   25395
   2 Spain        2001   41012
   3 Netherlands  2002   53617
   4 Netherlands  2003   10773
   5 Sweden       2004   19775
   6 Sweden       2005   49475
   7 Norway       2006   30474
   8 Norway       2007   31538
   9 Denmark      2008    7364
  10 UK           2009   21542
  11 Germany      2010   36682
  12 Finland      2011    8264
  13 France       2012    4709
  14 France       2013   16364
  15 Italy        2014   17723
  ```
]
#question(
  "1. (c)",
  [According to the data available, what was the average life expectancy across each continent in a given year?],
)

#solution()[```python
avg_life_exp <- aggregate(lifeExp ~ continent + year, data = df, FUN = mean)
print(avg_life_exp)
```]
#output()[```txt
  continent year  lifeExp
  1           Asia 2000 61.97577
  2         Europe 2000 69.73997
  3           Asia 2001 65.38429
  4         Europe 2001 75.36298
  5  North America 2001 77.48323
  6  South America 2001 83.31628
  7         Europe 2002 78.64270
  8  North America 2002 72.60816
  9  South America 2002 80.81569
  10        Europe 2003 72.60430
  11 North America 2003 80.13556
  12       Oceania 2003 60.84253
  13 South America 2003 60.26338
  14          Asia 2004 63.39555
  15        Europe 2004 82.48371
  16       Oceania 2004 71.68405
  17 South America 2004 76.44950
  18          Asia 2005 81.82738
  19        Europe 2005 69.22234
  20 South America 2005 68.97537
  21          Asia 2006 76.79630
  22        Europe 2006 83.98541
  23 South America 2006 66.72524
  24          Asia 2007 72.76388
  25        Europe 2007 69.83252
  26       Oceania 2007 80.69767
  27 South America 2007 70.18291
  28          Asia 2008 73.26076
  29        Europe 2008 70.36375
  30       Oceania 2008 84.22953
  31          Asia 2009 83.46185
  32        Europe 2009 71.79938
  33 North America 2009 75.90216
  34          Asia 2010 66.78098
  35        Europe 2010 68.22478
  36 North America 2010 78.77737
  37        Africa 2011 82.84786
  38          Asia 2011 70.19840
  39        Europe 2011 69.80194
  40        Africa 2012 73.87304
  41          Asia 2012 70.27315
  42        Europe 2012 69.91503
  43          Asia 2013 76.18017
  44        Europe 2013 73.02079
  45          Asia 2014 70.65546
  46        Europe 2014 75.84524
  ```
]
#question(
  "1. (d)",
  [What 5 countries have the highest total GDP over all years combined?],
)

#solution()[```python
gdp_df <- df %>%
  mutate(total_gdp = as.numeric(gdpPerc) * as.numeric(pop))

top_5_countries <- aggregate(total_gdp ~ country, data = gdp_df, FUN = sum) %>%
  arrange(desc(total_gdp)) %>%
  head(5)
print(top_5_countries)
```]
#output()[```txt
  country    total_gdp
  1      Russia 1.437916e+14
  2      Mexico 8.652847e+13
  3      Sweden 7.355758e+13
  4       India 6.234923e+13
  5 Netherlands 5.535939e+13
  ```
]
#question(
  "1. (e)",
  [What countries and years had life expectancies of at least 80 years?],
)

#solution()[```python
high_life_exp <- df %>%
  filter(lifeExp >= 80) %>%
  select(country, year, lifeExp)

print(high_life_exp)
```]
#output()[```txt
  country year  lifeExp
  1           USA 2003 80.13556
  2        Canada 2002 80.96746
  3         Japan 2005 84.46835
  4  South Africa 2011 82.84786
  5        Russia 2014 83.78255
  6        Sweden 2004 82.48371
  7        Norway 2006 83.98541
  8     Argentina 2001 83.31628
  9     Argentina 2002 80.81569
  10  New Zealand 2007 80.69767
  11  New Zealand 2008 84.22953
  12     Thailand 2009 83.46185
  ```
]
#question(
  "1. (f)",
  [What 10 countries have the strongest correlation (in either direction) between life expectancy and per capita GDP?],
)
#solution()[```python
mutate(gdp_df, corr = lifeExp/gdpPerc)
top_10_corr <- aggregate(corr ~ country, data = gdp_df, FUN = function(x) cor(x, use = "complete.obs")) %>%
arrange(desc(abs(corr))) %>%

print(head(top_10_corr, 10))
```]
#output()[```txt
  country      continent     year lifeExp  pop        gdpPerc total_gdp
  1  India        Asia          2000 61.97577 1271264396 42184   5.362702e+13
  2  India        Asia          2001 65.38429  499153698 17474   8.722212e+12
  3  USA          North America 2002 64.24885  537490731 53220   2.860526e+13
  4  USA          North America 2003 80.13556  246308518 15541   3.827881e+12
  5  China        Asia          2004 63.39555  135614236 35285   4.785148e+12
  6  China        Asia          2005 79.18640  943832654 25288   2.386764e+13
  7  Brazil       South America 2006 68.16280 1199360105  6157   7.384460e+12
  8  Brazil       South America 2007 70.18291  712399179 37798   2.692726e+13
  9  UK           Europe        2008 74.63302  478771350 16002   7.661299e+12
  10 UK           Europe        2009 68.21730  312664356 21542   6.735416e+12
  11 Germany      Europe        2010 64.23460  451188843 36682   1.655051e+13
  12 Germany      Europe        2011 67.17170 1096698682  9669   1.060398e+13
  13 France       Europe        2012 63.65903   15747597  4709   7.415543e+10
  14 France       Europe        2013 70.96158  425105885 16364   6.956433e+12
  15 Italy        Europe        2014 71.83112  213793570 17723   3.789063e+12
  16 Italy        Europe        2000 70.38039 1313363207 26939   3.538069e+13
  17 Canada       North America 2001 77.48323  208869615 32465   6.780952e+12
  18 Canada       North America 2002 80.96746 1109633463  8316   9.227712e+12
  19 Australia    Oceania       2003 60.84253   70360914 12798   9.004790e+11
  20 Australia    Oceania       2004 71.68405 1033056924 19899   2.055680e+13
  21 Japan        Asia          2005 84.46835  655426026 53910   3.533402e+13
  22 Japan        Asia          2006 76.79630  874776642 10289   9.000577e+12
  23 South Korea  Asia          2007 72.76388  340780719 25249   8.604372e+12
  24 South Korea  Asia          2008 73.26076  120173370 33618   4.039988e+12
  25 Mexico       North America 2009 75.90216 1241919660 56900   7.066523e+13
  26 Mexico       North America 2010 78.77737 1233821057 12857   1.586324e+13
  27 South Africa Africa        2011 82.84786  160204427 56702   9.083911e+12
  28 South Africa Africa        2012 73.87304  597670713 36393   2.175103e+13
  29 Russia       Europe        2013 68.40803 1269887934 55844   7.091562e+13
  30 Russia       Europe        2014 83.78255 1250660510 58270   7.287599e+13
  31 Spain        Europe        2000 72.73875  998222050 25395   2.534985e+13
  32 Spain        Europe        2001 75.36298  120919878 41012   4.959166e+12
  33 Netherlands  Europe        2002 78.64270  955930590 53617   5.125413e+13
  34 Netherlands  Europe        2003 72.60430  381069521 10773   4.105262e+12
  35 Sweden       Europe        2004 82.48371  603973317 19775   1.194357e+13
  36 Sweden       Europe        2005 69.22234 1245356331 49475   6.161400e+13
  37 Norway       Europe        2006 83.98541 1281119230 30474   3.904083e+13
  38 Norway       Europe        2007 69.83252   20089523 31538   6.335834e+11
  39 Denmark      Europe        2008 66.09448    8011521  7364   5.899684e+10
  40 Denmark      Europe        2009 75.38146  137550455 32902   4.525685e+12
  41 Finland      Europe        2010 72.21495  328691868 56739   1.864965e+13
  42 Finland      Europe        2011 72.43218  642156409  8264   5.306781e+12
  43 Poland       Europe        2012 76.17103  901332160 43732   3.941706e+13
  44 Poland       Europe        2013 79.69277  155956502 19762   3.082012e+12
  45 Portugal     Europe        2014 71.92204  193366864 58526   1.131699e+13
  46 Portugal     Europe        2000 66.10076   76890520 58945   4.532312e+12
  47 Argentina    South America 2001 83.31628 1065119317 45590   4.855879e+13
  48 Argentina    South America 2002 80.81569 1145267526  5135   5.880949e+12
  49 Chile        South America 2003 60.26338  794797340 41565   3.303575e+13
  50 Chile        South America 2004 76.44950  727250123 11970   8.705184e+12
  51 Colombia     South America 2005 68.97537  812139894 11843   9.618173e+12
  52 Colombia     South America 2006 65.28769  116880593 16960   1.982295e+12
  53 New Zealand  Oceania       2007 80.69767 1213026725 14769   1.791519e+13
  54 New Zealand  Oceania       2008 84.22953  865717428 17507   1.515612e+13
  55 Thailand     Asia          2009 83.46185  400162831 40355   1.614857e+13
  56 Thailand     Asia          2010 66.78098  519265232 40129   2.083759e+13
  57 Vietnam      Asia          2011 70.19840  616056518  7588   4.674637e+12
  58 Vietnam      Asia          2012 70.27315  499926939 30748   1.537175e+13
  59 Philippines  Asia          2013 76.18017   29784803 45594   1.358008e+12
  60 Philippines  Asia          2014 70.65546  847957709  4276   3.625867e+12
  corr
  1  0.001469177
  2  0.003741804
  3  0.001207231
  4  0.005156397
  5  0.001796671
  6  0.003131382
  7  0.011070781
  8  0.001856789
  9  0.004663980
  10 0.003166711
  11 0.001751120
  12 0.006947120
  13 0.013518588
  14 0.004336445
  15 0.004052989
  16 0.002612584
  17 0.002386670
  18 0.009736347
  19 0.004754065
  20 0.003602395
  21 0.001566840
  22 0.007463923
  23 0.002881852
  24 0.002179212
  25 0.001333957
  26 0.006127197
  27 0.001461110
  28 0.002029869
  29 0.001224984
  30 0.001437833
  31 0.002864294
  32 0.001837584
  33 0.001466749
  34 0.006739469
  35 0.004171110
  36 0.001399138
  37 0.002755969
  38 0.002214234
  39 0.008975351
  40 0.002291091
  41 0.001272757
  42 0.008764785
  43 0.001741769
  44 0.004032627
  45 0.001228890
  46 0.001121397
  47 0.001827512
  48 0.015738207
  49 0.001449859
  50 0.006386758
  51 0.005824147
  52 0.003849510
  53 0.005463990
  54 0.004811192
  55 0.002068191
  56 0.001664157
  57 0.009251239
  58 0.002285454
  59 0.001670838
  60 0.016523728
  ```
]

#question(
  "1. (g)",
  [Which combinations of continent (besides Asia) and year have the highest average population across all countries?],
)

#question(
  "1. (h)",
  [Which three countries have had the most consistent population estimates (i.e. lowest standard deviation) across the years of available data? ],
)

#solution()[```python
consistent_pop <- aggregate(pop ~ country, data = df, FUN = sd) %>%
  arrange(pop) %>%
  head(3)

print(consistent_pop)
```]
#output()[```txt
  country      pop
  1  Mexico  5726577
  2  Russia 13595842
  3   Chile 47763095
  ```
]
#question(
  "1. (i)",
  [Excluding records from a given year, which observations indicate that the population of a country has decreased from the previous year and the life expectancy has increased?],
)

#solution()[```python
pop_life_change <- df %>%
  arrange(country, year) %>%
  mutate(pop_change = pop - lag(pop),
	 lifeExp_change = lifeExp - lag(lifeExp)) %>%
  filter(pop_change < 0 & lifeExp_change > 0) %>%
  select(country, year, pop, lifeExp)

print(pop_life_change)
```]
#output()[```txt
      country    year        pop  lifeExp
  1       Brazil 2007  712399179 70.18291
  2       Canada 2001  208869615 77.48323
  3        Chile 2004  727250123 76.44950
  4      Denmark 2008    8011521 66.09448
  5        India 2001  499153698 65.38429
  6        Italy 2014  213793570 71.83112
  7       Mexico 2010 1233821057 78.77737
  8  New Zealand 2008  865717428 84.22953
  9       Poland 2013  155956502 79.69277
  10      Russia 2014 1250660510 83.78255
  11 South Korea 2008  120173370 73.26076
  12       Spain 2001  120919878 75.36298
  13    Thailand 2009  400162831 83.46185
  14          UK 2008  478771350 74.63302
  15         USA 2003  246308518 80.13556
  16     Vietnam 2012  499926939 70.27315
  ```
]
#question(
  "2",
  [Create a database file “DataSet.csv” that contains 10 records of medicine with attribute : MedID, Med_Name, Company, Manf_year, Exp_date, Quantity_in_stock, Sales.],
)

#solution()[```python
df <- data.frame(
  medid = 1:10,
  med_name = c("meda", "medb", "medc", "medd", "mede", "medf", "medg", "medh", "medi", "medj"),
  company = c("comp1", "comp2", "comp1", "comp3", "comp2", "comp4", "comp3", "comp1", "comp4", "comp2"),
  manf_year = c(2018, 2019, 2018, 2020, 2019, 2021, 2020, 2018, 2021, 2019),
  exp_date = as.Date(trimws(iconv(c("2023-12-31", "2024-06-30", "2023-11-30",
                                    "2025-01-31", "2024-05-31", "2026-12-31",
                                    "2025-03-31", "2023-10-31", "2026-11-30", "2024-07-31"),
                                  from = "", to = "UTF-8"))),
  quantity_in_stock = c(100, 150, 200, 120, 180, 160, 140, 130, 170, 110),
  sales = c(5000, 7000, 6000, 8000, 7500, 9000, 8500, 6500, 9500, 7200)
)
print(df)
write.csv("DataSet.csv", row.names=FALSE)
```]
#output()[```txt
  medid med_name company manf_year   exp_date quantity_in_stock sales
      1       1     meda    comp1      2018 2023-12-31               100  5000
      2       2     medb    comp2      2019 2024-06-30               150  7000
      3       3     medc    comp1      2018 2023-11-30               200  6000
      4       4     medd    comp3      2020 2025-01-31               120  8000
      5       5     mede   comp2      2019 2024-05-31               180  7500
      6       6     medf   comp4      2021 2026-12-31               160  9000
      7       7     medg   comp3      2020 2025-03-31               140  8500
      8       8     medh   comp1      2018 2023-10-31               130  6500
      9       9     medi   comp4      2021 2026-11-30               170  9500
      10     10     medj   comp2      2019 2024-07-31               110  7200
    "x"
    "DataSet.csv"
  ```
]
Question 2. (a): Read the data file and show the first 4 record of the file.

#solution()[```python
data <- read.csv("DataSet.csv")
print(head(data, 4))
```]
#output()[```txt
  MedID	Med_Name	Company	Manf_year	Exp_date	Quantity_in_stock	Sales
  1	1	MedA	Comp1	2018	2023-12-31	100	5000
  2	2	MedB	Comp2	2019	2024-06-30	150	7000
  3	3	MedC	Comp1	2018	2023-11-30	200	6000
  4	4	MedD	Comp3	2020	2025-01-31	120	8000
  ```
]
Question 2. (b): Read the data file and show the last 4 record of the file.

#solution()[```python
print(tail(df, 4))
```]
#output()[```txt
  medid med_name company manf_year   exp_date quantity_in_stock sales
  7      7     medg   comp3      2020 2025-03-31               140  8500
  8      8     medh   comp1      2018 2023-10-31               130  6500
  9      9     medi   comp4      2021 2026-11-30               170  9500
  10    10     medj   comp2      2019 2024-07-31               110  7200
  ```
]
Question 2. (c): Find the coorelation between Quantity_in_stock and Exp_date.

#solution()[```python
data$Exp_date_numeric <- (data$Exp_date)
correlation <- cor(data$Quantity_in_stock, data$Exp_date_numeric)

print(correlation)
```]
Question 2. (d): Plot the bar graph for the Sales with year of manufacturing.
Question 2. (e): Find the company having more than one type of medicine.
Question 2. (f): Find the type of Medicine available.
Question 2. (g): Which medicines are expiring? Show by box plots.
Question 2. (h): Find the average stock in the store.
Question 2. (i): Draw the regression line between Manufacturing year and Sales.

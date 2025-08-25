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
      #smallcaps()[#text(font: "Montserrat", size: 10pt, weight: "bold", fill: white)[= #body]]
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
    #text(font: "Montserrat", size: 9pt)[
      #body
    ]
    #v(1mm)
  ]
]

#let solution(content) = [
  #block(inset: 12pt, radius: 5pt, width: 100%, stroke: (thickness: 1.3pt, dash: "dashed", paint: olive), fill: olive.lighten(90%))[
    #text( weight: "bold", size: 9pt, fill: olive, font: "Montserrat")[#smallcaps()[Solution]] \
    #v(-2mm)
    #text( size: 10pt)[#content]
  ]
]

#let output(content) = [
  #block(inset: 5pt, radius: 5pt, width: 100%)[
    #text( weight: "bold", size: 9pt, fill: olive, font: "Montserrat")[#smallcaps()[Output]] \
    #v(-2mm)
    #text(size: 10pt)[#content]
  ]
]

#title("Assignment 4")
#question("1",[
  Write a Python program to scrape all available books from the website (https://books.toscrape.com/) Books to Scrape – a live site built for practicing scraping (safe, legal, no anti-bot). For each book, extract the following details: 
  + Title
  + Price
  + Availability (in stock/out of stock)
  + Star rating (One, Two, Three, Four, Five)

  Store the scraped results into a Pandas DataFrame and export them to a CSV file named `books.csv`. 
])

#solution()[```python
import requests
from bs4 import BeautifulSoup
import pandas as pd

for i in range(1, 51):
    URL = f"https://books.toscrape.com/catalogue/page-{str(i)}.html"

    response = requests.get(URL)

    html = response.text
    soup = BeautifulSoup(html, "html.parser")

    book_titles = soup.find_all("h3")
    price = soup.find_all("p", class_="price_color")
    availability = soup.find_all("p", class_="instock availability")


    books = []
    for title, price, availability in zip(book_titles, price, availability):
        book = {
            "title": title.find("a")["title"],
            "price": price.text.strip(),
            "availability": availability.text.strip()
        }
        books.append(book)
    print(f"Page {i} scraped successfully.")

df = pd.DataFrame(books)
df.to_csv("books.csv", index=False)

```]
#output()[```txt
Page 1 scraped successfully.
Page 2 scraped successfully.
Page 3 scraped successfully.
Page 4 scraped successfully.
Page 5 scraped successfully.
Page 6 scraped successfully.
Page 7 scraped successfully.
Page 8 scraped successfully.
Page 9 scraped successfully.
Page 10 scraped successfully.
Page 11 scraped successfully.
Page 12 scraped successfully.
Page 13 scraped successfully.
Page 14 scraped successfully.
Page 15 scraped successfully.
Page 16 scraped successfully.
Page 17 scraped successfully.
Page 18 scraped successfully.
Page 19 scraped successfully.
Page 20 scraped successfully.
Page 21 scraped successfully.
Page 22 scraped successfully.
Page 23 scraped successfully.
Page 24 scraped successfully.
Page 25 scraped successfully.
Page 26 scraped successfully.
Page 27 scraped successfully.
Page 28 scraped successfully.
Page 29 scraped successfully.
Page 30 scraped successfully.
Page 31 scraped successfully.
Page 32 scraped successfully.
Page 33 scraped successfully.
Page 34 scraped successfully.
Page 35 scraped successfully.
Page 36 scraped successfully.
Page 37 scraped successfully.
Page 38 scraped successfully.
Page 39 scraped successfully.
Page 40 scraped successfully.
Page 41 scraped successfully.
Page 42 scraped successfully.
Page 43 scraped successfully.
Page 44 scraped successfully.
Page 45 scraped successfully.
Page 46 scraped successfully.
Page 47 scraped successfully.
Page 48 scraped successfully.
Page 49 scraped successfully.
Page 50 scraped successfully.
```
]
#question("2",[
  Write a Python program to scrape the IMDB Top 250 Movies list (https://www.imdb.com/chart/top/) . For each movie, extract the following details:
  + Rank (1–250) 
  + Movie Title 
  + Year of Release 
  + IMDB Rating 
])

#solution()[```python
from selenium import webdriver
from selenium.webdriver.common.by import By
import pandas as pd

driver = webdriver.Firefox()
driver.get("https://www.imdb.com/chart/top/")

# ul.ipc-metadata-list
movies = driver.find_elements(By.CSS_SELECTOR, "ul.ipc-metadata-list li")
rows = []
for movie in movies:
    obj = {}
    title_selector = ".ipc-title__text.ipc-title__text--reduced"
    title = movie.find_element(By.CSS_SELECTOR, title_selector).text

    rank = title.split(".")[0]
    obj["Rank"] = rank

    year_selector=".cli-title-metadata-item"
    year = movie.find_element(By.CSS_SELECTOR, year_selector).text

    rating_selector = ".ipc-rating-star--rating"
    rating = movie.find_element(By.CSS_SELECTOR, rating_selector).text

    obj["Rank"] = rank
    obj["Title"] = title.split(". ")[1]
    obj["Year"] = year
    obj["Rating"] = rating
    rows.append(obj)

data = pd.DataFrame(rows)
print(data)

data.to_csv("imdb_top_movies.csv", index=False)
```]
#output()[```txt
   Rank                                              Title  Year Rating
0      1                           The Shawshank Redemption  1994    9.3
1      2                                      The Godfather  1972    9.2
2      3                                    The Dark Knight  2008    9.1
3      4                              The Godfather Part II  1974    9.0
4      5                                       12 Angry Men  1957    9.0
..   ...                                                ...   ...    ...
245  246                                           The Help  2011    8.1
246  247                                      Groundhog Day  1993    8.0
247  248  Demon Slayer: Kimetsu no Yaiba - The Movie: Mu...  2020    8.2
248  249                                           Drishyam  2015    8.2
249  250                                 Gangs of Wasseypur  2012    8.2

[250 rows x 4 columns]
```
]
#question("3",[
  Write a Python program to scrape the weather information for top world cities from the given website (https://www.timeanddate.com/weather/) . For each city, extract the following details: 
  1. City Name 
  2. Temperature 
  3. Weather Condition (e.g., Clear, Cloudy, Rainy, etc.) 
  Store the results in a Pandas DataFrame and export it to a CSV file named `weather.csv`.
])
#v(5mm)
#solution()[```python
import requests
from bs4 import BeautifulSoup
import pandas as pd

URL = "https://www.timeanddate.com/weather/"

headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"
        }
response = requests.get(URL, headers=headers)
soup = BeautifulSoup(response.content, "html.parser")

td = soup.find_all("td")

rows = []  
row = {}

for idx, i in enumerate(td):
    if idx % 4 == 0:
        row = {}
        row["City"] = i.text.strip()
        if i.text.strip().endswith("*"):
            row["City"] = row["City"][:-1].strip()
    elif idx % 4 == 1:
        try:
            row["Local Time"] = i.text.split()[1].strip()
        except:
            row["Local Time"] = None
    elif idx % 4 == 2:
        try:
            img = i.find("img")
            row["Weather"] = img["alt"] if img else None
        except:
            row["Weather"] = None
    elif idx % 4 == 3:
        row["Temperature"] = i.text.strip()
        # completed row → append to rows
        rows.append(row)

data = pd.DataFrame(rows)
print(data)

data.to_csv("weather.csv", index=False)

# 0: Accra
# 1: सोम 08.58
# 2:
#     img: Overcast. Mild.
# 3: 24 °C
#

```]
#output()[```txt
City Local Time                  Weather Temperature
0           Accra      09.09          Overcast. Mild.       24 °C
1    Kuala Lumpur      17.09     Passing clouds. Hot.       33 °C
2     Addis Ababa      12.09               Fog. Cool.       15 °C
3     Kuwait City      12.09    Sunny. Extremely hot.       41 °C
4        Adelaide      18.39                    Cool.       16 °C
..            ...        ...                      ...         ...
135        Zagreb      11.09             Sunny. Mild.       20 °C
136    Kiritimati      23.09    Passing clouds. Warm.       27 °C
137        Zürich      11.09                    Cool.       16 °C
138       Kolkata      14.39  Scattered clouds. Warm.       31 °C
139                     None                     None            

[140 rows x 4 columns]
```
]

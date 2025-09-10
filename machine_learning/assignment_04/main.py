import requests
from bs4 import BeautifulSoup
import pandas as pd

books = []
for i in range(1, 10):
    URL = f"https://books.toscrape.com/catalogue/page-{str(i)}.html"

    response = requests.get(URL)

    html = response.text
    soup = BeautifulSoup(html, "html.parser")

    book_titles = soup.find_all("h3")
    price = soup.find_all("p", class_="price_color")
    availability = soup.find_all("p", class_="instock availability")


    for title, price, availability in zip(book_titles, price, availability):
        book = {
            "title": title.find("a")["title"],
            "price": price.text[1:].strip(),
            "availability": availability.text.strip()
        }
        books.append(book)
    print(f"Page {i} scraped successfully.")

df = pd.DataFrame(books)
df.to_csv("books.csv", index=False)
print(df)

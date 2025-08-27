import requests
from bs4 import BeautifulSoup
import pandas as pd

books = []
for i in range(1, 11):
    URL = f"https://books.toscrape.com/catalogue/page-{str(i)}.html"

    response = requests.get(URL)

    html = response.text
    soup = BeautifulSoup(html, "html.parser")

    book_titles = soup.find_all("h3")
    price = soup.find_all("p", class_="price_color")
    availability = soup.find_all("p", class_="instock availability")
    rating = soup.find_all("article", class_="product_pod")

    p = [article.find("p") for article in rating][0]
    rating = p["class"][1]

    for title, price, availability in zip(book_titles, price, availability):
        book = {
            "title": title.find("a")["title"],
            "price": price.text.strip(),
            "availability": availability.text.strip(),
            "rating": rating
        }
        books.append(book)
    print(f"Page {i} scraped successfully.")

df = pd.DataFrame(books)
df.to_csv("books.csv", index=False)

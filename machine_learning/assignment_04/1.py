import requests
from bs4 import BeautifulSoup
import pandas as pd

books = []
for i in range(1, 11):
    URL = f"https://books.toscrape.com/catalogue/page-{i}.html"
    response = requests.get(URL)
    soup = BeautifulSoup(response.text, "html.parser")

    for article in soup.find_all("article", class_="product_pod"):
        title = article.h3.a.get("title", "").strip()
        price = article.find("p", class_="price_color")
        price = price.text.strip() if price else ""
        availability = article.find("p", class_="instock availability")
        availability = availability.text.strip() if availability else ""
        rating_tag = article.find("p", class_="star-rating")
        rating = rating_tag["class"][1] if rating_tag and len(rating_tag["class"]) > 1 else ""

        book = {
            "title": title,
            "price": price[1:].strip(),
            "availability": availability,
            "rating": rating
        }
        books.append(book)
    print(f"Page {i} scraped successfully.")
df = pd.DataFrame(books)
df.to_csv("books.csv", index=False)

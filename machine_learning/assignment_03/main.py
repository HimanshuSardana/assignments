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


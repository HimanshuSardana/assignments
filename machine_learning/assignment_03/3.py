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

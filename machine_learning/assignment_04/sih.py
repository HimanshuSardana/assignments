from selenium import webdriver
from selenium.webdriver.common.by import By
import pandas as pd
import time

URL = "https://www.sih.gov.in/sih2025PS"

options = webdriver.FirefoxOptions()
options.add_argument("--headless")
driver = webdriver.Firefox(options=options)
driver.get(URL)

time.sleep(5)

# scrape table with ID dataTablePS
curr_page = 1
data = []
while True:
    table = driver.find_element(By.ID, "dataTablePS")
    rows = table.find_elements(By.TAG_NAME, "tr")
    for row in rows:
        cols = row.find_elements(By.TAG_NAME, "td")
        cols = [col.text for col in cols]
        # check if cols is not empty
        if cols:
            if len(cols) == 17:
                print(cols)
                data.append(cols)

    next_button = driver.find_element(By.ID, "dataTablePS_next")
    if "disabled" in next_button.get_attribute("class"):
        break
    else:
        next_button.click()
        print(f"Moving to page {curr_page + 1}")
        curr_page += 1
        time.sleep(2)

df = pd.DataFrame(data)
# df.dropna(inplace=True)
print(df)

# save as csv
df.to_csv("sih2025_problem_statements.csv", index=False, header=False)

# ['3', 'Ministry of Development of North Eastern Region', 'Low-Cost smart transportation solution for Agri produce from remote farms to nearest motorable road in NER Region', '', '', '', '', '', '', '', '', '', '', 'Hardware', 'SIH25003', '0', 'Transportation & Logistics']

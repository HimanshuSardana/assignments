import time
import pandas as pd
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service as ChromeService
# from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.options import Options

def scrape_imdb_top_250():
    """
    Scrapes the IMDb Top 250 movies list and saves the data to a CSV file.

    This function navigates to the IMDb Top 250 chart, extracts the rank,
    title, year of release, and IMDb rating for each movie, stores the
    data in a Pandas DataFrame, and exports it to 'imdb_top250.csv'.
    """
    # --- 1. Set up Selenium WebDriver ---
    print("Setting up Selenium WebDriver...")
    chrome_options = Options()
    # Run in headless mode to avoid opening a browser window
    chrome_options.add_argument("--headless")
    chrome_options.add_argument("--window-size=1920,1080") # Set window size
    chrome_options.add_argument("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36")


    # Automatically download and manage the ChromeDriver
    try:
        driver = webdriver.Firefox()
    except Exception as e:
        print(f"Error setting up WebDriver: {e}")
        return

    url = "https://www.imdb.com/chart/top/"
    print(f"Navigating to {url}...")
    driver.get(url)

    time.sleep(5)

    print("Scraping movie data...")
    movies_data = []
    
    movie_elements = driver.find_elements(By.CSS_SELECTOR, "ul.ipc-metadata-list > li.ipc-metadata-list-summary-item")

    if not movie_elements:
        print("Could not find any movie elements. The page structure might have changed.")
        driver.quit()
        return

    for movie in movie_elements:
        try:
            # --- Extract Title and Rank ---
            # The title and rank are in an h3 tag
            title_element = movie.find_element(By.CSS_SELECTOR, "h3.ipc-title__text")
            title_text = title_element.text
            rank_str, title = title_text.split(". ", 1)
            rank = int(rank_str)

            # --- Extract Year, Duration, and Rating ---
            # This div contains multiple spans with year, duration, etc.
            metadata_elements = movie.find_element(By.CSS_SELECTOR, ".cli-title-metadata-item")
            print(metadata_elements.text)
            
            year = metadata_elements.text 

            # --- Extract IMDb Rating ---
            # The rating is in a span with a specific class structure
            rating_element = movie.find_element(By.CSS_SELECTOR, "span.ipc-rating-star")
            rating_text = rating_element.text.split("\n")[0] # Get the rating value, e.g., '9.3'
            rating = float(rating_text)

            movies_data.append({
                "Rank": rank,
                "Title": title,
                "Year": year,
                "Rating": rating
            })
            print(f"Scraped: {rank}. {title}")

        except Exception as e:
            print(f"Error scraping a movie entry: {e}")
            continue # Move to the next movie if an error occurs

    # --- 4. Clean up the WebDriver ---
    driver.quit()
    print("WebDriver closed.")

    # --- 5. Store data in a Pandas DataFrame ---
    if not movies_data:
        print("No data was scraped. Exiting without creating a CSV file.")
        return

    print("Creating Pandas DataFrame...")
    df = pd.DataFrame(movies_data)

    # --- 6. Export DataFrame to a CSV file ---
    output_filename = "imdb_top250.csv"
    df.to_csv(output_filename, index=False, encoding='utf-8')
    print(f"\nSuccessfully scraped {len(df)} movies.")
    print(f"Data saved to '{output_filename}'")
    print("\nFirst 5 rows of the data:")
    print(df.head())


if __name__ == "__main__":
    scrape_imdb_top_250()

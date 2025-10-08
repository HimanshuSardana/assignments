# Question 1: Create the following data set with 20 different years and perform the following operations using „dplyr‟ library.
df <- data.frame(
  country = rep(c("India", "USA", "China", "Brazil", "UK", "Germany", "France", "Italy", "Canada", "Australia", 
                  "Japan", "South Korea", "Mexico", "South Africa", "Russia",
                  "Spain", "Netherlands", "Sweden", "Norway", "Denmark", "Finland", "Poland", "Portugal", 
                  "Argentina", "Chile", "Colombia", "New Zealand", "Thailand", "Vietnam", "Philippines"), each = 2),
  continent = rep(c("Asia", "North America", "Asia", "South America", "Europe", "Europe", "Europe", "Europe", "North America", "Oceania", 
                    "Asia", "Asia", "North America", "Africa", "Europe",
                    "Europe", "Europe", "Europe", "Europe", "Europe", "Europe", "Europe", "Europe", 
                    "South America", "South America", "South America", "Oceania", "Asia", "Asia", "Asia"), each = 2),
  year = rep(2000:2014, times = 30),
  lifeExp = runif(60, 60, 85), 
  pop = sample(1e6:1.4e9, 60, replace = TRUE),
  gdpPerc = sample(3000:60000, 60, replace = TRUE)
)

# Question 1. (a): How many unique countries per continent.
library(dplyr)
unique_countries <- select(df, country, continent) %>%
  distinct() %>%
  group_by(continent) %>%
  summarise(unique_countries = n())

# Question 1. (b): Which European nation had the lowest GDP per capita in a given year?
lowest_gdp_europe <- df %>%
  filter(continent == "Europe") %>%
  group_by(year) %>%
  select(country, year, gdpPerc) %>%
  arrange(gdpPerc) %>%
  slice(1)

print(lowest_gdp_europe)

# Question 1. (c): According to the data available, what was the average life expectancy across each continent in a given year?
avg_life_exp <- df %>%
	aggregate(lifeExp ~ continent + year, data = df, FUN = mean)

# Question 1. (d): What 5 countries have the highest total GDP over all years combined?
gdp_df <- df %>%
  mutate(total_gdp = gdpPerc * pop)
top_5_countries <- aggregate(total_gdp ~ country, data = gdp_df, FUN = sum) %>%
  arrange(desc(total_gdp)) %>%
  head(5)

	
# Question 1. (e): What countries and years had life expectancies of at least 80 years?
high_life_exp <- df %>%
  filter(lifeExp >= 80) %>%
  select(country, year, lifeExp)

# Question 1. (f): What 10 countries have the strongest correlation (in either direction) between life expectancy and per capita GDP?
mutate(gdp_df, corr = lifeExp/gdpPerc))
top_10_corr <- aggregate(corr ~ country, data = gdp_df, FUN = function(x) cor(x, use = "complete.obs")) %>%
  arrange(desc(abs(corr))) %>%
  head(10)

# Question 1. (h): Which three countries have had the most consistent population estimates (i.e. lowest standard deviation) across the years of available data?
consistent_pop <- aggregate(pop ~ country, data = df, FUN = sd) %>%
  arrange(pop) %>%
  head(3)

# Question 1. (i): Excluding records from a given year, which observations indicate that the population of a country has decreased from the previous year and the life expectancy has increased?
pop_life_change <- df %>%
  arrange(country, year) %>%
  mutate(pop_change = pop - lag(pop),
	 lifeExp_change = lifeExp - lag(lifeExp)) %>%
  filter(pop_change < 0 & lifeExp_change > 0) %>%
  select(country, year, pop, lifeExp)

print(pop_life_change)

# 2. Read the data file and show the first 4 record of the file.
# 3. Read the data file and show the last 4 record of the file.
# 4. Find the coorelation between Quantity_in_stock and Exp_date.
# 5. Plot the bar graph for the Sales with year of manufacturing.
# 6. Find the company having more than one type of medicine.
# 7. Find the type of Medicine available.
# 8. Which medicines are expiring? Show by box plots.
# 9. Find the average stock in the store.
# 10. Draw the regression line between Manufacturing year and

# Create a database file “DataSet.csv” that contains 10 records of medicine with attribute : MedID, Med_Name, Company, Manf_year, Exp_date, Quantity_in_stock, Sales.

df <- data.frame(
  medid = 1:10,
  med_name = c("meda", "medb", "medc", "medd", "mede", "medf", "medg", "medh", "medi", "medj"),
  company = c("comp1", "comp2", "comp1", "comp3", "comp2", "comp4", "comp3", "comp1", "comp4", "comp2"),
  manf_year = c(2018, 2019, 2018, 2020, 2019, 2021, 2020, 2018, 2021, 2019),
  exp_date = as.date(c("2023-12-31", "2024-06-30", "2023-11-30", "2025-01-31", "2024-05-31", 
		       "2026-12-31", "2025-03-31", "2023-10-31", "2026-11-30", "2024-07-31"), format="%y-%m-%d"),
  quantity_in_stock = c(100, 150, 200, 120, 180, 160, 140, 130, 170, 110),
  sales = c(5000, 7000, 6000, 8000, 7500, 9000, 8500, 6500, 9500, 7200)
)

# save as CSV
write.csv(df, "DataSet.csv", row.names = FALSE)

# Question 2. (a): Read the data file and show the first 4 record of the file.
data <- read.csv("DataSet.csv")
head(data, 4)

# Question 2. (c): Find the coorelation between Quantity_in_stock and Exp_date.
data$Exp_date_numeric <- as.numeric(data$Exp_date)
data <- na.omit(data)
correlation <- cor(data$Quantity_in_stock, data$Exp_date_numeric)

# Question 2. (d): Plot the bar graph for the Sales with year of manufacturing.
library(ggplot2)
ggplot(data, aes(x = factor(Manf_year), y = Sales)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Sales by Year of Manufacturing", x = "Year of Manufacturing", y = "Sales")
# Question 2. (e): Find the company having more than one type of medicine.
company_medicine <- aggregate(Med_Name ~ Company, data = data, FUN = function(x) length(unique(x)))

Question 2. (f): Find the type of Medicine available.
medicine_types <- unique(data$Med_Name)
print(medicine_types)

# Question 2. (g): Which medicines are expiring? Show by box plots.
expiring_medicines <- data[data$Exp_date < Sys.Date(), ]
ggplot(expiring_medicines, aes(x = Med_Name, y = Exp_date)) +
  geom_boxplot(fill = "orange") +
  labs(title = "Expiring Medicines", x = "Medicine Name", y = "Expiration Date")

# Question 2. (h): Find the average stock in the store.
average_stock <- mean(data$Quantity_in_stock)
average_stock_per_med <- aggregate(Quantity_in_stock ~ Med_Name, data = data, FUN = mean)

# Question 2. (i): Draw the regression line between Manufacturing year and Sales.
ggplot(data, aes(x = Manf_year, y = Sales)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "Regression Line between Manufacturing Year and Sales", x = "Manufacturing Year", y = "Sales")

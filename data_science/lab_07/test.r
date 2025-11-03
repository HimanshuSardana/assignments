df <- data.frame(
        country = rep(c(
                "India", "USA", "China", "Brazil", "UK", "Germany", "France", "Italy", "Canada", "Australia",
                "Japan", "South Korea", "Mexico", "South Africa", "Russia",
                "Spain", "Netherlands", "Sweden", "Norway", "Denmark", "Finland", "Poland", "Portugal",
                "Argentina", "Chile", "Colombia", "New Zealand", "Thailand", "Vietnam", "Philippines"
        ), each = 2),
        continent = rep(c(
                "Asia", "North America", "Asia", "South America", "Europe", "Europe", "Europe", "Europe", "North America", "Oceania",
                "Asia", "Asia", "North America", "Africa", "Europe",
                "Europe", "Europe", "Europe", "Europe", "Europe", "Europe", "Europe", "Europe",
                "South America", "South America", "South America", "Oceania", "Asia", "Asia", "Asia"
        ), each = 2),
        year = rep(2000:2014, times = 2),
        lifeExp = runif(60, 60, 85),
        pop = sample(1e6:1.4e9, 60, replace = TRUE),
        # gdpPerc = sample(0:100, 60, replace = TRUE)
        gdpPerc = sample(3000:60000, 60, replace = TRUE)
)

library(dplyr)
df <- mutate(df, gdpCorr = cor(gdpPerc, lifeExp))
df <- group_by(df, country) %>%
        arrange(desc(abs(gdpCorr))) %>%
        slice(1)
# df <- arrange(df, desc(abs(gdpCorr)))
print(tail(df, 10))

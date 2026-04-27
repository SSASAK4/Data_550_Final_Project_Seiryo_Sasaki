library(here)
library(dplyr)

here::i_am("code/00_data_prep.R")

data <- read.csv("data/country_data.csv", header = TRUE)

subset_data <- data %>%
  select(name, region, gdp, life_expectancy_male, life_expectancy_female,
         unemployment, homicide_rate, iso2, capital, gdp_growth,
         population, pop_density, gdp_per_capita, co2_emissions, tourists) %>%
  na.omit() %>%
  mutate(region_group = case_when(
    region %in% c("South America", "Central America", "Northern America", "Caribbean") ~ "Americas",
    region %in% c("Southern Europe", "Western Europe", "Eastern Europe", "Northern Europe") ~ "Europe",
    region %in% c("Southern Asia", "Western Asia", "South-Eastern Asia", "Eastern Asia", "Central Asia") ~ "Asia",
    region %in% c("Northern Africa", "Middle Africa", "Western Africa", "Southern Africa", "Eastern Africa") ~ "Africa",
    region %in% c("Oceania", "Melanesia", "Micronesia", "Polynesia") ~ "Oceania",
    TRUE ~ region
  ))

saveRDS(subset_data, "output/subset_data.rds")

library(gtsummary)
library(dplyr)
library(here)

here::i_am("code/01_table_one.R")

subset_data <- readRDS(here("output", "subset_data.rds"))

table_one <- subset_data %>%
  select(gdp, life_expectancy_male, life_expectancy_female,
         unemployment, population, pop_density,
         gdp_per_capita, co2_emissions, region_group) %>%
  tbl_summary(by = region_group,
              label = list(
                gdp ~ "Total GDP",
                life_expectancy_male ~ "Male Life Expectancy",
                life_expectancy_female ~ "Female Life Expectancy",
                unemployment ~ "Unemployment Rate (%)",
                population ~ "Total Population",
                pop_density ~ "Population Density",
                gdp_per_capita ~ "GDP per Capita",
                co2_emissions ~ "CO2 Emissions")) %>%
  add_overall() %>%
  add_p()

saveRDS(table_one, here("output", "table_one.rds"))
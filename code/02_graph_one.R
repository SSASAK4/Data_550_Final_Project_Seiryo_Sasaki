library(ggplot2)
library(dplyr)
library(here)

here::i_am("code/02_graph_one.R")

subset_data <- readRDS(here("output", "subset_data.rds"))

region_Africa <- subset_data %>%
  filter(region_group == "Africa")

p <- ggplot(region_Africa, aes(x = reorder(name, +population), y = population)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  theme_minimal() +
  labs(
    title = "Population across Africa",
    subtitle = paste("Analysis of", nrow(region_Africa), "countries"),
    x = "Country",
    y = "Population"
  )

ggsave(here("output", "graph_one.png"), plot = p)
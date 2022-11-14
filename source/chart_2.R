# Finding the top ten countries that emit the most ocean plastic
# Load packages
library(ggplot2)
library(dplyr)
library(tidyverse)

# Load data
ocean_waste <- read.csv(
  "https://raw.githubusercontent.com/info201b-au2022/project-group-7-BC/main/data/plastic-pollution.csv", 
  stringsAsFactors = FALSE
  )

# Finding the top ten countries by amount of plastic waste emitted to ocean
top_10 <- ocean_waste %>%
  top_n(10, wt = Mismanaged.plastic.waste.to.ocean.per.capita..kg.per.year.) %>%
  arrange(Mismanaged.plastic.waste.to.ocean.per.capita..kg.per.year.) %>%
  rename(Country = Entity) %>%
  rename(Waste = Mismanaged.plastic.waste.to.ocean.per.capita..kg.per.year.)

# Making column chart
chart <- ggplot(top_10) + 
  geom_col(
    mapping = aes(x = Country, y = Waste),
    color = "black",
    fill = "red",
    alpha = 0.7,
  ) +
  coord_flip()

# Adding labels to the chart
chart <- chart + labs(
  title = "Top Ten Countries by Plastic Waste Emission to Ocean",
  subtitle = "Mismanaged plastic waste to the ocean per capita",
  x = "Country",
  y = "Plastic Waste per Capita (kg/year)",
)




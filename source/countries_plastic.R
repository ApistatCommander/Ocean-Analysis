library(ggplot2)
library(dplyr)
library(tidyr)
ocean_waste <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-group-7-BC/main/data/plastic-pollution.csv", stringsAsFactors = FALSE)

top_10 <- ocean_waste %>%
  top_n(10, wt = Mismanaged.plastic.waste.to.ocean.per.capita..kg.per.year.) %>%
  arrange(Mismanaged.plastic.waste.to.ocean.per.capita..kg.per.year.) %>%
  rename(Country = Entity) %>%
  rename(Plastic_Waste_To_Ocean = Mismanaged.plastic.waste.to.ocean.per.capita..kg.per.year.)

ggplot(top_10) + 
  geom_col(mapping = aes(x = Country, y = Plastic_Waste_To_Ocean)) +
  coord_flip() +
  labs(
    title = "Countries That Emit the Most Plastic Waste to Ocean",
    x = "Country",
    y = "Plastic Waste per Capita (kg/year)"
  )

world <- map_data("world")
ggplot(world) +
  geom_polygon(
    mapping = aes(x = long, y = lat, group = group),
    color = "white",
    size = .2
  ) 
    


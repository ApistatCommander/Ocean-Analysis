library(ggplot2)
library(dplyr)

data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-group-7-BC/main/data/common-ocean-waste.csv")

data <- data %>%
  mutate(prop = round(Number_of_items / sum(data$Number_of_items) *100)) %>%
  mutate(ypos = cumsum(prop) - 0.5*prop)

chart <- ggplot(data, aes(x="", y = Number_of_items, fill = Characteristic)) +
  geom_bar(stat = "identity", width = 0.5, color = 1) + 
  coord_polar("y", start=0) +
  geom_text(aes(label = paste0(prop, "%")),
            position = position_stack(vjust = 0.5),
            size = 3,
            color = "white") +
  labs(
    title = "Most common items found on coastlines in 2020",
    caption = "Total waste items collected: 3,548,691",
    subtitle = "These items were collected during the International Coastal Ocean Cleanup in 2020"
  ) +
  theme_void()

  
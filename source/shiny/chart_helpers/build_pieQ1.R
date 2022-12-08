library(plotly)
library(tidyverse)

build_pieQ1 <- function(data, country) {
  country <- tolower(country)
  data <- data %>%
    filter(Country_Name == country)
  
  #values

  plot <- plot_ly(data,
                  labels = colnames(data)[3:4],
                  values = as.numeric(as.vector(data[1, 3:4])),
                  type = 'pie'
  ) %>% layout(title = "Final Destination of Exported Trash")
  
  return(plot)
}
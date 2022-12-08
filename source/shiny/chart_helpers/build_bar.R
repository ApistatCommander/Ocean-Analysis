library(plotly)
library(tidyverse)

build_bar <- function(data, xval = "") {
  xval <- tolower(xval)
  data <- data %>%
    filter(str_detect(xval, Country_Name))
  
  plot <- plot_ly(data,
                  x = ~Country_Name,
                  y = ~Tons_Exported,
                  type = 'bar',
                  name = "Total Exported"
  ) %>% add_trace(
    y = ~Ends_in_the_ocean,
    name = "Total in Ocean"
  ) %>% add_trace(
    y = ~Ends_in_the_beach,
    name = "Total on Beach"
  ) %>% layout(title = "Trash Exportation by Country (2021)",
               yaxis = list(title = "Trash (tons)"),
               xaxis = list(title = "Country"))
  
  return(plot)
    
}
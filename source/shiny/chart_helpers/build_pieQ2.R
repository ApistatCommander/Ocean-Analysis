library(plotly)
library(tidyverse)

build_pieQ2 <- function(data, local) {
  
  #find all the location instances that match values in local
  local <- tolower(local)
  loc <- as.character(local[1])
  data1 <- data %>%
    filter(location == loc)
  
  #local
  #plot <- plot_ly(data,
                  #labels = data[, 1],
                  #values = ~location,
                  #name = local,
                  #type = 'pie')

  plot1 <- plot_ly()
  
  plot1 <- plot1 %>% add_pie(data1,
                             labels = data1[, 1],
                             name = loc,
                             domain = list(row = 0, column = 1))
  
  length <-length(local)
  if(length == 1) {
    plot1 <- plot1 %>% layout(title = paste0("Microplastics Found in San ",
                                             "Francisco Bay by Category"))
    return(plot1)
  } else if (length == 2){
    local <- local[2]
  } else {
    local <- local[2:length]
  }
  ord <- 1
  
  #plot <- plot_ly()
  
  while(length(local) >= 2) {
    loc <- as.character(local[1])
    ord <- ord + 1
    if (ord == 2) {
      pos <-  list(row = 1, column = 0)
    } else if (ord == 3) {
      pos <- list(row = 1, column = 2)
    } else if (ord == 4) {
      pos <- list(row = 1, column = 1)
    } else {
      pos <- list(row = 0, column = 0)
    }
    
    datan <- data %>%
      filter(location == loc)
    
    plot1 <- plot1 %>% add_pie(datan,
                             labels = datan[, 1],
                             name = loc,
                             domain = pos)
    if (length == 2) {
      local <- local[2]
    } else {
    length <- length - 1 
    local <- local[2:length]
    }
  }
  
  loc <- as.character(local)
  
  data2 <- data %>%
    filter(location == loc)
  
  plot1 <- plot1 %>% add_pie(data2,
                           labels = data2[, 1],
                           name = loc, 
                           domain = list(row = 0, column = 2))
  
  plot1 <- plot1 %>% layout(grid = list(rows = 2, columns = 3, xgap = 0.4,
                                        ygap = 0.25),
                            xaxis = list(showgrid = FALSE, zeroline = FALSE, 
                                         showticklabels = FALSE),
                            yaxis = list(showgrid = FALSE, zeroline = FALSE, 
                                         showticklabels = FALSE),
                            title = paste0("Microplastics Found in San ",
                                           "Francisco Bay by Category"))
  
  return(plot1)
}
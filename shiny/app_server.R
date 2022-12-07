#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

server <- function(input, output) {
# ----- [Tab 2 - Charts] ----- #
  # Outputs a pie chart that answers RQ 3
  output$piechart <- renderPlotly({
    common_trash <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-group-7-BC/main/data/common-ocean-waste.csv")
    
    trash_pie <- common_trash %>%
      mutate(prop = round(
        Number_of_items / sum(common_trash$Number_of_items) * 100
      )) %>%
      rename(
        Proportion = prop,
        Type_of_trash = Characteristic
      )
    
    pie1 <- plot_ly(
      trash_pie,
      labels = ~Type_of_trash,
      values = ~Number_of_items,
      type = "pie",
      marker = list(colors = colors,
                    line = list(color = '#FFFFFF', width = 1))
    )
    
    pie1 <- pie1 %>%
      layout(
        title = "Most Common Items Found On Coastlines (2020)",
        legend = list(title = list(text = "<b> Type of Trash </b>"))
      )
    
    pie2 <- plot_ly(
      trash_pie,
      labels = ~Type_of_trash,
      values = ~Number_of_items,
      type = "pie",
      textposition = 'inside',
      textinfo = 'label+percent',
      marker = list(colors = colors,
                    line = list(color = '#FFFFFF', width = 1)),
      showlegend = FALSE)
    
    pie2 <- pie2 %>%
      layout(title = "Most Common Items Found On Coastlines (2020)")
    
    if(input$show == 1) {
      return(pie1)
    } else {
      return(pie2)
    }
  })
  
  # Outputs a barplot that answers RQ 3
  output$barplot <- renderPlotly({
    countries_df <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-group-7-BC/main/data/plastic-pollution.csv")
    
    countries_df <- countries_df %>%
      rename(
        Mismanaged_Plastic = Mismanaged.plastic.waste.to.ocean.per.capita..kg.per.year.,
        Country = Entity
      )
    
    plot_data_max10 <- countries_df %>%
      top_n(10, Mismanaged_Plastic)
    
    plot_data_max10$Country <- with(
      plot_data_max10,
      reorder(Country, Mismanaged_Plastic)
    )
    
    plot_data_min10 <- countries_df %>%
      filter(Mismanaged_Plastic != 0) %>%
      top_n(-10, Mismanaged_Plastic)
    
    plot_data_min10$Country <- with(
      plot_data_min10,
      reorder(Country, -Mismanaged_Plastic)
    )
    
    plot_input1 <- ggplot(
      plot_data_max10,
      aes(
        x = Country,
        y = Mismanaged_Plastic
      )
    ) +
      geom_col(color = "black", fill = "red", alpha = 0.7) +
      ggtitle(
        "Top Ten Countries by Plastic Waste Emission to Ocean (2019)"
      ) +
      ylab("Plastic Waste per Capita (kg/year)") +
      coord_flip()
    
    plot_input2 <- ggplot(
      plot_data_min10,
      aes(
        x = Country,
        y = Mismanaged_Plastic
      )
    ) +
      geom_col(color = "black", fill = "red", alpha = 0.7) +
      coord_flip() +
      scale_y_continuous(labels = scales::comma) +
      ggtitle(
        "Countries with the Least Plastic Waste Emission to Ocean (2019)"
      ) +
      ylab("Plastic Waste per Capita (kg/year)")
    
    
    if (input$max_min == 1) {
      plot <- ggplotly(plot_input1)
    } else {
      plot <- ggplotly(plot_input2) %>%
        layout(
          margin = list(l = 50, r = 50, b = 100, t = 50),
          annotations = list(
            x = 1, y = -0.3, text =
              "Note: Excludes countries with zero emissions.",
            xref = "paper", yref = "paper", showarrow = F,
            xanchor = "right", yanchor = "auto", xshift = 0, yshift = 0,
            font = list(size = 10)
          )
        )
    }
    return(plot)
  })
}



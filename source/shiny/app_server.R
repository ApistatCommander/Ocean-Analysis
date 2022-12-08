#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)

# ----- [Tab 1 - Data Wrangling] ----- #
source("chart_helpers/build_pieQ2.R")
source("chart_helpers/build_pieQ1.R")
source("chart_helpers/build_bar.R")

rq1_df <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-group-7-BC/main/data/Tracking_Marine_Litter_data.CSV",
                   stringsAsFactors = FALSE)

rq2_df <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-group-7-BC/main/data/Microplastic_in_SF_data.csv",
                   stringsAsFactors = FALSE)

rq1_df <- rq1_df %>%
  rename(Country_Name = Country.Name, Tons_Exported = Tons.Exported,
         Ends_in_the_ocean = Ends.in.the.Ocean, 
         Ends_in_the_beach = Ends.in.the.beach)

rq1_df$Country_Name <- tolower(rq1_df$Country_Name)


rq2_df[, 9:11] <- str_split_fixed(rq2_df$MatrixName, ",", n =3)

rq2_df <- rq2_df %>%
  select(PlasticType, MorphologicalCategory, V9) %>%
  rename(location = V9)

category <- rq2_df %>%
  select(MorphologicalCategory, location) %>%
  filter(MorphologicalCategory != "")

server <- function(input, output) {
# ----- [Tab 1 - Charts] ----- #
  
  output$stackedBarQ1 <- renderPlotly({
    plot <- build_bar(rq1_df, input$q1Bar)
    return(plot)
  })
  
  # RQ1 Pie
  output$pieQ1 <- renderPlotly({
    plot <- build_pieQ1(rq1_df, input$q1Pie)
    return(plot)
  })
  
  # RQ2 Pie 2
  output$pieQ2 <- renderPlotly({
    plot <- build_pieQ2(category, input$q2Pie)
    return(plot)
  })
  
# ----- [Tab 2 - Charts] ----- #
  
  # Outputs a pie chart that answers RQ 3
  output$piechart <- renderPlotly({
    
    # Loading data
    common_trash <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-group-7-BC/main/data/common-ocean-waste.csv")
    
    # Wrangles data 
    trash_pie <- common_trash %>%
      rename(
        Type_of_trash = Characteristic
      )
    
    # Creates normal aesthetic for piechart
    pie1 <- plot_ly(
      trash_pie,
      labels = ~Type_of_trash,
      values = ~Number_of_items,
      type = "pie",
      marker = list(colors = colors,
                    line = list(color = '#FFFFFF', width = 1))
    )
    
    # Adding labels to the normal piechart
    pie1 <- pie1 %>%
      layout(
        title = "Most Common Items Found On Coastlines (2020)",
        legend = list(title = list(text = "<b> Type of Trash </b>"))
      )
    
    # Creates simple aesthetic for piechart
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
    
    # Adds labels for simple piechart
    pie2 <- pie2 %>%
      layout(title = "Most Common Items Found On Coastlines (2020)")
    
    # Outputs piechart based on user input via radiobutton widget
    if(input$show == 1) {
      return(pie1)
    } else {
      return(pie2)
    }
  })
  
  # Outputs a barplot that answers RQ 3
  output$barplot <- renderPlotly({
    
    # Loading data
    countries_df <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-group-7-BC/main/data/plastic-pollution.csv")
    
    # Wrangles data
    countries_df <- countries_df %>%
      rename(
        Mismanaged_Plastic = Mismanaged.plastic.waste.to.ocean.per.capita..kg.per.year.,
        Country = Entity
      )
    
    # Selects top ten countries by mismanaged plastic
    plot_data_max10 <- countries_df %>%
      top_n(10, Mismanaged_Plastic)
    
    # Reorders in descending order by mismanaged plastic
    plot_data_max10$Country <- with(
      plot_data_max10,
      reorder(Country, Mismanaged_Plastic)
    )
    
    # Selects top ten countries by least emitted plastic to ocean,
    # excluding countries with zero emissions
    plot_data_min10 <- countries_df %>%
      filter(Mismanaged_Plastic != 0) %>%
      top_n(-10, Mismanaged_Plastic)
    
    # Reorders in ascending order
    plot_data_min10$Country <- with(
      plot_data_min10,
      reorder(Country, -Mismanaged_Plastic)
    )
    
    # Creates chart by top ten countries with MOST plastic emissions
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
    
    # Creates chart by top ten countries with LEAST plastic emissions
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
    
    # Outputs chart based on user's input via select drop down
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
  
# ----- [Tab 3 - Chart] ----- #
  
  #Particles of Plastic
  
  output$fish_graph <- renderPlotly({
    
    fish_df <- read.csv(url("https://raw.githubusercontent.com/mssavoca/Fish-plastic_meta-analysis/master/Plastics%20ingestion%20records%20fish%20master_final_SciAd.csv"))
    
    fish_df_redux <- fish_df %>%
      select(Common.name, Mean.num.particles.per.indv) %>%
      filter(Common.name != "")
    
    fish_df_redux <- fish_df_redux %>%
      rename(
        fish_species = Common.name,
        avg_number_of_plastic_particles = Mean.num.particles.per.indv
      )
    
    # top_fish_part_plastic <- fish_df_redux %>%
    #   top_n(20, avg_number_of_plastic_particles)
    top_fish_part_plastic <- fish_df_redux %>%
      top_n(input$slider, avg_number_of_plastic_particles)
    #reorder
    top_fish_part_plastic$Common.name <-with(
      top_fish_part_plastic,
      reorder(fish_species, avg_number_of_plastic_particles)
    )
      
    fish_particle_bar <- plot_ly(
      data = top_fish_part_plastic,
      x = ~avg_number_of_plastic_particles,
      y = ~fish_species,
      name = "Top 20 Fish With the Highest Average Number of Plastic Particles", 
      type = "bar"
    ) %>%
      layout(title = "Top 20 Fish With the Highest Average Number of Plastic Particles")
    
    fish_particle_bar
    
    #Proportion containing Plastic 
    
    fish_df_redux_proportions <- fish_df %>%
      select(Common.name, Prop.w.plastic)%>%
      filter(Common.name != "")
    
    fish_df_redux_proportions <- fish_df_redux_proportions %>%
      rename(
        fish_species = Common.name,
        proportion_of_fish_with_plastic = Prop.w.plastic
      )
    
    top_fish_prop_plastic <- fish_df_redux_proportions %>%
      filter(proportion_of_fish_with_plastic > 0.05) %>%
      head(input$slider)
    
    fish_prop_bar <- plot_ly(
      data = top_fish_prop_plastic, 
      x= ~proportion_of_fish_with_plastic,
      y = ~fish_species,
      name = "Fish with the Highest Proportion of Plastic in them",
      type = "bar"
    )%>%
      layout(title = "Varying Proportions of Plastic within Fish")
    
    
    #fish_prop_bar
    #radio button options
    if(input$plas_show == 1){
      return(fish_particle_bar)
    }else if(input$plas_show == 2){
      return(fish_prop_bar)
    }
  })
}



# tab_panel_chart3

library(shiny)
fish_plastic_options <- radioButtons(
  inputId = "plas_show",
  label = h5("Pick Plastic Options:"),
  choices = list(
    "Plastic Particles" = 1,
    "Plastic Proportion" = 2
  )
)

tab_panel_chart3 <-tabPanel(
  "Chart 3",
  titlePanel("Plastic in Fish"),
  hr(),
  h3("How much plastic is found in fish?"),
  br(),
  sidebarLayout(
    position = "left",
    sidebarPanel(
      fish_plastic_options
    ),
    mainPanel(
      plotlyOutput("fish_graph")
    )
  ),
  p(strong("Caption: "), "Hover Information reveals the fish species and either
    the average number of plastic particles in them or the proportion of the
    in which plastic is inside them."),
  h4(strong("Summary: ")),
  p("The chart shows that the Asian Sea Bass has the greatest amount
    of plastic particles within them. The other chart shows thet the proportion
    of fish in the population contains plastic within them. The chart shows
    that in many populations, the entire population of that species contains
    plastics.")
  
)

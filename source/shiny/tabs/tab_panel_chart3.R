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
      fish_plastic_options,
      slider <- sliderInput("slider", 
                            label = h5("Show Number of Fish Specie"), 
                            min = 3, 
                            max = 20, 
                            value = 20
                            )
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
    of plastic particles within them. It is followed by the whale shark. 
    The other chart shows that varying portions of the population contain 
    plastic, but some species are more likely to contain plastic. For example,
    when looking at the whale sharks, three-lined tongue sole, great lizardheard,
    silver silago, and gilthead bream, the proportion that contained plastic was
      1.0, which suggests that the entire population of those species contains
      plastic. Further, for species like the bartail flathead and the European
      pilchard, the proportion found to contain plastic was greater than 0.5, 
      which suggests that a majority of them contains plastic. Some species,
      like the blackmouth catshark, had a proportion less than 0.5. While
      it shows that most did not contain plastic, the data suggests that
      we need to reduce marine plastics because as more plastics enter the 
      ecosystem, more fish will inevitably ingest it, and this can have
      devastating effects on many fish populations.")
)

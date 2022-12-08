# tab_panel_summary

library(shiny)

tab_panel_summary <-tabPanel(
    "Summary",
    titlePanel("Summary Takeaways"),
    hr(),
    h3("There are three main takeways from our analysis:"),
    tags$ol(
      tags$li("The majority of microplastics found are fibers, and the majority
              of trash ends up on beaches."),
      tags$li("The ten countries that emit the most plastic to the ocean are 
              littoral (relating to or situated on the shore of the sea)."),
      tags$li("The plastic that goes into the ocean affects many fish species 
              since the plastics end up in their bodies. As a result, this can 
              affect other fish species and even us."),
    ),
    h3("What now?"),
    p("")
)


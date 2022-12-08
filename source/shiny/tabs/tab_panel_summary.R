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
    p("These three main takeaways remind us that it is vital to understand what 
      is happening in our world’s oceans. We must take care of our oceans and 
      sustain the health of our planet, animals, and humanity. We need to start 
      finding better ways to manage the trash we have already created. We need 
      to care about the freshwater and saltwater ecosystems that are being 
      affected by all this trash. We need to care about the future generations 
      that are going to have to deal with the actions of the people that came 
      before them. We need to advocate for change and environmental justice.")
)


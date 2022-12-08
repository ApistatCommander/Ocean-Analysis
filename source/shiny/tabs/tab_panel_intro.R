# tab_panel_intro

library(shiny)

tab_panel_intro <-tabPanel(
    "Introduction",
    titlePanel("Introduction"),
    hr(),
    p("71% of the world is water and oceans contain 92% of that water. Thus it 
      is vital to understand what is happening in that water. Just like 
      understanding and fighting pollution in our atmosphere is important, 
      understanding what is happening in our hydrosphere (the ocean) is just 
      as important. We often don’t think about our trash after we throw it away.
      Out of sight, out of mind. However, a lot of trash ends up in the ocean. 
      With stories of micro plastics being found in the bellies of fish, this is
      not a reality we can ignore any longer. With being in Seattle and having 
      the puget sound just a couple blocks away, how much of these microplastics
      are ending up in our backyard? Sure, recycling is one way we try to reduce
      plastic waste, but how effective is that with keeping plastic out of the 
      ocean? If we want our oceans to not become a dump yard, then we need to 
      understand where this plastic is coming from."),
    h4(strong("We will try answer questions from the following topics")),
    p("Trash exportation"),
    p("Microplastics in the water and wildlife"),
    p("Trash on beaches"),
    
       tags$figure(
      align = "center",
      tags$img(
        src = "TOC_Entangled_Turtle_by_Francis_Perez1.jpg",
        width = 500,
        alt = "A sea turtle entangled in a ghost net"
      ),
      tags$figcaption("Entangled Turtle by Francis Perez")
    )
)

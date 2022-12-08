# tab_panel_intro

library(shiny)

tab_panel_intro <-tabPanel(
    "Introduction",
    p("This is the introduction."),
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

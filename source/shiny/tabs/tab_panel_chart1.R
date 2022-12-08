# tab_panel_chart1

library(shiny)

tab_panel_chart1 <-tabPanel(
    "Chart 1",
    
    titlePanel(
      paste0("Interactive Charts: Final Destination of Exported Trash & Types ", 
             "of Microplastics found in San Francisco")),
    hr(),
    h3("Where does exported trash end up?"),
    br(),
    
    sidebarLayout(
      #postion = "left",
      sidebarPanel (
        textInput(
          "q1Bar",
          label = "Input Desired Countries (seperated by commas)",
          value = "United states of america, China, Russia, Japan"
        )
      ),
      mainPanel(
        plotlyOutput("stackedBarQ1"),
        p(strong("Caption: "), "Displays the amount of trash of each inputed 
          country exported and how much (in tons) trash ends up in the ocean
          or on the beach"),
        h4(strong("Summary")),
        p('This chart helps answer the first research question:"Where does the 
          majority of the plastic in the ocean end up and if that is near a 
          land mass, how does that affect the community living there?" This
          chart allows us to compare countries on where the exported trash of
          desired countrys go.')
      )
    ),
    br(),
    
    sidebarLayout(
      #postion = "left",
      sidebarPanel(
        textInput(
          "q1Pie",
          label = "Input Desired Country", 
          value = "United states of america"
        )
      ),
      mainPanel(
        plotlyOutput("pieQ1"),
        p(strong("Caption: "), "Displays the proportion of exported trash from 
          desired country that ends up in the ocean or ends up in the beach"),
        p(strong("Summary")),
        p("This chart also helps answer the first research question. This chart
           gives us another way of comparing the amount of trash that ends up 
          in the ocean vs the amount of trash that ends up on the beach."),
        p("The data from this chart and the one above should help policy makers 
        better understand where the exported trash of their country ends up. 
        Policy makers can also better understand where other countries' trash 
        goes in order to impose teriffs or other countermeasures to fight trash 
        pollution. This data can also help activists with knowing which country 
        they need to cocentrate their efforts.")
      )
    ),
    hr(),
    h3("What kind of microplastics are becoming prevelent in our waters?"),
    br(),
    
    sidebarLayout(
      #postion = "left",
      sidebarPanel(
        checkboxGroupInput(
          "q2Pie",
          label = "Select Desired Location Type",
          choices = list("Blankwater", "Effluent", "Runoff", "Samplewater",
                         "Sediment", "Tissue"),
          selected = "Samplewater"
        )
      ),
      mainPanel(
        plotlyOutput("pieQ2"),
        p(strong("Caption: "), "Displays the proportions of microplastics found
          in San Francisco bay by desired location."),
        p(strong("Summary")),
        p('This chart helps us answer the second research question "What types 
        of microplastics are prevalent? How is that affecting the human body?"
        This chart also helps us determine what types microplastics are common 
        in certain locations.'),
        p("The data from this chart should help policy makers figure out what 
          types of microplastics area the most prevelent and have the 
          knowledge to build legistlation to help prevent these types of 
          plastics from entering our waters. The data should also help 
          scientists and engineers design devices that filter and prevent these
          types of microplastics from entering our waters.")
      )
    )
)


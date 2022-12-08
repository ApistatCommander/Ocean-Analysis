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
        plotlyOutput("stackedBarQ1")
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
        plotlyOutput("pieQ1")
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
        plotlyOutput("pieQ2")
      )
    )
)


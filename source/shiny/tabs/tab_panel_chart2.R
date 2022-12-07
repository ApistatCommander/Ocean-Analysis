# tab_panel_chart2

library(shiny)

# Creates a radio buttons widget 
show_pie_chart <- radioButtons(
  inputId = "show",
  label = h5("Display Piechart Aesthetic:"),
  choices = list(
    "Normal (with legend)" = 1,
    "Simple (without legend)" = 2
  )
)

# Creates a select input widget 
show_max_min <- selectInput(
  inputId = "max_min",
  label = h5("Show Ten Countries with:"),
  choices = list(
    "the MOST Ocean Plastic Emissions" = 1,
    "the LEAST Ocean Plastic Emissions" = 2
  )
)

# Creates the tab
tab_panel_chart2 <-tabPanel(
  "Chart 2",
  titlePanel(
    "Interactive Charts: Common Trash & Countries' Plastic Waste Emissions"),
  hr(),
  h3("What are common waste items that end up on beaches and shorelines?"),
  br(),
  # Displays the pie chart section
  sidebarLayout(
    position = "left",
    sidebarPanel(
      show_pie_chart
    ),
    mainPanel(
      plotlyOutput("piechart"),
      p(strong("Caption: "), "Hover information displays the type of trash, 
        amount collected, and proportion percentage. ", strong("Note:"), "Other 
        trash refers to items that do not fall in a specific category."),
      h4(strong("Summary")),
      p("This chart answers the third research question: “What are common waste 
        items that end up on beaches and shorelines?” This chart shows the 
        proportions of the most common items found on coastlines that were 
        collected during the International Coastal Ocean Cleanup in 2020. 
        There were 3,548,691 items collected. The most common item found was 
        cigarette butts, with 27% of all the items collected. The least common 
        item found was glass beverage bottles, with 4% of all the items 
        collected."),
      p("This data should be used to influence policymakers to implement better 
        recycling and waste management practices at beaches and coastal 
        recreation areas, as well as in general. For example, there should be 
        specific smoking areas where people can utilize the space away from the 
        general public to smoke and discard their cigarette butts. There should 
        be trashcans, recycling, and compost bins distributed throughout the 
        areas for people to dispose of their waste in the respective bin easily.
        Policymakers should implement policies that will fine people who do not 
        dispose of their waste properly.")
    )
  ),
  hr(),
  h3("What top ten countries emit the most and least plastic waste?"),
  br(),
  # Displays the bar plot section
  sidebarLayout(
    position = "left",
    sidebarPanel(
      show_max_min
    ),
    mainPanel(
      plotlyOutput("barplot"),
      p(strong("Caption: "), "This chart shows the top ten countries by most and
        least mismanaged plastic waste to the ocean per capita in kilograms per 
        year."),
      h4(strong("Summary")),
      p("This chart answers the fourth research question: “What top ten 
        countries emit the most and least plastic waste?” This chart shows the 
        top ten countries that emit the most plastic waste to the ocean per 
        capita in kilograms per year. The ten countries (in descending order) 
        that emit the most plastic waste to the ocean: Philippines, Suriname, 
        Trinidad and Tobago, Saint Lucia, Malaysia, Guyana, Panama, Grenada, 
        Belize, and Jamaica. The country that emits the most waste per capita is 
        the Philippines, with over three kilograms (3.296 kg/yr) of mismanaged 
        plastic waste in the ocean per year. The country that emits the least 
        per capita (in the top ten) is Jamaica, with less than one kilogram 
        (0.792 kg/yr) of mismanaged plastic waste to the ocean per year. 
        The ten countries (in ascending order) that emit the least plastic waste
        emission to the ocean (excluding countries with zero emissions) are: 
        Saudi Arabia, Jordan, Somalia, Oman, Kazakhstan, Georgia, Poland, 
        Namibia, Bulgaria, and Australia. Saudia Arabia per capita emits 
        0.000088 kilograms per year of plastic to the ocean; Australia per 
        capita emits 0.0013 kilograms per year of plastic waste to the ocean."),
      p("These charts show the top ten countries that release the most plastic 
        waste to the ocean per capita in kilograms per year. These countries 
        should be held accountable for their plastic waste emissions to the 
        ocean. Policymakers in these countries should implement laws and 
        regulations to prevent these emissions so that the environment will be 
        cleaner and safer for everyone and marine animals. The organizations 
        and technology designers that focus on cleaning the ocean should be 
        brought to these countries to aid in cleaning up the plastic waste 
        emissions in the surrounding environment and ocean. The countries that 
        emit the most plastic should learn from the countries that emit the 
        least (including the countries that emit zero plastic waste) and how 
        those countries prevent their waste from entering the ocean.")
    )
  )
)

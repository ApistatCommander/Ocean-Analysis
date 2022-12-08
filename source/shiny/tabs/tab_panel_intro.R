# tab_panel_intro

library(shiny)

tab_panel_intro <-tabPanel(
    "Introduction",
    titlePanel("Introduction"),
    hr(),
    h3("Introduction"),
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
    
       tags$figure(
      align = "center",
      tags$img(
        src = "TOC_Entangled_Turtle_by_Francis_Perez1.jpg",
        width = 500,
        alt = "A sea turtle entangled in a ghost net"
      ),
      tags$figcaption("Entangled Turtle by Francis Perez")
    ),
    
    h3("Problem Domain"),
    h4("Framing the Problem Domain"),
    p("Our world is full of plastic. We depend on plastic for nearly everything. 
     Yet do we know what happens to that plastic after we throw it away? 
     According to IUCN, “at least 14 million tons of plastic end up in the ocean
     every year. Plastic debris is currently the most abundant type of litter in
     the ocean, making up 80% of all marine debris found from surface water to 
     deep-sea sediments.” Our oceans are becoming full of plastic. How is this 
     happening? Countries like the US and the UK export their trash to countries
     with less strict labor and dumping laws. Even though those laws are less 
     strict, trash often gets dumped or disposed of illegally. That leads to a 
     high likelihood of that plastic trash ending up in the ocean."),
    h4("Stakeholders"),
    p("These developed countries that ship their trash away would rather do that 
   then pay more to have it properly dealt with in their own country. These 
   countries that import this trash are often negatively affected by this. It 
   can damage the aesthetics of that country, driving away tourism. Pollution 
   from this waste can negatively affect the citizens that live near these dump 
   sites. People who work at the trash dump sites are often exploited due to the
   loose labor laws that are often in these countries."),
    h4("Human Values"),
    p("One solution that we came up with was recycling. Do recycling measures 
      actually work? Well according to the BBC, “The Philippines has just 
      shipped back tonnes of rubbish to Canada that it said was falsely labeled 
      as plastic recycling in 2013 and 2014.” Recycling has been instilled in 
      all of us as our part of fighting pollution and being good to the 
      environment. But what’s the good of us recycling if our own country is not
      going to do the same? Another solution was picking up trash at the beach. 
      Who doesn’t want their neighborhood beach to look nice and clean. Sure, 
      it's good to pick up trash at the beach, but who is going to pick up trash
      on the beaches of the countries that dump their trash on the beach or the 
      countries that have huge amounts of trash washed up on their beach."),
    p('Living in America, we often don’t think about where our trash goes after 
      throwing it away. Out of sight, out of mind. Most people are probably 
      unaware that our trash gets shipped off to other countries to be dealt 
      with. This line of thinking often allows people to be careless and litter 
      which often ends up in the ocean. According to IUCN, “the main sources of 
      plastic debris found in the ocean are land-based, coming from urban and 
      stormwater runoff, sewer overflows, littering, inadequate waste disposal 
      and management”. This ocean waste often negatively affects ocean 
      ecosystems, “the most visible impacts of plastic debris are the ingestion,
      suffocation, and entanglement of hundreds of marine species.”'),
    h4("Benefits and Harms"),
    p("Despite being harmful to the countries’ environment and residents, 
    importing waste from other countries does bring economic benefits for them.
    If countries stopped exporting their waste, then the countries that import 
    it will probably be negatively affected economically. The countries that 
    export waste might not also be prepared to deal with all this new waste and 
    the citizens of that country might become negatively affected. Also, because 
    our whole world has been built on the use of plastics, a new shift into a 
    plastic free life might economically harm a lot of people across the globe. 
    Plastic free products and a plastic free lifestyle is often more expensive 
    than one filled with plastic use."),
    p("We must find solutions for cleaning the plastic pollutants in the ocean 
    as well as prevent it entirely. According to the Center for Biological 
    Diversity,",' "Studies'," estimate there are now 15-51 trillion pieces of 
    plastic in the world's ", 'oceans." This is dangerous for the well-being of 
      the marine animals, humans, and the planet. Finding solutions and creating
      policies that will save the earth are necessary for our survival.'),
    h3("Research Questions"),
    tags$ol(
      tags$li("Where does the majority of the plastic in the ocean end up?"),
      tags$li("what types of microplastics are prevalent? How is that affecting 
      the human body?"),
      tags$li("What are common waste items that end up on beaches and 
              shorelines?"),
      tags$li("What top ten countries emit the most plastic waste?"),
      tags$li("What animals are affected by marine plastic?")
    ),
    h3("Data Analyzed"),
    p("See report for further details on each dataset"),
    tags$ol(
      tags$li("Tracking Marine Litter with a Global Ocean Model: Where Does it 
              Go? Where does it Come From?"),
      tags$li("Microplastic and Microparticle Data From Surface Water: San 
              Francisco Bay and Adjacent Sanctuaries"),
      tags$li("Most common items found during the International Coastal Ocean 
              Cleanup in 2020"),
      tags$li("Plastic Pollution - Plastic Emitted to Ocean per Capita"),
      tags$li("Plastic Ingestion by Marine Fish")
    ),
    h3("Key Findings"),
    tags$ol(
      # RQ1
      tags$li("China released the most trash onto beaches and India released 
              more trash into the ocean"),
      # RQ2
      tags$li("The most prevelent type of microplastic to be found in the San 
              Francisco bay were Fibers"),
      # RQ3
      tags$li("The most common waste item found on coastlines are cigarette 
              butts"),
      # RQ4
      tags$li("Top ten countries that emit the most plastic are the Philippines,
              Suriname, Trinidad and Tobago, Saint Lucia, Malaysia, Guyana,
              Panama, Grenada, Belize, and Jamaica."),
      # RQ5
      tags$li("The fish with by far the most particles of plastic on average was
              the Asian Sea Bass. Furthermore, for many species, such as whale 
              sharks, plastic was found in their entire population.")
    )
)

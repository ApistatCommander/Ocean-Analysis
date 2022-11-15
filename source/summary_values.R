library("dplyr")
library("ggplot2")

marine_litter <- read.csv( 
  "https://raw.githubusercontent.com/info201b-au2022/project-group-7-BC/main/data/Tracking_Marine_Litter_data.CSV",
  stringsAsFactors = FALSE
)

microplastiscs_SF <- read.csv(
  "https://raw.githubusercontent.com/info201b-au2022/project-group-7-BC/main/data/Microplastic_in_SF_data.csv",
  stringsAsFactors = FALSE
)
common_waste <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-group-7-BC/main/data/common-ocean-waste.csv")
by_country <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-group-7-BC/main/data/plastic-pollution.csv")

fish <- read.csv(url("https://raw.githubusercontent.com/mssavoca/Fish-plastic_meta-analysis/master/Plastics%20ingestion%20records%20fish%20master_final_SciAd.csv"))

marine_litter <- read.csv("Tracking_Marine_Litter_Data.csv")

#number of observations in marine litter
num_litter <- nrow(marine_litter)

#Highest country 
highest_country_in_ocean <- marine_litter %>%
  filter(Ends.in.the.Ocean == max(Ends.in.the.Ocean, na.rm=TRUE)) %>%
  pull(Country.Name)

#Most common plastic type 
most_plastic_type <- microplastiscs_SF %>%
  group_by(PlasticType) %>%
  summarise(Total = n()) %>%
  filter(Total == max(Total, na.rm=TRUE))%>%
pull(PlasticType)

#Fish with the most plastic per individual
fish_with_most_plastic_ind <- fish %>%
  select(Common.name, Mean.num.particles.per.indv, Habitat) %>%
  arrange(- Mean.num.particles.per.indv)%>%
  filter(Common.name != "", na.rm = TRUE)%>%
  filter(Mean.num.particles.per.indv == max(Mean.num.particles.per.indv, na.rm = TRUE)) %>%
  pull(Common.name)


#Most common items
top_item <- common_waste %>%
  filter(Number_of_items == max(Number_of_items)) %>%
  pull(Characteristic)

#Country with most mismanaged plastic waste ocean per capita
top_country <- by_country %>%
  filter(Mismanaged.plastic.waste.to.ocean.per.capita..kg.per.year. == max(Mismanaged.plastic.waste.to.ocean.per.capita..kg.per.year.)) %>%
  pull(Entity)
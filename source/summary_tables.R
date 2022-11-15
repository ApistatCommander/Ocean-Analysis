library(tidyverse)

# Loading Datasets

marine_litter <- read.csv( 
  "https://raw.githubusercontent.com/info201b-au2022/project-group-7-BC/main/data/Tracking_Marine_Litter_data.CSV",
  stringsAsFactors = FALSE
)

microplastiscs_SF <- read.csv(
  "https://raw.githubusercontent.com/info201b-au2022/project-group-7-BC/main/data/Microplastic_in_SF_data.csv",
  stringsAsFactors = FALSE
)

fish <- fish <- read.csv(url("https://raw.githubusercontent.com/mssavoca/Fish-plastic_meta-analysis/master/Plastics%20ingestion%20records%20fish%20master_final_SciAd.csv"))

common_waste <- read.csv(
  "https://raw.githubusercontent.com/info201b-au2022/project-group-7-BC/main/data/common-ocean-waste.csv",
  stringsAsFactors = FALSE
  )

by_country <- read.csv(
  "https://raw.githubusercontent.com/info201b-au2022/project-group-7-BC/main/data/plastic-pollution.csv",
  stringsAsFactors = FALSE
  )
# Summary Tables

# Top 10 countries with the highest amount of plastic (in Tons) each country 
# that ends up in the ocean
sum_marine_litter <- marine_litter %>%
  top_n(n = 10, wt = Ends.in.the.Ocean) %>%
  select(Country.Name, Ends.in.the.Ocean) %>%
  rename(Country = Country.Name, Tons_in_Ocean = Ends.in.the.Ocean)

# Amount of microplastics found per PlasticType
sum_mircoplastics_SF <- microplastiscs_SF %>% 
  group_by(PlasticType) %>%
  summarise(TotalFound = n()) %>%
  top_n(n = 10)

# Top 20 highest average number of particles per individual
fish_with_most_plastic_ind <- fish %>%
  select(Common.name, Mean.num.particles.per.indv, Habitat) %>%
  arrange(- Mean.num.particles.per.indv)%>%
  filter(Common.name != "", na.rm = TRUE) %>%
  head(20)

# Top 10 countries that emit the most plastic per capita
top_10_waste_per_capita <- by_country %>%
  top_n(10, wt = Mismanaged.plastic.waste.to.ocean.per.capita..kg.per.year.) %>%
  arrange(Mismanaged.plastic.waste.to.ocean.per.capita..kg.per.year.) %>%
  rename(Country = Entity) %>%
  rename(Waste = Mismanaged.plastic.waste.to.ocean.per.capita..kg.per.year.) %>%
  select(Country, Waste)

# The types of trash found in the ocean ordered from greatest amount found 
# to lowest
ordered_waste_type_found <- common_waste %>%
  arrange(desc(Number_of_items))



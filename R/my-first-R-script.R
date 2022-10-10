#### LOADING PACKAGES ####
library(tidyverse)
# install.packages("here")
library(here)
# here("R", "my-first-R-script.R")
# "R/my-first-R-script.R"

####### LOADING DATA ####
data_path <- here("data","urban_population.csv")

df <- read_csv(data_path, 
         col_types = cols(code = col_character()))

##### MANIPULATE DATA #####
df_europe <- filter(df, continent == "EUROPE")
df_europe <- select(df_europe, continent, country, year, city_size, population_in_cities)



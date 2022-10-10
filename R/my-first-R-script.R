#### LOADING PACKAGES ####
library(tidyverse)
# install.packages("here")
library(here)
# here("R", "my-first-R-script.R")
# "R/my-first-R-script.R"

####### LOADING DATA ####
data_path <- here("data","urban_population.csv")

df read_csv("data/urban_population.csv", 
         col_types = cols(code = col_character()))
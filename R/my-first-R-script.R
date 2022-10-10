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

# old pipe: %>%

df_europe <- df |>
  filter(continent=="EUROPE") |>
  select(continent, country, year, city_size, population_in_cities, percentage_of_population)

df_newcol <- df |>
  mutate(population_in_1000 = population_in_cities / 1000) |>
  mutate(data_type = case_when(
    year < 2020 ~ "true data",
    year >= 2020 ~ "prediction")
  )

df_newcol <- df |>
  mutate(population_in_1000 = population_in_cities / 1000,
         data_type = case_when(
           year < 2020 ~ "true data",
           year >= 2020 ~ "prediction")
         )

df_grouped <- df |>
  group_by(city_size, continent) |>
  summarise(average_perc_population_in_city = mean(percentage_of_population))

df_grouped_1950 <- df |>
  filter(year == 1950) |>
  group_by(city_size, continent) |>
  summarise(average_perc_population_in_city = mean(percentage_of_population))

df_grouped_2035 <- df |>
  filter(year == 2035) |>
  group_by(city_size, continent) |>
  summarise(average_perc_population_in_city = mean(percentage_of_population))


###### PRETTY PICTURES ######
plot_1950 <- df_grouped_1950 |>
  ggplot(aes(x = city_size,
             y = average_perc_population_in_city,
             fill = continent))

plot_1950 +
  geom_bar(stat="identity",
           position = position_dodge())


plot_1950 +
  geom_col(position = position_dodge()) +
  labs(title = "Average percentage of population in cities in 1950")



plot_2035 <- df_grouped_2035 |>
  ggplot(aes(x = city_size,
             y = average_perc_population_in_city,
             fill = continent))

plot_2035 +
  geom_col(position = position_dodge()) +
  labs(title = "Average percentage of population in cities in 2035")

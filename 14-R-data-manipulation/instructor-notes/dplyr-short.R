#- GDP per capita vs Child survival
#- Fertility rate vs life expectency

# rename & select
# filter: filter rows
# arrange: sort data
# mutate: create new variables
# summarise: create summary table
# group_by: group data
# <x>join: combine datasets
# pivot datasets

rm(list = ls())   # remove all objects from workspace

library(readr)   # read in data
library(tibble)  # nicer dataframes
library(dplyr)   # data transformations
library(tidyr)   # reshape data frames

df = read_rds("io/output/data/gapminder.rds")

glimpse(df)

#####################################
## rename
####################################

df = rename(df,
            life_exp = lifeExp,
            gdp_per_cap = gdpPercap,
            population = pop)


#####################################
## select
####################################

# select rows
select(df,
       yr = year,
       ctry = country,
       gdp = gdp_per_cap)

select(df,
       -year)

# change order of columns
select(df, 
            life_exp,
            pop,
            gdp_per_cap,
            everything())


#####################################
## filter
####################################

asia = filter(df,
              continent == "Asia")

not_europe = filter(df,
                    continent != "Europe")
unique(not_europe$continent)

df_new = filter(df,
                year > 2000)

asia_new = filter(df,
                  continent == "Asia",
                  year > 2000)
asia_new

asia_africa = filter(df,
                     continent == "Asia" | continent == "Africa")
unique(asia_africa$continent)

asia_africa2 = filter(df,
                     continent %in% c("Asia", "Africa"))
unique(asia_africa2$continent)


#####################################
## arrange
####################################

arrange(df,
        life_exp)

arrange(df,
        continent,
        life_exp)

arrange(df,
        desc(life_exp))


#####################################
## mutate
####################################

df = mutate(df,
            decade = floor(year / 10) * 10,
            gdp = gdp_per_cap * population,
            ln_gdp = log(gdp),
            money_per_day = gdp_per_cap / 365,
            life_per_money = life_exp / money_per_day,
            population_in_million = population / 1000000,
            weird_var = (continent == "Europe") * gdp_per_cap + (continent == "Americas") * (log(population))) %>%
  select(-weird_var)

new_vars = transmute(df,
                     gdp = gdp_per_cap * population,
                     ln_gdp = log(gdp),
                     money_per_day = gdp_per_cap / 365,
                     life_per_money = life_exp / money_per_day,
                     population_in_million = population / 1000000,
                     weird_var = (continent == "Europe") * gdp_per_cap + (continent == "Americas") * (log(population)))


#####################################
## group_by & summarise
####################################

summarise(df,
          life_exp_mean = mean(life_exp),
          life_exp_sd = sd(life_exp),
          money_per_day = mean(money_per_day),
          population_in_million = mean(population_in_million),
          life_per_money = mean(life_per_money),
          life_per_money_median = median(life_per_money)
          )

group_by(df, continent) %>%
         summarise(life_exp_mean = mean(life_exp),
          life_exp_median = median(life_exp),
          life_exp_sd = sd(life_exp),
          gdp_per_cap = mean(gdp_per_cap),
          population_in_million = mean(population_in_million),
          life_per_money = mean(life_per_money),
          life_per_log_money = mean(life_exp / log(money_per_day)),
          life_per_log_gdp_per_cap = median(life_exp / log(gdp_per_cap)))%>%
  arrange(life_exp_mean)

df_1950_2000 = filter(df, decade %in% c(1950, 2000)) %>%
  group_by(continent, decade) %>%
  summarise(life_exp = median(life_exp),
            money_per_day = median(money_per_day),
            life_per_gdp_per_cap = mean(life_exp / log(gdp_per_cap))) %>%
  arrange(desc(life_exp))

group_by(df, decade) %>%
  summarise(life_exp_50 = mean(life_exp > 50))


filter(df, decade == 1950) %>%
  group_by(continent) %>%
  summarise(life_exp_50 = mean(life_exp > 50))

filter(df, decade == 2000) %>%
  group_by(continent) %>%
  summarise(life_exp_50 = mean(life_exp > 50))


#####################################
## pivot
####################################

# pivot_wider: split one column into several
df_1950_2000_wide = pivot_wider(df_1950_2000,
                           id_cols = continent,
                           names_from = decade,
                           values_from = life_exp) %>%
  mutate(life_increase = life_exp_2000 / life_exp_1950 - 1)

# pivot_longer: combine several columns into one
test = pivot_longer(df_1950_2000_wide,
             cols = c(money_per_day_1950, money_per_day_2000),
             values_to = "money_per_day",
             names_prefix = "money_per_day_") 

#####################################
## join
####################################

###
# to add columns
##

# full join
# keeps all rows from both datasets

df1 = filter(df, country %in% c("Switzerland", "China"), decade %in% c(1970, 2000)) %>% select(country, year, gdp)
df2 = filter(df, country == "China", decade == 1970) %>% select(country, year, population)

full_join(df1, df2, by = c("country", "year"))

# inner join
# keeps only rows which exist in both datasets

df1 = filter(df, country %in% c("Switzerland", "China"), decade %in% c(1970, 2000)) %>% select(country, year, gdp)
df2 = filter(df, country == "China", decade == 1970) %>% select(country, year, population)

inner_join(df1, df2, by = c("country", "year"))

# left join
# keeps all rows from first dataset, but does not add rows which only exist in second dataset


# right join
# opposite of left join


###
# to filter a dataset
###

# keep only those data from first df, that also exists in second df
semi_join(df1, df2)

# keep only those rows in first df, that do NOT exist in second df
anti_join(df1, df2)


##########################################
## extra for exercise
##########################################

df2 = mutate(df,
             continent_named = recode_factor(continent,
                                             Asia = "Bsia"),
             continent_string = as.character(continent_named))







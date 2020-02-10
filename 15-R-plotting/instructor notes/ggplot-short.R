
# import modules
library("readr")
library("tibble")
library("dplyr")
library("ggplot2")

# import data
df = read_csv("io/input/data/gapminder.csv")

# gauge data
glimpse(df)

# create additional variables we are going to use
df = mutate(df,
            decade      = floor(year / 10) * 10,
            moneyDay    = gdpPercap / 365,
            pop_million = pop / 1e6
)


# empty plot
ggplot(data = df)

# add a geom
ggplot(data = df) +
  geom_point(mapping = aes(x=moneyDay, y=lifeExp)
  )

# change color
ggplot(data = df) +
  geom_point(mapping = aes(x=moneyDay, y=lifeExp),
             color = "blue",
             size  = 3,
             alpha = 0.1
  )

###
### Aestetics?
###

# add grouping
ggplot(data = df) +
  geom_point(mapping = aes(x=moneyDay, 
                           y=lifeExp,
                           color = continent)
  )

# add size = pop
ggplot(data = df) +
  geom_point(mapping = aes(x=moneyDay, 
                           y=lifeExp,
                           color = continent,
                           size = pop_million)
  )

# deal with overplotting
ggplot(data = df) +
  geom_point(mapping = aes(x=moneyDay, 
                           y=lifeExp,
                           color = continent,
                           size = pop_million),
              alpha = 0.3
  )


###
### Grouping data
###

df_continents = group_by(df, continent, year) %>%
  summarise(lifeExp_avg  = weighted.mean(lifeExp, pop),
            moneyDay_avg = weighted.mean(moneyDay, pop),
            pop_sum      = sum(pop_million)
  )

ggplot(data = df_continents) +
  geom_point(mapping = aes(x=moneyDay_avg, 
                           y=lifeExp_avg,
                           color = continent,
                           size = pop_sum),
             alpha = 0.8
  )    

###
### Subplots?
###

# facet grid
ggplot(data = df) +
  geom_point(mapping = aes(x=moneyDay, 
                           y=lifeExp,
                           color = continent,
                           size = pop_million),
             alpha = 0.8
  ) +
  facet_grid(decade ~ continent)

# facet wrap
ggplot(data = df) +
  geom_point(mapping = aes(x=moneyDay, 
                           y=lifeExp,
                           color = continent,
                           size = pop_million),
             alpha = 0.4
  ) +
  facet_wrap(~ decade, ncol = 2)


###
### geoms
###

# geoms denote the general display technique
ggplot(data = df) +
  geom_smooth(mapping = aes(x=moneyDay,
                            y=lifeExp)
  )

# grouping
ggplot(data = df) +
  geom_smooth(mapping = aes(x=moneyDay,
                            y=lifeExp,
                            color = continent),
              se = FALSE
  )

# multiple geoms
ggplot(data = df) +
  geom_point(mapping = aes(x=moneyDay, 
                           y=lifeExp,
                           color = continent,
                           size = pop_million),
             alpha = 0.4
  ) +
  geom_smooth(mapping = aes(x=moneyDay,
                            y=lifeExp,
                            color = continent),
              se = FALSE
  )

# when all use the same aestetics
ggplot(data = df, aes(x=moneyDay,
                                y=lifeExp,
                                color=continent) 
       ) +
  geom_point(mapping = aes(size = pop_million),
             alpha = 0.15
  ) +
  geom_smooth(se = FALSE)

# regression line
ggplot(data = df, aes(x=moneyDay,
                      y=lifeExp,
                      color=continent) 
) +
  geom_point(mapping = aes(size = pop_million),
             alpha = 0.15
  ) +
  geom_smooth(method = 'lm',
              formula = y ~ log(x),
              se = FALSE)

###
### histograms
###

df_2000s = filter(df, decade == 2000)

ggplot(data = df_2000s) +
  geom_histogram(mapping = aes(x = lifeExp),
                 binwidth = 10
  )

# group
ggplot(data = df_2000s) +
  geom_histogram(mapping = aes(x = lifeExp,
                               fill = continent),
           binwidth = 10,
           alpha = 0.5
           )

ggplot(data = df) +
  geom_histogram(mapping = aes(x = lifeExp,
                               fill = continent),
                 binwidth = 10,
                 alpha = 0.5,
                 position = "dodge"
  )


###
### Coordinate systems
###

# flip
ggplot(data = df_2000s) +
  geom_histogram(mapping = aes(x = lifeExp),
                 binwidth = 10
  ) +
  coord_flip()

# log transformation
ggplot(data = df) +
  geom_point(mapping = aes(x=moneyDay, 
                           y=lifeExp,
                           color = continent,
                           size = pop_million),
             alpha = 0.3
  ) + coord_trans(x = "log")


###
### Labeling
###

ggplot(data = df) +
  geom_point(mapping = aes(x=moneyDay, 
                           y=lifeExp,
                           color = continent,
                           size = pop_million),
             alpha = 0.3) + 
  coord_trans(x = "log") +
  labs(title = "Relationship between log(daily available money) and life expectency",
       x = "Available money per day",
       y = "life expectency")

###
### Scales
###

ggplot(data = df) +
  geom_point(mapping = aes(x=moneyDay, 
                           y=lifeExp,
                           color = continent,
                           size = pop_million),
             alpha = 0.3) + 
  labs(title = "Relationship between log(daily available money) and life expectency",
       x = "Available money per day",
       y = "life expectency") +
  scale_color_brewer(palette = "Reds")

###
### Themes
###

life_exp = ggplot(data = df) +
  geom_point(mapping = aes(x=moneyDay, 
                           y=lifeExp,
                           color = continent,
                           size = pop_million),
             alpha = 0.3) + 
  labs(title = "Relationship between income and life expectency",
       x = "Available money per day",
       y = "life expectency") + 
  scale_x_continuous(limits = c(0,150)) +
  theme_classic()


###
### saving plots
###

ggsave("life_exp.png", plot = life_exp)

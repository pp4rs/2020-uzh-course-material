###################################
# split, apply, combine
###################################

library("purrr")
library("tibble")

# - loop over vector
# - apply function to each element
# - save results
# - provided by purrr package

# map functions: iterate over a object
my_df = tibble(
  a = rnorm(10),
  b = c(rnorm(9), NA),
  c = rnorm(10),
  d = rnorm(10)
)

map_dbl(my_df, median, na.rm = TRUE)
map_dbl(my_df, mean, na.rm = TRUE)
map_dbl(my_df, sd, na.rm = TRUE)

# Syntax:
# 1. vector we want to operate on
# 2. function we want to apply to each element
# 3. optional: additional arguments

# functions:
# `map()`: makes a list,
# `map_lgl()`: makes a logical vector,
# `map_int()`: makes an integer vector,
# `map_dbl()`: makes a double vector,
# `map_chr()`: makes a character vector.

###
# map2: iterate over 2 objects parallel
###

mu = list(0, 0, 0, 0)
sd = list(1, 5, 10, 20)

# step by step
my_fancy_df = map2(mu, sd, rnorm, n = 20) 
my_fancy_df = set_names(my_fancy_df, c('a', 'b', 'c', 'd'))
my_fancy_df = as_tibble(my_fancy_df)

# with piping
my_fancy_df = map2(mu, sd, rnorm, n = 20) %>%
  set_names(c('a', 'b', 'c', 'd')) %>%
  as_tibble

###
# pmap: iterate over more than 2 lists
###

mu = list(1, 2, 3, 4)
sd = list(1, 10, 15, 20)
n  = list(1, 2, 3, 4)

args = list(n, mu, sd) 

pmap(args, rnorm)
str(pmap(args, rnorm))
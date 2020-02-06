## IO extra code

df_csv = read_csv("gapminder.csv", 
                  col_types = cols(
                    country = col_factor(),
                    continent = col_factor(),
                    year = col_integer(),
                    lifeExp = col_double(),
                    pop = col_double(),
                    gdpPercap = col_double()
                  ))

df_tsv = read_tsv("gapminder.tsv")
df_weird = read_delim("gapminder_weird.csv", delim = "|")
df_skipped = read_csv("gapminder_long_header.csv", skip = 2)
df_na = read_csv("gapminder_na.csv", na = ".")
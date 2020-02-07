# Notes for IO:

library("readr")


##############################
# importing data
##############################

# csv: comma separated
my_csv = "a, b, c, d 
          1, 2, 3, 4
          5, 6, 7, 8"

read_csv(my_csv)

df_csv = read_csv("gapminder.csv")
df_tsv = read_tsv("gapminder.tsv")
df_weird = read_delim("gapminder_weird.csv", delim = "|")
df_skipped = read_csv("gapminder_long_header.csv", skip = 2)
df_na = read_csv("gapminder_na.csv", na = ".")

df_csv = read_csv("gapminder.csv", 
                  col_types = cols(
                    country = col_factor(),
                    continent = col_factor(),
                    year = col_integer(),
                    lifeExp = col_double(),
                    pop = col_double(),
                    gdpPercap = col_double()
                  ))

##############################
# writing data
##############################

system("ls -d")

if (!file.exists("output")) {
  dir.create("output")
}

if (!file.exists("output/data")) {
  dir.create("output/data")
}

out_csv = "io/output/data/gapminder.csv"
out_rds = "io/output/data/gapminder.rds"

# write a csv
write_csv(df_csv, out_csv)
system("ls io/output/data")

# write rds
write_rds(df_csv, out_rds)
df_rds2 = read_rds(out_rds)
head(df_rds)







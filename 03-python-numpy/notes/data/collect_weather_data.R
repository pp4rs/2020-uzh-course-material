## Collecting Weather data
##
## This script collects weather data
## for the city of Zurich in July and Ausgust 2017,
## and saves it to file

library("weatherData")

data <- getSummarizedWeather("ZRH", "2017-07-01", "2017-08-20", 
                                    opt_all_columns=TRUE)

write.table(data, "zrh_weather.txt", sep="&")

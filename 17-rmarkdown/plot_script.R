library(readr)
library(dplyr)
library(ggplot2)
library(magrittr)
library(janitor)

df <- read_csv("data/EconomistData.csv") %>%
  clean_names("snake")


points_to_label <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                     "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                     "India", "Italy", "China", "South Africa", "Spane",
                     "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                     "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                     "New Zealand", "Singapore")

df %<>%
  mutate(region = factor(region,
                         levels = c("EU W. Europe",
                                    "Americas",
                                    "Asia Pacific",
                                    "East EU Cemt Asia",
                                    "MENA",
                                    "SSA"),
                         labels = c("OECD",
                                    "Americas",
                                    "Asia &\nOceania",
                                    "Central &\nEastern Europe",
                                    "Middle East &\nnorth Africa",
                                    "Sub-Saharan\nAfrica")
  )
  )

df %>%
  ggplot(aes(x = cpi, y = hdi)) +
  geom_point(aes(color = region),
             shape = 1, size = 2.5, stroke = 1.25) +
  geom_smooth(se= FALSE, 
              method = "lm",
              formula = y ~ x + log(x),
              color = "red")  +
  geom_text(aes(label = country),
            color = "gray20",
            data = filter(df, country %in% points_to_label),
            #force = 10
  ) +
  scale_color_manual(name = "",
                     values = c("#24576D",
                                "#099DD7",
                                "#28AADC",
                                "#248E84",
                                "#F2583F",
                                "#96503F")) +
  theme_bw() +
  theme(legend.position = "bottom",
        plot.title = element_text(hjust = 0.5)) + 
  xlab("Corruption Perceptions Index, 2011 (10=least corrupt)") +
  ylab("Human Development Index, 2011 (1=Best)") +
  ggtitle("Corruption and Human development", subtitle = waiver()) +
  scale_x_continuous(
    limits = c(.9, 10.5),
    breaks = 1:10) + 
  scale_y_continuous(
    limits = c(0.2, 1.0),
    breaks = seq(0.2, 1.0, by = 0.1)
  ) +
  labs(caption="Sources: Transparency International; UN Human Development Report")

ggsave("my_figure.pdf")
library(readxl)
library(dplyr)
library(magrittr)
library(stargazer)
library(lfe)

df <- read_xls("data/income-democracy.xls",
               sheet = 2) 

reg_df <- df %>%
  arrange(code_numeric, year_numeric) %>%
  rename(log_gdp_pc = lrgdpch,
         freedom_house = fhpolrigaug)
reg_df %<>%
  group_by(code_numeric) %>%
  mutate(
    lag_log_gdp_pc = lag(log_gdp_pc, order_by = year_numeric),
    lag_freedom_house = lag(freedom_house, order_by = year_numeric)
  ) %>%
  filter(sample == 1)


## FEs no IV
pooled_olsfe3 <- felm(freedom_house ~ lag_freedom_house + lag_log_gdp_pc | # exog stuff
                        code_numeric + year_numeric | # fe stuff
                        0 | # no ivs for us!
                        code_numeric,   # cluster se's at this level
                      data = reg_df
)

summary(pooled_olsfe3)

# IV regression? 
# we need the two period lag of nsave to instrument for lag_log_gdp_pc 

reg_df %<>%
  group_by(code_numeric) %>%
  mutate(lag2_nsave = lag(nsave, 2, order_by =  year_numeric))

iv_res <- felm(freedom_house ~ lag_freedom_house | # whats exog
                 code_numeric + year_numeric | # whats my fe
                 (lag_log_gdp_pc ~ lag2_nsave) | # whats my endog problem
                 code_numeric, # whats my clustering look like
               data = reg_df  # whats my data,
               
)

rownames(iv_res$beta)[rownames(iv_res$beta) == "`lag_log_gdp_pc(fit)`"] <- "lag_log_gdp_pc"
rownames(iv_res$coefficients)[rownames(iv_res$coefficients) == "`lag_log_gdp_pc(fit)`"] <- "lag_log_gdp_pc"
names(iv_res$se)[names(iv_res$se) == "`lag_log_gdp_pc(fit)`"] <- "lag_log_gdp_pc"
names(iv_res$rse)[names(iv_res$rse) == "`lag_log_gdp_pc`"] <- "lag_log_gdp_pc"

# now a table
stargazer(iv_res, 
          pooled_olsfe3,
          font.size = "footnotesize",
          out = "my_table.tex"
          )

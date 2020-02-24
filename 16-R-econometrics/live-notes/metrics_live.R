library(readxl)
library(dplyr)
library(magrittr)

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

## Run some regressions?

pooled_ols <- lm(freedom_house ~ lag_freedom_house + lag_log_gdp_pc, data = reg_df)

summary(pooled_ols)

# add fixed effects?
pooled_olsfe <- lm(freedom_house ~ -1 + lag_freedom_house + lag_log_gdp_pc + factor(code_numeric), data = reg_df)

summary(pooled_olsfe)

# compare regressions side by side 
library(stargazer)

stargazer(pooled_ols, pooled_olsfe, 
          type = "text",
          keep = c("lag_freedom_house", "lag_log_gdp_pc")
          )

# heteroskedasticity is everywhere, but hard to do in R
library(sandwich)
library(lmtest)
het_robust_pols <-vcovHC(pooled_ols, type = "HC1")

typeof(het_robust_pols) 
het_robust_pols
het_robust_pols_se <- sqrt(diag(het_robust_pols))

coeftest(pooled_ols, het_robust_pols)

# add those heterosk standard errors to a table?
stargazer(pooled_ols, 
          pooled_ols,
          se = list(NULL, 
                    het_robust_pols_se
                    ),
          type = "text")

# a better way to fixed effects regression
library(lfe)

pooled_olsfe2 <- felm(freedom_house ~ lag_freedom_house + lag_log_gdp_pc | 
                                      code_numeric,
                                      data = reg_df
                      )
summary(pooled_olsfe2)

# what kinda standard errors are in lfe by default??
# before 
het_robust_pooledolsfe <- vcovHC(pooled_olsfe, type = "HC1")
het_robust_pooledolsfe_se <- sqrt(diag(het_robust_pooledolsfe)) 


stargazer(pooled_olsfe, pooled_olsfe2,
          se = list(het_robust_pooledolsfe_se , NULL),
          type = "text")
# looks like by default we get homosk standard errors ...
# urghhhhhhhhhhhhhh ... can we get the robust ones?

felm_summary <- summary(pooled_olsfe2, robust = TRUE)
robust_se <- felm_summary$coefficients[,2]

stargazer(pooled_olsfe, pooled_olsfe2,
          se = list(het_robust_pooledolsfe_se , robust_se),
          type = "text")

# so robust was hard ... clustering is easy!

pooled_olsfe3 <- felm(freedom_house ~ lag_freedom_house + lag_log_gdp_pc | # exog stuff
                                      code_numeric + year_numeric | # fe stuff
                                      0 | # no ivs for us!
                                      code_numeric,   # cluster se's at this level
                                      data = reg_df
                        )

summary(pooled_olsfe3)

stargazer(pooled_olsfe3,
          type = "text")
# stargazer took clustered se's by default

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
summary(iv_res)

# first stage?
summary(iv_res$stage1)

# together in a table
stargazer(iv_res, pooled_olsfe3,
        type = "text")
# nice but the iv regression endog var has a different name :(
# you need to work a little hard to change the names ...  here is the essence - longer solution to be posted
iv_res$beta

rownames(iv_res$coefficients)[rownames(iv_res$coefficients) == "`lag_log_gdp_pc(fit)`"]<- "lag_log_gdp_pc"
iv_res$coefficients

library(lfe)

# we can mimic stata better (our method of cleaning fe's is different than theirs)
iv_res_stata <- felm(freedom_house ~ lag_freedom_house | # whats exog
                 code_numeric + year_numeric | # whats my fe
                 (lag_log_gdp_pc ~ lag2_nsave) | # whats my endog problem
                 code_numeric, # whats my clustering look like
                 cmethod = "reghdfe",
                 data = reg_df  # whats my data,
)

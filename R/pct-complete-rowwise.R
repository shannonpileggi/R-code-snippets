library(palmerpenguins)
library(faux)
library(tidyverse)


penguins_messy <- penguins %>% 
  faux::messy(prop = 0.2, 3:8) %>% 
  rename_with(.cols = 3:8, .fn = ~ str_c(., "_messy"))


penguins_messy %>% 
  # create dummy variables representing if the observation is missing ----
  mutate_at(vars(matches("messy")), list(dummy = is.na)) %>% 
  # compute a row wise sum of missing ----
  rowwise() %>% 
  mutate(
    # percent of observations that are complete (non-missing) ----
    pct_complete = 1- mean(c_across(matches("_messy_dummy")))
  ) %>% 
  # remove grouping from rowwise ----
  ungroup() %>% 
  # remove dummy variables ----
  dplyr::select(-matches("dummy"))



# stack overflow posts
# https://stackoverflow.com/questions/64356552/count-missing-values-with-rowwise-and-add-number-of-missing-values
# https://stackoverflow.com/questions/37801338/count-nas-per-row-in-dataframe
# https://stackoverflow.com/questions/35443115/add-a-column-with-count-of-nas-and-mean

df <- data.frame(a = 1:5, b = c(1,2,NA,4,NA), c = c(NA,2,3,NA,NA))


df %>% 
  # create dummy variables representing if the observation is missing ----
  # can modify here for specific variables ----
  mutate_all(list(dummy = is.na)) %>% 
  # compute a row wise sum of missing ----
  rowwise() %>% 
  mutate(
    # number of missing observations ----
    n_miss = sum(c_across(matches("_dummy"))),
    # percent of observations that are complete (non-missing) ----
    pct_complete = 1 - mean(c_across(matches("_dummy")))
  ) %>% 
  # remove grouping from rowwise ---- 
  ungroup() %>% 
  # remove dummy variables ----
  dplyr::select(-matches("dummy"))


# for carbonate image ---

df %>% 
  mutate_all(list(dummy = is.na)) %>% 
  rowwise() %>% 
  mutate(
    pct_complete = 1 - mean(c_across(matches("_dummy")))
  ) %>% 
  ungroup() %>% 
  dplyr::select(-matches("_dummy"))


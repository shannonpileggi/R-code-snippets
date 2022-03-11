library(tidyverse)

ref <- tibble::tribble(
  ~var_name, ~var_label,
  "A",       "apple",  
  "B",       "banana",
  "C",       "canteloupe"  
)

ref_vec <- deframe(ref)

dat_raw <- tibble::tribble(
  ~id, ~var_name, ~var_label,
  1,   "A",       "apple", 
  2,   "A",       NA,
  3,   "B",       "banana",
  4,   "C",       NA, 
  5,   "C",       "canteloupe"  
)

dat <- dat_raw %>% 
  left_join(ref, by = "var_name") %>% 
  mutate(var_label = coalesce(var_label.y, var_label.x)) %>% 
  select(-c(var_label.x, var_label.y))

library(tidyverse)
library(lubridate, warn.conflicts = FALSE)

# mixed POSIXct and Date fields ----
dat_original <- tibble::tibble(
  date_1 = as.POSIXct(c(NA, "2022-01-01", "2022-01-01")),
  date_2 = as_date(c(NA, NA, "2021-01-01"))
) 

dat_original %>% 
  rowwise() %>% 
  mutate(
    min_date = min(date_1, date_2, na.rm = TRUE)
  ) 

dat_original %>% 
  # convert all dates to Date ----
  mutate(across(everything(), lubridate::as_date)) %>% 
  rowwise() %>% 
  mutate(
    min_date = min(date_1, date_2, na.rm = TRUE)
  ) 

library(tidyverse)
library(lubridate)

dat_raw <- tibble::tibble(
  var_1 = "A",
  var_2 = 1,
  var_3 = Sys.time()
)

purrr::map(dat_raw, class)

dat <- dat_raw %>% 
  mutate(
    across(where(is.POSIXct), lubridate::as_date)
    )

purrr::map(dat, class)

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
  ) -> check1

writexl::write_xlsx(check1, "check1.xlsx")


# warning reprex -------------------------------------------------------------------------------------

library(tidyverse)
library(lubridate, warn.conflicts = FALSE)

dat <- tibble::tibble(date_1 = as_date(c(NA, "2022-01-01", "2022-01-01")),
                      date_2 = as_date(c(NA, NA, "2021-01-01")))

dat %>%
  rowwise() %>%
  mutate(min_date = case_when(
    !is.na(date_1) & !is.na(date_2) ~ min(date_1, date_2, na.rm = TRUE)
  ))

suppressWarnings({
  dat %>%
    rowwise() %>%
    mutate(min_date = case_when(
      !is.na(date_1) & !is.na(date_2) ~ min(date_1, date_2, na.rm = TRUE)
    ))
})


suppressWarnings({
dat %>%
  rowwise() %>%
  mutate(min_date =  min(date_1, date_2, na.rm = TRUE))
})

dat %>%
  rowwise() %>%
  suppressWarnings({
  mutate(min_date =  min(date_1, date_2, na.rm = TRUE))
  })  


# weird excel export -----------------------------------------------------------


library(tidyverse)
library(lubridate, warn.conflicts = FALSE)

# mixed POSIXct and Date fields ----
dat_original <- tibble::tibble(
  date_1 = c(NA_Date_, as_date("2022-01-01"), as_date("2022-01-01")),
  date_2 = c(NA_Date_, NA_Date_, as_date("2021-01-01"))
) 

check1 <- dat_original %>% 
  rowwise() %>% 
  mutate(
    min_date = min(date_1, date_2, na.rm = TRUE)
  ) 


writexl::write_xlsx(check1, "check1.xlsx")
openxlsx::write.xlsx(check1, "check2.xlsx")

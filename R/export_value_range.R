
library(tidyverse)

test <- tibble(
  x = "5-10",
  y = "5 - 10",
  z = "5 - 10 "
)

readr::write_csv(test, "test.csv")
openxlsx::write.xlsx(test,"test.xlsx")

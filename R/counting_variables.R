library(tidyverse)

counting_vars <- vars(class, cyl, fl)

mpg %>%
  count(!!!counting_vars)


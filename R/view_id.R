library(tidyverse)
library(glue)
library(nycflights13)

view_id <- function(id){
  planes  %>% filter(tailnum == id) %>% view(glue("planes_{id}"))
  flights %>% filter(tailnum == id) %>% view(glue("flights_{id}"))
}

view_id("N10156")

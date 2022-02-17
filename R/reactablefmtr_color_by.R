library(reactable)
library(reactablefmtr)
library(tidyverse)

iris_mod <- iris %>% 
  group_by(Species) %>% 
  summarize(
    n_total = n(),
    n_length_gt_5 = sum(Sepal.Length > 5),
    pct_length_gt_5 = n_length_gt_5 / n_total,
    length_label = glue("{n_length_gt_5} ({scales::percent(pct_length_gt_5, 0.1)})")
  ) %>% 
  ungroup() 

iris_mod

reactable(
  iris_mod,
  columns = list(
    length_label = colDef(cell = color_tiles(iris_mod, color_by = "pct_length_gt_5")),
    pct_length_gt_5 = colDef(show = FALSE),
    n_length_gt_5 = colDef(show = FALSE)
    
  )
)
library(tidyverse)
library(gt)
library(gtExtras)

dat <- tribble(
  ~id, ~type,
  1,   "A",
  1,   "A",
  1,   "B",
  1,   "B",
  1,   "C",
  2,   "A",
  2,   "B",
  2,   "B",
  3,   "C"
) %>% 
  mutate(type = as_factor(type)) %>% 
  group_by(id) %>% 
  count(type, name = "n_type", .drop = FALSE) %>% 
  summarize(
    list_type = list(n_type),
    .groups = "drop"
  )


dat %>% 
  gt() %>% 
  gt_plt_bar_stack(
    list_type, 
    width = 65,
    labels = c("A", "B", "C"),
    palette= c("#ff4343", "#bfbfbf", "#0a1c2b")
  ) 
suppressMessages(library(dplyr))
y <- c(NA, -2:2)

num_type <- function(x){
  
  case_when(
    is.na(x) ~ NA_character_,
    x > 0  ~ "pos",
    x < 0  ~ "neg",
    x == 0 ~ "zero" 
  )
  
}

num_type(y)

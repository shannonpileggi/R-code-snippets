library(datapasta)
library(palmerpenguins)

# base r data frame
dpasta(head(faithful))

data.frame(
   eruptions = c(3.6, 1.8, 3.333, 2.283, 4.533, 2.883),
     waiting = c(79, 54, 74, 62, 85, 55)
        )

# tibble
dpasta(head(penguins))
tibble::tribble(
  ~species,     ~island, ~bill_length_mm, ~bill_depth_mm, ~flipper_length_mm, ~body_mass_g,     ~sex, ~year,
  "Adelie", "Torgersen",            39.1,           18.7,               181L,        3750L,   "male", 2007L,
  "Adelie", "Torgersen",            39.5,           17.4,               186L,        3800L, "female", 2007L,
  "Adelie", "Torgersen",            40.3,             18,               195L,        3250L, "female", 2007L,
  "Adelie", "Torgersen",              NA,             NA,                 NA,           NA,       NA, 2007L,
  "Adelie", "Torgersen",            36.7,           19.3,               193L,        3450L, "female", 2007L,
  "Adelie", "Torgersen",            39.3,           20.6,               190L,        3650L,   "male", 2007L
  )

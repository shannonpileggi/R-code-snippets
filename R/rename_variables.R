library(tidyverse)

# original data set up from stack overflow -------------------------------------
df <- data.frame("Gene_Symbol" = c("Gene1","Gene2","Gene3","Gene4","Gene5","Gene6","Gene7"), 
                 "Sample1" = c(85657.97656,54417.78906,110949.3281,53197.45313,87156.80469,NA,23880.2832), 
                 "Sample2" = c(10423.40918,41660.73047,40094.54688,49519.78125,129387.1094,NA,23903.25977), 
                 "Sample3" = c(18778.68359,43655.79688,NA,57447.08984,113266.1484,44810.26172,26316.6543), 
                 "Sample4" = c(23919.53125,47829.02344,NA,51478.58203,116275.3359,43110.94922,25417.45508), 
                 "Sample5" = c(NA,46677.20313,63389.45313,48722.15234,NA,77135.52344,40265.6875), 
                 "Sample6" = c(NA,68596.22656,56802.60938,44712.64063,NA,47744.17969,33689.62891), 
                 "Sample7" = c(NA,80506.14844,48722.99219,38629.00781,NA,37885,36638.02344))

df2 <- data.frame(
  "Sample_name" = c("Sample1","Sample2","Sample3","Sample4","Sample5","Sample6", "Sample7"), 
  "Tumor_name" = c("Tumor56", "Tumor17", "Tumor99", "Tumor2", "Tumor34", "Tumor84", "Tumor51")
  )


# create named vector of variable names ----------------------------------------
# values are current variable names, vector names are the new variable names
var_names <- df2 %>% 
  # new variable names, old variable names
  select(Tumor_name, Sample_name) %>% 
  deframe()

var_names

# rename vaiables---------------------------------------------------------------
df_updated <-  df %>% 
  rename(!!!var_names)

df



df_updated



# ------------------------------------------------------------------------------

library(tidyverse)

df <- tibble(
  var_1 = LETTERS[1:3], 
  var_2 = 1:3
  )

df_names <- tibble(
  "new_name" = c("Variable 1","Variable 2"), 
  "old_name" = c("var_1", "var_2")
)

var_names <- deframe(df_names)

var_names

df_updated <-  df %>% 
  rename(!!!var_names)

df_updated
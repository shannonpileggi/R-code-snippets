dat <- tibble(fruit = c("apple", "apple", "apple", "orange")) %>% 
  mutate(fruit = as_factor(fruit) %>% fct_expand("apple", "orange", "banana"))

dat %>% count(fruit)

dat %>% count(fruit, .drop = FALSE)




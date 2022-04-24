
fruit <- tibble::lst(
  apple = list(color = "red", origin = "orchard"),
  banana = list(color = "yellow", origin = NULL)
)

purrr::map_chr(fruit, "color")
purrr::map_chr(fruit, "origin")
purrr::map_chr(fruit, "origin", .default = NA)
library(worrrd)
library(dplyr)

math <- dplyr::tribble(
  ~problem,  ~solution,
  "2 + 2",   "four",
  "5 + 3",   "eight",
  "9 - 4",   "five",
  "1 + 0",   "one",
  "2 + 1",   "three",
  "5 + 5",   "ten",
  "6 - 6",   "zero"
)


bunny_img <- "https://i.etsystatic.com/10685059/r/il/db9c20/1823172566/il_1588xN.1823172566_j0gz.jpg"

bunny_search <- wordsearch(
  words = math$solution, 
  clues = math$problem,
  r = 30, 
  c = 30,
  image = bunny_img
  )


plot(bunny_search, solution = TRUE, title = "Math is so bunny")

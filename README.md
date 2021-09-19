# R code snippets

These are small bits of R code that I don't want to lose.

# Code images 

[`carbonate`](https://yonicd.github.io/carbonate/) is used to make images of the source code.

```
library(carbonate)

# copy code to clipboard
x <- carbon$new()

# style code
x$template <- 'cobalt'
x$font_family <- 'Hack'

# open in carbon browser
x$browse()

# or save image
x$carbonate(file = 'new_template.png')

```


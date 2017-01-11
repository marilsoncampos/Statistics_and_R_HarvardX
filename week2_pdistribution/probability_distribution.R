library(dplyr)
library(gapminder)

a <- gapminder

data1952 <- filter(gapminder, year==1952) %>% select(lifeExp) %>% unlist

prop <- function(q) {
  mean(data1952<=q)
}

qs <- seq(from=min(data1952), to=max(data1952), length=20)

props <- sapply(qs, prop)

plot(qs, props, main="P-distribution")

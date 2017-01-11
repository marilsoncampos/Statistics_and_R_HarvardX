library(dplyr)

comparable <- read.csv("msleep_ggplot2.csv")
class(comparable)

primates_only <- filter(comparable, order=="Primates") %>% select(sleep_total)

plot(primates_only)

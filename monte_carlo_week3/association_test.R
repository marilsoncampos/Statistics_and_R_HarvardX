library(dplyr)
library(rafalib)

d <- read.csv("assoctest.csv")

tab <- table(d)
chisq.test(tab)
fisher.test(tab)

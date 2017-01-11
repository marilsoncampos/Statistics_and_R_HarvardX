library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)

library(dplyr)
bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist

# Exercise 1
set.seed(1)
N <- 5
ns_sample <- sample(bwt.nonsmoke, N)
s_sample <- sample(bwt.smoke, N)
t.test(ns_sample, s_sample)$p.value

# Exercises 2, 3, and 4
set.seed(1)
alpha <- 0.01
N1 <- 30  # P(Reject H0|H1 is true) = 0.4783 (alpha = 0.05)
N2 <- 60  # P(-//-) = 0.7907 (alpha = 0.05)
N3 <- 90  # P(-//-) = 0.9338 (alpha = 0.05)
N4 <- 120 # P(-//-) = 0.9842 (alpha = 0.05)
reject <- function(arg_N) {
  ns_sample <- sample(bwt.nonsmoke, arg_N)
  s_sample <- sample(bwt.smoke, arg_N)
  pval <- t.test(ns_sample, s_sample)$p.value
  pval < alpha
}
rejections_times <- replicate(10000, reject(N3))
mean(rejections_times) # POWER! I got the Power (probability, more at Wiki)!


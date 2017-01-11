##Playing with population samples and finding the null hypothesis iterating
##the mean search 10K times. Read code below
library(dplyr)
library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
if (!file.exists(filename)) download(url, destfile=filename)

## -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

population <- read.csv("femaleControlsPopulation.csv")
population <- unlist(population)

control <- filter(dat,Diet=="chow") %>% select(Bodyweight) %>% unlist
treatment <- filter(dat,Diet=="hf") %>% select(Bodyweight) %>% unlist
obsdiff <- mean(treatment) - mean(control)

n <- 10000
null <- vector("numeric",n)

for (i in 1:n) {
      control <- sample(population, 12)
      treatment <- sample(population, 12)
      null[i] <- mean(treatment) - mean(control)
}
print( mean( abs(null) >= obsdiff ) )

max(null)
hist(null)

## -- - -- - -- - -- - -- - -- - -- - --
## Exercise No.2 and No.3 (HW)

set.seed(1)
m <- 1000
null_vctr <- vector("numeric", m)
for (i in 1:m) {
  m[i] <- mean( sample(population, 50) )
}
hist(m)
print( mean( abs(m - mean(population)) > 1) )

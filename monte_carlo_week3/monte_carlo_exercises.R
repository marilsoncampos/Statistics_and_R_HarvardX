library(rafalib)
library(dplyr)

N <- 30
controlPopulation <- rnorm(30)
t.test()
set.seed(1)
ttestgenerator <- function(n) {
  #note that here we have a false "high fat" group where we actually
  #sample from the nonsmokers. this is because we are modeling the *null*
  cases <- sample(controlPopulation,n)
  controls <- sample(controlPopulation,n)
  tstat <- (mean(cases)-mean(controls)) / 
    sqrt( var(cases)/n + var(controls)/n ) 
  return(tstat)
}
ttests <- replicate(1000, ttestgenerator(10))
t.test(controlPopulation, var.equal=TRUE)

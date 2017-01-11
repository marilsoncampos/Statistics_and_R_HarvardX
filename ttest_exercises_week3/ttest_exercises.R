library(dplyr)
library(rafalib)

babies <- read.table("babies.txt", header = TRUE)

bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist

diff <- mean(bwt.nonsmoke) - mean(bwt.smoke)

set.seed(1)
dat.ns <- sample(bwt.nonsmoke, 25)
dat.s <- sample(bwt.smoke, 25)

X.ns <- mean(dat.ns)
var.ns <- var(dat.ns)

X.s <- mean(dat.s)
var.s <- var(dat.s)

se_diff <- sqrt(
  var.ns/25 
  + var.s/25
)
tval <- (X.ns - X.s)/se_diff
tval  # T statistic

# probability if T statistic is having
# larger value. Multiply by 2 as it is two sided test
prob_t <- 2 * (1 - pnorm(abs(tval)))
# or prob_t <- 2 * pnorm(-abs(tval))

qnorm(0.995) * se_diff

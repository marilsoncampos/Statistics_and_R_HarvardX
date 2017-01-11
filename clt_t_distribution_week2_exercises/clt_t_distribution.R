# Exercise 1
dat <- read.csv(filename)
set.seed(1)

sides <- 6
n <- 100
p <- 1/sides
p_var <- p*(1-p)/n
zs <- replicate(10000, {
                x <- sample(1:sides, n, replace = TRUE)
                (mean(x==sides) - p)/sqrt(p_var)
                })

qqnorm(zs)
abline(0,1) # We see that it is well approximated (CLT approved)
mean(abs(zs)>2)

# Exercise 3
library(dplyr)
X <- filter(dat, Diet=="chow") %>% select(Bodyweight) %>% unlist
Y <- filter(dat, Diet=="hf") %>% select(Bodyweight) %>% unlist
mean(X)
sd(X)

# Exercise 7
two_grams_off <- 2 * ( 1 - pnorm(2/sd(X) * sqrt(12)) )
two_grams_off

# Exercise 8
se_X_diff_Y <- sqrt(
  var(Y)/12 +  var(X)/12
)
se_X_diff_Y

# Exercise 9
diff_in_mean_XY <- mean(Y) - mean(X)
tstatXY <- diff_in_mean_XY/se_X_diff_Y
tstatXY
# or
t.test(Y, X)

# Exercise 11
2*(1-pnorm(2.055174)) # value taken from exercises 9

# Exercise 12
t.test(X,Y)$p.value

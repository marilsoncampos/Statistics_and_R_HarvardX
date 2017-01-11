dat <- read.csv(filename)
dat <- na.omit(dat)

library(dplyr)
library(rafalib)
x <- filter(dat, Sex=="F" & Diet=="chow") %>% select(Bodyweight) %>% unlist
y <- filter(dat, Sex=="F" & Diet=="hf") %>% select(Bodyweight) %>% unlist

pmean_x <- mean(x)
pmean_y <- mean(y)

popsd(x)
popsd(y)

set.seed(1)
X <- sample(x, 25)
smean_X <- mean( X )

set.seed(1)
Y <- sample(y, 25)
smean_Y <- mean( Y )

diff_popMean <- pmean_y - pmean_x
diff_sampleMean <- smean_Y - smean_X

diff_pop_sample_mean <- abs(diff_popMean - diff_sampleMean)
diff_pop_sample_mean

library(dplyr)

x <- unlist( read.csv("femaleControlsPopulation.csv") )

set.seed(1)
n <- 1000

average_five <- vector("numeric", n)
average_fifty <- vector("numeric", n)

for (i in 1:n) {
    average_five[i] <- mean( sample(x, 5) )
    average_fifty[i] <- mean( sample(x, 50) )
}

prop = function(q) {
    mean(average_fifty<=q)
}
b <- prop(25)
a <- prop(23)

diff <- pnorm(25, mean(average_fifty), sd(average_fifty)) - pnorm(23, mean(average_fifty), sd(average_fifty))
diff

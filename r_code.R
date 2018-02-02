x <- as.integer(runif(50, 2, 11)) #randomizes 50 numbers between 2 and 11

sd(x)# shows the standard deviation of vector x
var(x) # shows the variance of vector x
median(x) # shows the median of vector x
mad(x) # shows the median absolute deviation of vector x

pnorm(-1, mean=0, sd=1)  
pnorm(0, mean = 0, sd = 1)
pnorm(0, mean = 1, sd = 1)
pnorm(0, mean = -1, sd = 1)
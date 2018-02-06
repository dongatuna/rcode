x <- as.integer(runif(50, 2, 11)) #randomizes 50 numbers between 2 and 11

sd(x)# shows the standard deviation of vector x
var(x) # shows the variance of vector x
median(x) # shows the median of vector x
mad(x) # shows the median absolute deviation of vector x

dnorm(-1, mean = 0, sd =1) # gives the value of p(x=-1) when mu=0 and sd = 1


pnorm(-1, mean=0, sd=1)  # gives the area from -inf to -1, with a mu = 0, sigma=1 
pnorm(1, mean = 0, sd = 1) # gives the area from -inf to 1, with a mu = 0, sigma=1 
pnorm(3, mean = 0, sd = 3) # gives the area from -inf to 3, with a mu = 0, sigma=3 
pnorm(0, mean = -1, sd = 1)

#q norm is the reverse of pnorm
qnorm(0.5) # gives you the z value of 0, which is associated with covered area of 50%
qnorm(0.70)

pnorm(1, mean = 0, sd=1) - pnorm(-1, mean = 0, sd=1)

zvalue<-(30-26.3)/sqrt(9.3)

pnorm(zvalue, mean = 0, sd=1)
sqrt(4)

1-qnorm(1-0.05/2)
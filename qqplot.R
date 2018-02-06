N = 10
index <- seq(1, N)
P <- (index - 0.5)/N
P

theoretical.quantity<-qnorm(P)
theoretical.quantity

yields<-c(86.2, 85.7, 71.9, 95.3, 77.1, 71.4, 68.9, 78.9, 86.9, 78.4)
mean.yield <- mean(yields) # 80.07
sd.yield <- sd(yields) # 8.35

yields.z <- sort(yields - mean.yield)/sd.yield

#yields.z.sorted <- sort(yields.z)

plot(theoretical.quantity, yields.z, type = "p")

library(car)
qqPlot(yields)

rand.norm<-rnorm(1000) #gives 1000 normal values
rand.f<-rf(2000, df1 = 200, df = 150)  #2000 values from F-distribution
hist(rand.f)

quantiles<-c(1, 2, 3, 4, seq(5, 95, 5), 96, 97, 98, 99)/100

norm.quantiles<-quantile(rand.norm, quantiles)
f.quantiles<-quantile(rand.f, quantiles)

plot(f.quantiles, norm.quantiles)
library(car)
qqPlot(rand.f, distribution="norm")

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
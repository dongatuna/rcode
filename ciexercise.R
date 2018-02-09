# this is an exercise to calculate the range of CI

# vector of viscosity values
viscosity<-c(13.7, 14.9, 15.7, 16.1, 14.7, 15.2, 13.9, 13.9, 15.0, 13.0, 16.7, 13.2)

# N contains the number of observations in the viscosity sample
N <- length(viscosity)
# create an index to be used in the quintiles calculations
# quintiles are division of the distribution in N parts
index<-seq(1, N)
z.ideal<-(index-0.05)/N

# find the z ordinate associated with each quintile
ideal.points<-qnorm(z.ideal)

#sort viscosity sample
viscosity.sort<-sort(viscosity)

# find the mean, sd and use N = 12
viscosity.mean<-mean(viscosity.sort)
viscosity.sd<-sd(viscosity.sort)

# Find the actual z for viscosity sample

z.actual<-(viscosity.mean - viscosity.sort)/(viscosity.sd)

#add the car library that has a 95% confidence interval
library(car)

plot(ideal.points, actual.points, type = "p")
qqPlot(z.actual)

#the above sample has a normal distribution

# find the range with 
Ct<-qt(0.975, df=11)
# Ct 
#mean is 14.67
viscosity.mean - Ct*viscosity.sd/sqrt(N) # 14.1
viscosity.mean + Ct*viscosity.sd/sqrt(N) # 15.3

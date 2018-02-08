# there are 9 observations, so N = 9

N = 9;

index<-seq(1, N)

z.ideal = (index -0.05)/N

theoretical.z<-qnorm(z.ideal)
theoretical.z

#hist(theoretical.z)

v.yield = c(23, 19, 17, 18, 24, 26, 21, 14, 18)

z.mean <- mean(v.yield)
z.sd <- sd(v.yield)
z.actual <- sort(v.yield - z.mean)/z.sd

actual.z<-qnorm(z.actual)

plot(theoretical.z, actual.z, type = "p")

library(car)
qqPlot(z.actual)

# the degrees of freedom is 8

Ct <- qt(0.975, df=8) #gives the z ordinate, given a 0.975 area under the curve and a df of 8

z.mean - Ct*z.sd/3
z.mean + Ct*z.sd/3
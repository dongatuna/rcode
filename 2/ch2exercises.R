#1
#calculate the mean and the variance of a 6 sided die

dice<-c(1, 2, 3, 4, 5, 6)

mean(dice)
sd(dice)
var(dice)
#------------------------------------------------------------------------
# 2
# Compute mean, median, sd and MAD

salt<-c(460, 520, 580, 700, 760, 770, 890, 910, 920, 940, 960, 1060, 1100)

summary(salt) #mean = 813.1, median = 890

#the robust measure of spread, MAD
mad(salt)

# calculate the IQR
# 1st quartile = 700, 3rd quartile = 940

summary(salt)
IQR(salt)

boxplot(salt, ylab="mg/salt per 15 mL serving", main="Salt Concentration" )

#box plot is not symmetric, meaning that the distribution is not likely to be normal

library(car)

qqPlot(salt)
#-------------------------------------------------------------------------

#4
rm<-read.csv('2/raw-material-properties.csv')

head(rm)
ncol(rm) #counts the unique number of columns
nrow(rm) #counts the unique number of rows

# Plot the data for size 1
plot(rm$size1, ylab="Particle size: level 1")

boxplot(rm$size1)
# This fu
identify(rm$size1, labels=rm$Sample)


# 1
# Calculate the mean and the variance of a 6 sided die

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
rm<-read.csv('raw-material-properties.csv')

head(rm)
ncol(rm) #counts the unique number of columns
nrow(rm) #counts the unique number of rows

# Plot the data for size 1
plot(rm$size1, ylab="Particle size: level 1")

boxplot(rm$size1)
# This function identifies or tags point points on a scatter plot
identify(rm$size1, labels=rm$Sample)

plot(rm$size2, ylab="Particle size: level 2")
boxplot(rm$size2)
identify(rm$size2, labels = rm$Sample)

plot(rm$size3, ylab = "Particle size: level 3")
identify(rm$size3, labels = rm$Sample)
plot(rm$density1, ylab="Particle density: level 1")
identify(rm$density1, labels=rm$Sample)
plot(rm$density2, ylab="Particle density: level 2")
identify(rm$density2, labels=rm$Sample)
plot(rm$density3, ylab="Particle density: level 3")
identify(rm$density3, labels=rm$Sample)

# The lessons here is that outliers are must be visually spotted
# Thus the need to plot the data.  No reliable software exists to detect outliers

#------------------------------------------------------------------
#5

# Feedback control is an artificial created variability designed to reduce process variability.  
#
# The costs of variability to producers include: rework/inspection costs, disposing products, and discount pricing
# The costs of variability to users include: additional work, no work, low product
#
#-------------------------------------------------------------------
# 7
# import the data
webdata<-read.csv('website-traffic.csv')

# show the head rows
head(webdata)
summary(webdata$Visits)

# plot the histogram
hist(webdata$Visits, xlab = "Number of visits", main = "Website Visits")

# check whether webdata come from normal distribution
# import car library
library(car)

qqPlot(webdata$Visits, ylab = "Website Visits")

web.mean <- mean(webdata$Visits)# The mean is 22.23
web.count <- length(webdata$Visits) # 214
web.sd <- sd(webdata$Visits)

z.10.score<-(10-web.mean)/web.sd # -1.4683
pnorm(z.10.score) # 0.071

z.30.score<-(30-web.mean)/web.sd # 0.9321
pnorm(z.30.score) # 0.824

# The likelihood that 0.824 - 0.071
0.824 - 0.071
#---------------------------------------------------------------------------
# 8
ammonia <-read.csv('ammonia.csv')
head(ammonia)
length(ammonia$Ammonia)

library(car)

qqPlot(ammonia$Ammonia, ylab = 'Ammonia')
fitdistr(ammonia$Ammonia, 'normal')
#---------------------------------------------------------------------------
# 9
viscosity<-c(23, 19, 17, 18, 24, 26, 21, 14, 18)
N=9
mean(viscosity) # The mean is 20
sd(viscosity) # The sd is 3.81

# The distribution of the sample average is normal distribution
# The parameters of the distribution are never known

qnorm(0.025) #1.96
qt(0.025, df = 8) # -2.31

lowbound<-(20-2.31*3.81/sqrt(8)) # 16.89
upperbound<-(20+2.31*3.81/sqrt(8)) # 23.11

lowbound<-(20-1.96*3.5/sqrt(8)) # 17.14
upperbound<-(20+1.96*3.5/sqrt(8)) # 22.86
#-----------------------------------------------------------------------------
# 10

# sd = 40cP
# UB - LB = 60cP

(1.96*40/30)^2
#-------------------------------------------------------------------
AvgLB<-14.67-1.16*-qt(0.025, df=11)/sqrt(12)
AvgLB

AvgUB<-14.67+1.16*qt(0.975, df=11)/sqrt(12)
AvgUB

LB<-14.67-1.16*qt(0.025, df=11)
LB

UB<-14.67+1.16*qt(0.975, df=11)
UB
#---------------------------------------------------------------------
# 13

yield<-read.csv('batch-yields.csv')

head(yield)

library(car)
qqPlot(yield$Yield)
hist(yield$Yield, main = 'Yields from a batch bioreactor')

#-----------------------------------------------------------------------
#16

bv<-read.csv('brittleness-index.csv')

head(bv)

summary(bv$TK104)

summary(bv$TK105)

summary(bv$TK107)

var(bv$TK104)
var(bv$TK105)
var(bv$TK107)
# ----------------------------------------------------------------------

# 17
# import the file
traffic<-read.csv('website-traffic.csv')


# read the table head columns
head(traffic)

# fetch friday's data and summarize
friday<-subset(traffic, traffic$DayOfWeek=='Friday')
sd(friday$Visits)
summary(friday$Visits)

# fetch saturday's data and summarize
saturday<-subset(traffic, traffic$DayOfWeek=='Saturday')
sd(saturday$Visits)
summary(saturday$Visits)

# get the count of fridays and saturdays
length(friday$Visits) # 30
length(saturday$Visits) # 30

# to test the difference in average visits on a Friday and a Saturday
# calculate z value for the differences of averages

# z = (avg.sat.visits - avg.fri.visits)-(avg.par.sat.visits - avg.par.fri.visits)/pooled sd

# confirm that you can pool the variances
qf(0.025, 29, 29) # 0.48
qf(0.975, 29, 29) # 2.1

pooled.var<-((29)*var(saturday$Visits)+(29)*var(friday$Visits))/58
pooled.var #47.1
# since the pooled variance uses t-distribution, confirm both plots come from a normal dist
qqPlot(friday$Visits) # normally distributed
qqPlot(saturday$Visits) # normally distributed

# test the differences between Friday and Saturday's averages
# when using pooled variance, df = sample size a + sample size b - 2
# df = count of 'Fridays' + count of 'Saturdays' - 2
df = 58 # (30-1)+(30-1)

# APPROACH TO CALCULATE Zdiff
# Assume the differences in the parameter averages is zero
# calculate z value = [(avg.sampleofA - avg.sampleofB)-0]/sqrt(pooledvar*2/n)
# pnorm(z value) or pt(z value)

z.value<-{mean(saturday$Visits) - mean(friday$Visits)}/(pooled.var/15)
z.value
# mean.saturday - mean.friday = -5.5 < 0 and therefore z.value is negative.
# use qt(z.value, df=58) to find what the probability distribution the difference between the mean parameters is zero.
# the qt value is 4 %
# There is less than 1 in 20 chances that the difference in p

pt(z.value, df = 58) # The probability that saturday's mean is less than friday's mean by chance is 0.043 
# 4 % is the probability that saturday's mean is greater than friday's mean by chance
# 3.697

pt(1.751956, df=58)
# ---------------------------------------------------------------

y<-c(11, 26, 18, 16, 20, 12, 8, 26, 12, 17, 14)

x<-c(25, 3, 27, 30, 33, 16, 28, 27, 12, 32, 16)	
	
summary(x)
summary(y)

library(car)
qqPlot(y, main = 'Dilution method')
qqPlot(x, main = 'Manometric method')	
	
n = 11 # sample size of each method is 11
var(y) # 34.45
var(x) # 90.85

# check to see if we can pool the variances at 95% confidence interval
qf(0.025, 10, 10) # 0.27
qf(0.975, 10, 10)	# 3.72

# Since the range is from 0.27 to 3.72 and contains 1, we can pool the variance
# pool the variance

var.xy<-10*(var(x)+var(y))/20

z<-(mean(x)-mean(y))/sqrt(var.xy*1/11)
z
#note the df = (11-1) + (11-1)
pt(z, df=20) # 0.99

# there is 1 % random chance that the mean of x is greater than mean of y 
	
#--------------------------------------------------------------------------
#22

qnorm(0.01) # z-score of -2.33

sd.chips<-abs((37.5-35)/qnorm(0.01))
sd.chips # 1.07

z.chips<-(40-37.4)/sd.chips
pnorm(z.chips)

	
	
	
	
	



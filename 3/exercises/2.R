# ----------------------------------------------------------
# import data
batch <-read.csv('batch-yields.csv')

# declare each subgroup sample to have a size of 5
N <- 5

# read the head of the data (batch)
head(batch)
# find the length of the data sequence, n = 300 raw data points
len<-length(batch$Yield)

# summary(batch$Yield) # mean 80.35
# sd(batch$Yield) # 6.61

reshaped <- matrix(batch$Yield, N, len/N)

# calculate the mean and sd of each subgroup
sub.S<-apply(reshaped, 2, sd)
sub.xbar<-apply(reshaped, 2, mean)

# calculate the correction factor for subgroup with n = 5

an.5 <- gamma(N/2)*sqrt(2)/(gamma(N/2-1/2)*sqrt(N-1))

# calculate the grand mean
grand.mean<-mean(sub.xbar)
grand.mean
grand.sd<-mean(sub.S)

# calculate UCL and LCL using Cn = -/+ 3
UCL <- grand.mean+3*grand.sd/(sqrt(5)*an.5)
LCL <- grand.mean-3*grand.sd/(sqrt(5)*an.5)

c(LCL, UCL)
c(sum(grand.mean<LCL), sum(grand.mean>UCL))

# Read the column from the raw data
raw.data<-read.csv('rubber-colour.csv')

#head(raw.data)
#find the number of rows in raw.data - there are 100
samples <-dim(raw.data)[1]

N<-5

# create a matrix called reshaped
# fill reshaped with data from the Colour column of raw.data vector
# matrix syntax is (data, nrow, ncol)
# reshaped has 5 rows and 20 columns -- 
# each column is a subgroup of n = 5
reshaped <-matrix(raw.data$Colour, N, samples/N)

# calculate the mean and sd of each subgroup
# apply function calculates the standard deviation and mean of each subgroun
groups.S <- apply(reshaped, 2, sd)
groups.x <- apply(reshaped, 2, mean)

# calculate the grand mean and grand sd from the subgroups
xdb <- mean(groups.x) # grand mean
s.bar <- mean(groups.S) # grand sd

# calculate the correction factor, for n  = 5
# correction factor is used to correct s.bar
an.5 <- sqrt(2)*gamma(N/2)/(2*gamma(N/2-1/2))

# calculate the lower and the upper control limit
LCL <- xdb - 3*s.bar/(an.5*sqrt(N)) # 225
UCL <- xdb + 3*s.bar/(an.5*sqrt(N)) # 252

sum(4, 5)

c(sum(4, 5))
# display the results
c(LCL, UCL)
c(sum(groups.x<LCL), sum(groups.x>UCL)) # are there any subgroup outliers? [Yes]

# plot the results
# help(par)
par(mar=c(2, 4.2, 2, 0.2))
plot(groups.x, ylim=c(LCL - 2, UCL+2),
     ylab = "Subgroup averages using n = 5",
     xlab = "Sequence order",
     cex.lab = 1.5,
     cex.main =1.8,
     cex.sub = 1.8,
     cex.axis = 1.8)

abline(h=LCL, col="red")
abline(h=UCL, col="red")

# now exclude the unusual column of data, column 14

reshaped <-reshaped[, -14]
groups.S <-apply(reshaped, 2, sd)
groups.x <-round(apply(reshaped, 2, mean))

xdb <- mean(groups.x)
s.bar<-mean(groups.S)
LCL <- xdb - 3*s.bar/(an.5*sqrt(N))
UCL <- xdb + 3*s.bar/(an.5*sqrt(N))

c(LCL, UCL)
c(sum(groups.x<LCL), sum(groups.x>UCL)) 

# re-plot the data
par(mar=c(2, 4.2, 2, 0.2))
plot(groups.x, ylim=c(LCL - 2, UCL+2),
     ylab = "New subgroup averages using n = 5",
     xlab = "New sequence order",
     cex.lab = 1.5,
     cex.main =1.8,
     cex.sub = 1.8,
     cex.axis = 1.8)

abline(h=LCL, col="red")
abline(h=UCL, col="red")

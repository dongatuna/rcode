# imports data of boards
boards<-read.csv('six-point-board-thickness.csv')

head(boards)
length(boards$Date.Time)

# help(identify)
# help(labels)

library(ggplot2)

df <- data.frame(boards$Date.Time, boards$Pos1, boards$Pos2, boards$Pos3, boards$Pos4, boards$Pos5, boards$Pos6)

ggplot(df, aes(boards$Date.Time, y=measurement, color=variable))+
  geom_point(aes(y=boards$Pos1, col="Pos 1"))+
  geom_point(aes(y=boards$Pos2, col="Pos 2"))+
  geom_point(aes(y=boards$Pos3, col="Pos 3"))+  
  geom_point(aes(y=boards$Pos4, col="Pos 4"))+
  geom_point(aes(y=boards$Pos5, col="Pos 5"))+  
  geom_point(aes(y=boards$Pos6, col="Pos 6"))

# see: https://www.sixhat.net/plotting-multiple-data-series-in-r.html

# Collect the first 500 data points for phase 1 operations
# In phase 1, we will identify any boards that appear to be unusual in the first 500 measurements

ph1.Date.Time <- boards$Date.Time[1:500]
ph1.pos1 <- boards$Pos1[1:500]
ph1.pos2 <- boards$Pos2[1:500]
ph1.pos3 <- boards$Pos3[1:500]
ph1.pos4 <- boards$Pos4[1:500]
ph1.pos5 <- boards$Pos5[1:500]
ph1.pos6 <- boards$Pos6[1:500]


# bind the above columns
data.500 <- cbind(ph1.Date.Time, ph1.pos1, ph1.pos2, ph1.pos3, ph1.pos4, ph1.pos5, ph1.pos6)

df <- data.frame(ph1.Date.Time, ph1.pos1, ph1.pos2, ph1.pos3, ph1.pos4, ph1.pos5, ph1.pos6)

ggplot(df, aes(ph1.Date.Time, y=value, color=variable))+
  geom_point(aes(y=ph1.pos1, col="Phase 1 Pos 1"))+
  geom_point(aes(y=ph1.pos2, col="Phase 1 Pos 2"))+
  geom_point(aes(y=ph1.pos3, col="Phase 1 Pos 3"))+  
  geom_point(aes(y=ph1.pos4, col="Phase 1 Pos 4"))+
  geom_point(aes(y=ph1.pos5, col="Phase 1 Pos 5"))+  
  geom_point(aes(y=ph1.pos6, col="Phase 1 Pos 6"))

# ------------------------------------------------------------------------------------------------
# each sample subgroup will be 5
N <- 5

# subdivide each vector of 500 into 100 subgroups of 5

# calculate the mean and standard deviation of each subgroup

# calculate the grand standard deviation and the unbiased estimator, a.n.

# use critical value of Cn = -/+3, the unbiased estimator, sd, and n =5 to set bounds above and below the mean

# graph 

# check if there is any data point in the vector that is outside these bound


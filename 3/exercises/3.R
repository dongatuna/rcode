# imports data of boards
boards<-read.csv('six-point-board-thickness.csv')

head(boards)
length(boards$Date.Time)

# help(identify)
# help(labels)

plot(boards$Pos1)



# see: https://www.sixhat.net/plotting-multiple-data-series-in-r.html
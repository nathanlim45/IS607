#this table has null temp values (JFK)
flight1 <- read.csv(file="/Users/shared/flightfromnewyork1.csv",header=T)
head(flight1)
table(flight1$origin)


#I took approx. temp from EWR to JFK based on the date and the time 
flight2 <- read.csv(file="/Users/shared/flightfromnewyork2.csv",header=T)
newflight <- flight2[order(flight$month, flight$day), ]   #reorder by month and day
head(newflight)
table(newflight$origin)


#week 6 assignment IS607
#Seoungyoon Lim
#NYC The 3rd-to-8th-grade Math test 2013-2014


#1.Choose and load R dataset
math <- read.csv("/Users/seoungyoonlim/Documents/cuny/IS607/week6/MathResults20132014.csv")
str(math)

#Since Grade and Year variable are integer 
# in csv file, I want to change them to factors first
math$Grade<-as.factor(math$Grade)
math$Year<-as.factor(math$Year)

#2.Generate summary level descriptive statistics
summary(math)

#3.Determine the frequency
table(math$Category)

#4. Determine the frequency two categorical variables
table(math$Category, math$Borough)
table(math$Year, math$Borough)

#5.Create a graph for a single numeric variable
hist(math$Mean) #total distribution of math mean of students

# math mean boxplot 2013 and 2014 based on ethnic group
math_2013 <- math[which(math$Year==2013,),]
A13 <-math_2013[which(math$Category=='Asian',),]
B13 <-math_2013[which(math$Category=='Black',),]
W13 <-math_2013[which(math$Category=='White',),]
H13 <-math_2013[which(math$Category=='Hispanic',),]
boxplot(A13$Mean,B13$Mean,W13$Mean,H13$Mean, main='2013 Math test', names=c('Asian','Black','White','Hispanic') )

math_2014 <- math[which(math$Year==2014,),]
A14 <-math_2014[which(math$Category=='Asian',),]
B14 <-math_2014[which(math$Category=='Black',),]
W14 <-math_2014[which(math$Category=='White',),]
H14 <-math_2014[which(math$Category=='Hispanic',),]
boxplot(A14$Mean,B14$Mean,W14$Mean,H14$Mean, main='2014 Math test', names=c('Asian','Black','White','Hispanic') )


# math mean boxplot based on Borough
bx <- math[which(math$Borough=='BRONX',),]
mh <- math[which(math$Borough=='MANHATTAN',),]
qn <- math[which(math$Borough=='QUEENS',),]
bn <- math[which(math$Borough=='BROOKLIN',),]
st <- math[which(math$Borough=='STATEN ISLAND',),]

hist(st$Mean, main='histogram of Staten island students Math result')

#ggplot
library(ggplot2)
qplot(Mean, data=st, binwidth=10, main='histogram of Staten island students Math result')

#6.Create a graph for a two numeric variable
#number of students and test score do not show corelation
plot(math$Number.Tested, math$Mean)
qplot(Number.Tested, Mean, data=math)

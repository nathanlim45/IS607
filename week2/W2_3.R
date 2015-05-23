data <- read.csv(file.choose(), header=TRUE) #read.csv file that is extracted from postgres
str(data)
head(data)
attach(data)

#To check the correlation between weather and delay, I thought it is not a good way to compare absolute delay time with other weather factor.
#Because how much time is delayed does not show the effect of weather condition. 'How much time' can be decided how long the weather condition lasts.
#Therefor, Instead of that, 'how many times are delayed under certain condition?' this can be the question.
#To get the answer, check whether the frequency of the delay is increased according to the increase of the each weather factor.
#through the coding below, I found that the most influentiol weather condition is the wind speed.

#wind speed and rate of delay 
x<-seq(from = 0, to = 35, by = 5) #break the wind speed level
y<-numeric(length=8)
for (i in x){#count the delaydays per each section of speed, then divide by total days that have the speed section
        delaydays<-sum(dep_delay>0 & wind_speed>=i & wind_speed<i+5, na.rm=TRUE)
        days<-sum(wind_speed>=i & wind_speed<i+5, na.rm=TRUE)
        y[i/5+1]<-delaydays/days
}
y
plot(y~x,xlab='Wind speed', ylab='rate of delay', type='l', col='red')
[1] 0.4297985 0.4323317 0.4403410 0.4472508 0.4575300 0.4677040 0.5583501 0.5581395 
# we can see that the rate of delay is increased according to the increase of the wind speed, 
# espiecially at the point over the speed 30, the rate of delay is increased abrubtly.

#visibility and rate of delay 
vis<-seq(from = 0, to = 10, by = 1)
y<-numeric(length=11)
for (i in vis){
        delaydays<-sum(dep_delay>0 & visib>=i & visib<i+1, na.rm=TRUE)
        days<-sum(visib>=i & visib<i+1, na.rm=TRUE)
        y[i+1]<-delaydays/days
}
y
plot(y~vis,xlab='Visibility', ylab='rate of delay', type='l', col='red')
[1] 0.4779583 0.5371861 0.5303607 0.5192997 0.5062692 0.4977632 0.4819356 0.4742678
 [9] 0.4849720 0.4885346 0.4238752
 #the rate of delay is not increased according to the increase of the visibility

#wind_gust and rate of delay 
gus<-seq(from = 0, to = 1300, by = 100)
y<-numeric(length=13)
for (i in gus){
        delaydays<-sum(dep_delay>0 & wind_gust>=i & wind_gust<i+100, na.rm=TRUE)
        days<-sum(wind_gust>=i & wind_gust<i+100, na.rm=TRUE)
        y[i/100+1]<-delaydays/days
}
y
plot(y~gus,xlab='Wind gust', ylab='rate of delay', col='red')
[1] 0.4363954       NaN       NaN       NaN       NaN       NaN       NaN       NaN
 [9]       NaN       NaN       NaN       NaN 0.3323263       NaN
  #the rate of delay is not increased according to the increase of the wind_gust
#also most of the value are null

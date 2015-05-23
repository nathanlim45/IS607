library(tidyr)
library(dplyr)

flight<- read.table(header = TRUE, text = "
where ontime delayed airline 
la    497    62      AS
ph    221    12      AS
sd    212    20      AS
sf    503    102     AS
st    1841   305     AS
la    694    117     AW
ph    4840   415     AW
sd    383    65      AW
sf    320    129     AW
st    201    61      AW
")
new.flight<-mutate(flight, delayrate=delayed/(ontime+delayed))
new.flight
AS<-filter(new.flight, airline=='AS')
AS
mean(AS$delayrate)
sum(AS$delayed)/(sum(AS$delayed)+sum(AS$ontime))
AW<-filter(new.flight, airline=='AW')
mean(AW$delayrate)
sum(AW$delayed)/(sum(AW$delayed)+sum(AW$ontime))
library(ggplot2)
p<-ggplot(new.flight, aes(where, delayrate))
p+geom_point(aes(color=factor(airline)))


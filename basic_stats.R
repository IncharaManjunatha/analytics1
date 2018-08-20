# Basic stats

x=ceiling(rnorm(10000, mean=60, sd=20)) 
mean(x)
median(x)

# there is no mode
table(x) # calculates the frequency of every data point
sort(table(x),decreasing = T) #arranges data in desc order

library(modeest)
mlv(x,method='shorth')  # to calculate mode

quantile(x)
quantile(x,seq(0.1,1,by=0.1)) # decile
quantile(x,seq(0.01,1,by=0.01)) # percentile

# Frequency table
library(fdth)   # load fdth
ftable1=fdt(x)
ftable1

library(e1071)  # load e1071
plot(density(x))
e1071::skewness(x) # apply the skewness
kurtosis(x)

sd(x); var(x)   # ; makes two commands to execute once
cov(women$weight, women$height)
cor(women$height, women$weight)

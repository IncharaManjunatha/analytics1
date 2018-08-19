# Data Structures

#vectors----
v1=1:100  # create vector from 1 to 100

v2=c(1,4,5,10) # create specific set of numbers

class(v1) # to find the thype of vector

class(v2)

v3=c('a','aashish','rajesh')

class(v3)

v4=c(TRUE,FALSE,T,F,T)

class(v4)

#summary of vectors
mean(v1)
median(v1)
sd(v1)
var(v1)
hist(v1)
hist(women$height)

# find all values more than or equal to 5
v2
v2[v2>=5]

# Normal distribution
x=rnorm(60, mean=60, sd=10)
x
plot(x)
hist(x)
plot(density(x))
abline(v=60)

# rectangles and densityline

hist(x, freq=F)  #F-false
lines(density(x))
hist(x, breaks=10, col=1:10)
length(x)
sd(x)

?sample

x1=LETTERS[5:20]
x1

set.seed(1234)
y1=sample(x1)
y1

(y2=sample(x1, size=5))
set.seed(1234)
y3=sample(y2)
y3


(gender=sample(c('M','F'), size=60, replace=TRUE)) # default is 50% for male and female

(gender=sample(c('M','F'), size=10000000, replace=TRUE, prob=c(.3,.7)))

table(gender) # count

(t1=table(gender))

prop.table(t1) # gives in % form

pie(t1)

barplot(t1, col=1:2, horiz=T)


#matrix----

#array----
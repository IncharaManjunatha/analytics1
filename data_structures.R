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

m1= matrix(1:24, nrow=4) # filling column wise
m1

?matrix

(m2=matrix(1:24, nrow=4, byrow = T))

(m3=matrix(1:24, ncol=4, byrow = T))

#x=runif(60,60,100)

x=trunc(runif(60,60,100))
x
# round, trunc, ceiling, floor
plot(density(x))
(m4= matrix(x, ncol=6))

colSums(m4) # column sum

rowSums(m4) # row sum

rowMeans(m4) # mean of rows

colMeans(m4) # mean of columns

m4[m4>67]

m4[m4>67 & m4<89]

m4

m4[10, ]    # display 10th row

m4[, c(1,3,5)]

m4[8:10, ]

m4[8:10, c(1,3,5)]

rowSums(m4[8:10, c(1,3,5)])

#array----




#data.frame

# rollno, name, gender, course, marks1, marks2, grades


(rollno = 1:60)

(name=paste('student', 1:60, sep = '-'))  # 

name[1:10]

name[10:20]

name[c(15,20,37)]

name[-1]

name[-c(1:10)]

rev(name)

name[60:1]

name[-c(1:10, 20:30)]

(gender=sample(c('Male', 'Female'), size=60, replace=T,  prob=c(.3,.7)))

(course=sample(c('MBA','BBA','FPM'), size=60, replace=T, prob=c(.3,.3,.3))) 

(marks1=ceiling(rnorm(60, mean=65, sd=7)))

(marks2=ceiling(rnorm(60, mean=60, sd=11)))

(grades=sample(c('A','B','C'), size=60, replace=T)) 

#students=data.frame(rollno, name, gender, course, marks1, marks2, grades)

students=data.frame(rollno, name, gender, course, marks1, marks2, grades, stringsAsFactors = F)

class(students)

summary(students)

students[, c('name')]

students[students$gender == 'Male',]

students[students$gender == 'Male', c('rollno','gender', 'marks1')]

students[students$marks1 > 55 | students$marks2 < 85, c('name', 'marks1')]

students[students$grades == 'A' & students$gender == 'Female' ,]

students$gender

t1=table(students$gender)

barplot(t1)

barplot(table(students$course), ylim=c(0,50), col=1:3)

text(1:3, table(students$course)+5, table(students$course))

str(students) # description about each column

nrow(students) # no of rows

names(students) # variable names

dim(students) # dimension of data frame

head(students) # default=6 top data points

head(students, n=7)

tail(students) # bottom data points

tail(students, n=10)

students[1:10,]

students[c(15:25),]

#avg marks scored by each gender in marks1

aggregate(students$marks1, by = list(students$gender), FUN=mean)

#max marks scored in each course
aggregate(students$marks2, by = list(students$course), FUN=max)

#avg marks scogred by each gender in each course in marks2
aggregate(students$marks2, by = list(students$course, students$gender), FUN=mean)

#dplyr

library(dplyr)


#piping
students %>% group_by(gender) %>% summarise(mean(marks1))

students %>% group_by(course,gender) %>% summarise(mean(marks1))

students %>% group_by(course,gender) %>% summarise(meanmarks2=mean(marks2), min(marks2), max(marks2))

students %>% group_by(course,gender) %>% summarise(meanmarks1=mean(marks1), min(marks2), max(marks2)) %>% arrange(meanmarks1)

students %>% arrange(desc(marks1)) %>% filter(gender=='Male') %>% top_n(5)

students %>% arrange(desc(marks1)) %>% filter(gender=='Male') %>% head(5)                                                   
#10% of rows
sample_frac(students,size=0.1, replace=FALSE)

students %>% sample_frac(0.1)

#top 5 rows
sample_n(students,5)

students %>% sample_n(10)

students %>% sample_n(10) %>% arrange(course)

students %>% sample_frac(0.1) %>% arrange(course) %>% select(name,gender)

students %>% arrange(course, grades, marks1) %>% select(course, grades, marks1) %>% filter(course == 'BBA')

students %>% group_by(course,gender) %>% arrange(marks2) %>% top_n(2) 

#factor
names(students)
students$gender= factor(students$gender)
summary(students$gender)


summary(students$course)
students$course= factor(students$course, ordered = T)
summary(students$course)
(course=sample(c('MBA','BBA','FPM'), size=60, replace=T, prob=c(.3,.3,.3))) 
summary(students$course)
students$course=factor(students$course, ordered = TRUE, levels=c('FPM','MBA','BBA'))
summary(students$course)
names(students)

students$grades = factor(students$grades, ordered=T, levels('C','B','A'))
students$grades
table(students$grades)
barplot(table(students$grades), col=5:7)


students
write.csv(students, './data/iimtrichy.csv')
students2= read.csv('./data/iimtrichy.csv')
head(students2)

# data frame recreation
# rollno, name, gender, course, marks1, marks2, grades


(rollno = 1:60)

(name=paste('student', 1:60, sep = '-'))  # 

name[1:10]

name[10:20]

name[c(15,20,37)]

name[-1]

name[-c(1:10)]

rev(name)

name[60:1]

name[-c(1:10, 20:30)]

(gender=sample(c('Male', 'Female'), size=60, replace=T,  prob=c(.3,.7)))

(course=sample(c('MBA','BBA','FPM'), size=60, replace=T, prob=c(.3,.3,.3))) 

(marks1=ceiling(rnorm(60, mean=65, sd=7)))

(marks2=ceiling(rnorm(60, mean=60, sd=11)))

(grades=sample(c('A','B','C'), size=60, replace=T)) 

#students=data.frame(rollno, name, gender, course, marks1, marks2, grades)

students=data.frame(rollno, name, gender, course, marks1, marks2, grades, stringsAsFactors = F)

students
write.csv(students, './data/iimtrichy.csv')
students2= read.csv('./data/iimtrichy.csv')
head(students2)

# import a file

students3=read.csv(file.choose()) 
head(students3)
students3=students3[,-1]
head(students3)













# clustering

marks1 = c(3,1,4,5,9,6)
marks=data.frame(marks1)
length(marks1)
plot(marks)

k1= kmeans(marks, centers=2)
k1
cbind(marks, k1$cluster)

(marks2= sample(1:10, size=7))
newmarks=data.frame(marks2)
newmarks
k2= kmeans(newmarks, centers=4) # numerical values in dataframe
k2
cbind(newmarks, k2$cluster)

#Optimal Number of Clusters in data
#Reduce total within ss

iris
table(iris$Species)

data = iris[-5]
head(data)

km1= kmeans(data,centers=1)
km1$tot.withinss


km2= kmeans(data,centers=2)
km2$tot.withinss
km2$withinss

km3= kmeans(data,centers=3)
km3$tot.withinss

km4= kmeans(data,centers=4)
km4$tot.withinss

km5= kmeans(data,centers=5)
km5$tot.withinss

km1$tot.withinss ; km2$withinss ; km3$tot.withinss ; km4$tot.withinss
; km5$tot.withinss

#Selecting the number of clusters
library(NbClust)
# method can be max,minand average
nc = NbClust(data, distance="euclidean",min.nc=2, max.nc=15, method="average")

# clustering with ideal k=3
kiris= kmeans(data, centers = 3)
kiris$centers

cbind(iris$Species, data, kiris$centers)

    # mtcars dataset
names(mtcars)
data2 = mtcars[c('mpg','disp','hp','wt')]
head(data2)
nc = NbClust(data2, distance="euclidean",min.nc=2, max.nc=15, method="average")
det(as.matrix(mtcars))
?na.action
km3= kmeans(data,centers=3)
km3$tot.withinss

cbind(km1$tot.withinss, km2$tot.withinss, km3$tot.withinss, km4$tot.withinss,km5$tot.withinss)

#we select no clusters at elbow point
#adding more clusters does not significantly reduce total withinss


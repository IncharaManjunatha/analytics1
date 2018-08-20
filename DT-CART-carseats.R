# Decision Trees : type regression tree 

library(ISLR)
data(Carseats) # dataset
head(Carseats)
names(Carseats)
?Carseats
data = Carseats
head(data)

#Libraries for Decision Tree
library(rpart)
library(rpart.plot)

#Model

#(Sales ~ .) except sales
decisiontree = rpart(Sales ~ . , data=data, method='anova' )
decisiontree
#rpart.plot(decisiontree)
rpart.plot(decisiontree, cex=.8)

# cp is complexity parameter used to prune variables
# cp and number of splits are inversely proportional
# cp is where the cross validation error is minimum 
#this is large tree, so prune it: check cp
printcp(decisiontree)
prunetree = prune(decisiontree, cp=0.05)
prunetree
rpart.plot(prunetree, nn=T)

#improve the plot
rpart.plot(prunetree, nn=T, cex=.8, type=4)

testdata= sample(data,2)
testdata


predict(prunetree, ndata=testdata, type=1)


#https://www.datacamp.com/community/tutorials/decision-trees-R

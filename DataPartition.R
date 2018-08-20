# partition the given data into train and test data

mtcars
dim(mtcars)

library(caret) # helps partition data for classification
#index-createDataPartition(y=mtcars$am, p=0.7, list=F) # mention probability

index = sample(x=1:nrow(mtcars), size=.7 * nrow(mtcars)) # .7 *32
index
train=mtcars[index,]
test=mtcars[-index,]
nrow(train)
nrow(test)
nrow(train) + nrow(test)

library(olsrr)
fit = lm(mpg~ disp + hp + wt + qsec, data = train)
k = ols_step_all_possible(fit)
plot(k)
k          # display combinations of variables with some assumptions
summary(lm(mpg ~ wt, data= train))
summary(lm(mpg ~ wt + hp, data= train))

library(gvlma)
gvmodel= gvlma(fit) # checking for assumptions
gvmodel    # assumptions are acceptable or not
summary(fit)
finalmodel = lm(mpg ~ wt + hp, data= train)
summary(finalmodel)
(predictedvalues=predict(finalmodel,ndata = test))
cbind(test$mpg,predictedvalues)

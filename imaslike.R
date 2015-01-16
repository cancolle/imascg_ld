library(MASS)
library(dplyr)
#training data
sample <- read.csv("lig.csv")
data <- select(sample, height,age,B,W,H,Red,Green,Blue,like)

#discriminant
result <- lda(like~., data=data)
result$scaling
apply(result$means%*%result$scaling,2,mean)

#Cross Validation
result2 <- lda(like~., data=data, CV=T)
cv.result2 <- table(data[,9],result2$class)
sum(cv.result2[row(cv.result2)==col(cv.result2)])/sum(cv.result2)
sum(cv.result2[row(cv.result2)!=col(cv.result2)])/sum(cv.result2)

#predict
sample2 <- read.csv("cgdata.csv")
test <- select(sample2, height,age,B,W,H,Red,Green,Blue)
testresult <- predict(result, test)
finish <-data.frame(name= sample2$name, result=testresult$class)
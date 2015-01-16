library(e1071)
library(dplyr)
#training data
sample <- read.csv("lig.csv")
data <- select(sample, height,age,B,W,H,Red,Green,Blue,like)

#SVM
result <- svm(like~., data=data, 
              method="C-classification", 
              kernel="linear", 
              cost=5)

#evaluation
resultp <- predict(result, data)
resultptable <- table(resultp, data$like)
sum(resultptable[1,1]+resultptable[2,2])/
  sum(resultptable)

#predict
sample2 <- read.csv("cgdata.csv")
test <- select(sample2, height,age,B,W,H,Red,Green,Blue)
testresult <- predict(result, test)
finish <-data.frame(name= sample2$name, result=testresult)
library(h2o)
library(dplyr)

#Deep Learning
localH2O = h2o.init(ip = "localhost", port = 54321, startH2O = TRUE)
lig = h2o.importFile(localH2O, path = paste0(getwd(), "/lig_without_name.csv"))
result <- h2o.deeplearning(
  x = c("height", "age", "B", "W", "H", "Red", "Green", "Blue"), 
  y ="like", data = lig, activation = "Tanh")

#evaluation
h2opredict <- function(data)
{
  h2o.predict(result, newdata=data) %>%
    as.data.frame %>% 
    select(predict) %>% 
    unlist  
}
resultp <- h2opredict(lig)
resultptable <- table(resultp, lig %>% as.data.frame %>% select(like) %>% unlist)
sum(resultptable[1,1]+resultptable[2,2])/sum(resultptable)

#predict
cgdata = h2o.importFile(localH2O, path = paste0(getwd(), "/cgdata_without_name.csv"))
resultp <- h2opredict(cgdata)
#show result
data.frame(name=read.csv("cgdata.csv") %>% select(name), resultp)

#shutdown h2o
h2o.shutdown(localH2O)
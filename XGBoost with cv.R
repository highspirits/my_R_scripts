#This is Rohan's implementation of xgboost

if(require("dummies")) {
  install.packages("dummies")
  library(dummies)
}

if(require("plyr")) {
  install.packages("plyr")
  library(plyr)
}

if(require("xgboost")) {
  install.packages("xgboost")
  library(xgboost)
}

if(require("RCurl")) {
  install.packages("RCurl")
  library(RCurl)
}

if(require("pROC")) {
  install.packages("pROC")
  library(pROC)
}


source_https <- function(url)
{
  eval(parse(text=getURL(url,followlocation=T,cainfo=system.file("CurlSSL","cacert.pem",package="RCurl"))),envir=.GlobalEnv)
}

source_https("https://raw.githubusercontent.com/rohanrao91/Models_CV/master/XGBoost.R")

#model building
#save test ID in submit variable to be used later
#remove target variable and ID variable (if present) from train and move it to 'y'
#model_xgb_1 <- XGBoost(X_train,y,X_test,cv=5,objective="reg:linear",nrounds=500,max.depth=10,eta=0.1,colsample_bytree=0.5,seed=235,metric="rmse",importance=1)

#
#"reg:linear" --linear regression
#"reg:logistic" --logistic regression
#"binary:logistic" --logistic regression for binary classification, output probability
#"binary:logitraw" --logistic regression for binary classification, output score before logistic transformation
#"count:poisson" --poisson regression for count data, output mean of poisson distribution
#max_delta_step is set to 0.7 by default in poisson regression (used to safeguard optimization)
#"multi:softmax" --set XGBoost to do multiclass classification using the softmax objective, you also need to set num_class(number of classes)
#"multi:softprob" --same as softmax, but output a vector of ndata * nclass, which can be further reshaped to ndata, nclass matrix. The result contains predicted probability of each data point belonging to each class.
#"rank:pairwise" --set XGBoost to do ranking task by minimizing the pairwise loss

#submission file
#test_xgb_1 <- model_xgb_1[[2]]

#Adding predictions. submit should have the ID's of row numbers
#submit = data.frame(ID = temp$ID, test_xgb_1$pred_xgb)

#write to output
#write.csv(submit, "./submit.csv", row.names=F)




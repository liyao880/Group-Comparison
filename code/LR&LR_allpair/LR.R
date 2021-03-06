setwd("/Users/apple/GitHub/Group-Comparison/data")
library(LiblineaR)
library(mclust)

# Logistic regression for algorithm I
## Fit model on training dataset
accuracy1=1:10
for (i in 1:10){
  accuracy1[i]=LiblineaR(X_LR_train,Y_train, type=0,cost=i,cross=5)
}
fital1=LiblineaR(X_LR_train,Y_train,type=0,cost=which.max(accuracy1))

## Predicting on the testing dataset
fital1.pre=predict(fital1,X_LR_test, proba = FALSE,decisionValues = FALSE)$predictions
fital1.prerror=classError(fital1.pre,Y_test)

# Logistic regression for algorithm II
accuracy=1:10
for (i in 1:10){
  accuracy[i]=LiblineaR(X_train,Y_train, type=0,cost=i,cross=5)
}

fit=LiblineaR(X_train,Y_train, type = 0,cost=which.max(accuracy))

## Predicting on the testing dataset
fit.pre=predict(fit,X_test, proba = FALSE,decisionValues = FALSE)$predictions
fit.prerror=classError(fit.pre,Y_test)

# Logistic regression for player index: algorithm I
accuracy1=1:10
for (i in 1:10){
  accuracy1[i]=LiblineaR(X_PL_train,Y_train, type=0,cost=i,cross=5)
}
fitp1=LiblineaR(X_PL_train,Y_train,type=0,cost=which.max(accuracy1))

## Predicting on the testing dataset
fitp1.pre=predict(fital1,X_LR_test, proba = FALSE,decisionValues = FALSE)$predictions
fitp1.prerror=classError(fital1.pre,Y_test)

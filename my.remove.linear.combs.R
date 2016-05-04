#Identify and remove attributes causing linear combinations
#The caret::findLinearCombos() function uses the QR-expansion of matrix transfers to set out linear combinations of them (if they exist)
#https://www.mql5.com/en/articles/2029

my.rem.linear.combs = function(df) {
  
  if(require("caret")) {
    install.packages("caret")
    library(caret)
  }
  
  #identify linear combinations
  df.lc = findLinearCombos(df)
  
  #remove attributes causing linear combinations
  df = df[, -df.lc$remove]
  
  #Return final data frame
  return(df) 
}

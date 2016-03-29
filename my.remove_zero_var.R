#Function to identify zero variance terms. This function returns the original dataframe after removing zero variance adfributes

my.rem.zer.var = function(df) {

  if(require("caret")) {
    install.packages("caret")
    library(caret)
  }

  #identify Zero Variance adfributes
  df.zv = nearZeroVar(df, saveMetrics = T)
  rem.col = names(df[df.zv$zeroVar])

  #remove zero variance adfributes
  df = df[, !(names(df) %in% rem.col)]

  #Return final data frame
  return(df) 
  }
  
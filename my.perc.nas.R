#this function gives the % of missing values in a dataframe

my.perc.nas = function(df){
  
  total.nas = sapply(df, function(x) sum(is.na(x)))
  total.nas.perc = round((total.nas/nrow(df)) * 100, 2)
  return(total.nas.perc)
}
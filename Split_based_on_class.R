#this function splits a dataframe based on the class of its columns
#my.split.boc = my.split.based_on_class function

my.split.boc = function(df) {
  return((split(df, sapply(df, function(x) paste(class(x), collapse = " ")))))
}

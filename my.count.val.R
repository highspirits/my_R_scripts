#Function to add a column having the count of specific values - across rows
#New column added is "count0"

my.count.val = function(df) {
  df$count0 = apply(df, 1, my.count.fun)
  return(df)
}
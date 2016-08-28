#Plot graph using ggplot2
my.plot = function(df, x1 ,y1) {
  ggplot(df, aes(x1)) + geom_point((aes(y = y1)))
}
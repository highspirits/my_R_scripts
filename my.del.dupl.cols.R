#Function to remove identical attributes

my.del.dupl.cols = function(df) {

features_pair <- combn(names(df), 2, simplify = F)
toRemove <- c()
del.col.count = 0
for(pair in features_pair) {
  f1 <- pair[1]
  f2 <- pair[2]
  
  if (!(f1 %in% toRemove) & !(f2 %in% toRemove)) {
    if (all(df[[f1]] == df[[f2]])) {
      cat(f1, "and", f2, "are equal. So deleting", f2, "\n")
      toRemove <- c(toRemove, f2)
      del.col.count = del.col.count + 1
    }
  }
}

cat("total attributes deleted", del.col.count, "\n")

feature.names <- setdiff(names(df), toRemove)

df = df[, feature.names]

return(df)

}
#Function to return all duplicate rows based on a colunm name

my.dupl.rows = function(df, col.name){
  
  df.dupl.rows = (duplicated(df$col.name) | duplicated(df$col.name, fromLast = T))
  return(df[df.dupl.rows, ])
  
}
Factly.Stats = function(df) {
#Convert all the data to upper case
df.upper = lapply(df, toupper)

#Identify duplicate names
df.dupl.binary = duplicated(df.upper$Name, fromLast = F) | duplicated(df.upper$Name, fromLast = T)
df.upper.dataframe = as.data.frame(df.upper)
df.dupl.rows = df.upper.dataframe[df.dupl.binary, ]

#Remove Lecturers working in same college - they are not duplicates!
df.dupl.binary = duplicated(df.dupl.rows[, c("Name", "Institute.Name")], fromLast = F) | duplicated(df.dupl.rows[, c("Name", "Institute.Name")], fromLast = T)
df.dupl.final = df.dupl.rows[!df.dupl.binary, ]
write.csv(df.dupl.final, "df.Dupl.Final.csv", row.names = F)

#Get the statistics from the duplicate data

#Number of Faculty
cat('\n\nTotal Number of Faculty\n')
cat(nrow(df))

#Number of Faculty with matching first and last name
cat('\n\nNumber of Faculty with matching first and last name\n')
cat(nrow(df.dupl.final))

# Percentage of duplicate data
cat('\n\nPercentage of duplicate data\n')
cat(round(nrow(df.dupl.final)/nrow(df), digits = 4)*100)

#Number of Colleges
cat('\n\nTotal Number of Colleges\n')
cat(length(unique(df$`Institute Name`)))

# Number of colleges with atleast one duplicate faculty
cat('\n\nNumber of colleges with atleast one duplicate faculty\n')
cat(length(unique(df.dupl.final$Institute.Name)))

# Percentage of collages with atleast one duplicate faculty
cat('\n\nPercentage of collages with atleast one duplicate faculty\n')
dupl.inst.count = length(unique(df.dupl.final$Institute.Name))
total.inst.count = length(unique(df$`Institute Name`))
cat(round((dupl.inst.count/total.inst.count), digits = 4) * 100)

}

#Load AP Engineering, MCA & Management Faculty
ap.engg = read_excel("C:/Sreedhar/Data Science Competitions/Factly/Data/Excel Files/AP/AP Engineering Faculty.xlsx")
ap.mgmt = read_excel("C:/Sreedhar/Data Science Competitions/Factly/Data/Excel Files/AP/AP Management Faculty.xlsx")
ap.mca = read_excel("C:/Sreedhar/Data Science Competitions/Factly/Data/Excel Files/AP/AP MCA Faculty.xlsx")

#Load Telengana Engineering, MCA & Management Faculty
tel.engg = read_excel("C:/Sreedhar/Data Science Competitions/Factly/Data/Excel Files/Telangana/Telangana Engineering Faculty.xlsx")
tel.mgmt = read_excel("C:/Sreedhar/Data Science Competitions/Factly/Data/Excel Files/Telangana/Telangana Management Faculty.xlsx")
tel.mca = read_excel("C:/Sreedhar/Data Science Competitions/Factly/Data/Excel Files/Telangana/Telangana MCA Faculty.xlsx")

#Combine AP and Telangana Data
ap.tel.data = rbind(ap.engg, ap.mca, ap.mgmt, tel.mca, tel.engg, tel.mgmt)

#Convert all the data to upper case
ap.tel.data.upper = lapply(ap.tel.data, toupper)

#Identify duplicate names
ap.tel.dupl.binary = duplicated(ap.tel.data.upper$Name, fromLast = F) | duplicated(ap.tel.data.upper$Name, fromLast = T)
ap.tel.data.upper.dataframe = as.data.frame(ap.tel.data.upper)
ap.tel.data.dupl.rows = ap.tel.data.upper.dataframe[ap.tel.dupl.binary, ]
 
#Remove Lecturers working in same college - they are not duplicates!
ap.tel.dupl.binary = duplicated(ap.tel.data.dupl.rows[, c("Name", "Institute.Name")], fromLast = F) | duplicated(ap.tel.data.dupl.rows[, c("Name", "Institute.Name")], fromLast = T)
ap.tel.data.dupl.final = ap.tel.data.dupl.rows[!ap.tel.dupl.binary, ]
write.csv(ap.tel.data.dupl.final, "Ap.Tel.Data.Dupl.Final.csv", row.names = F)

#Get the statistics from the duplicate data

#Number of Colleges = 1098
cat('Number of Colleges')
length(unique(ap.tel.data$`Institute Name`))

#Number of Faculty = 63571
cat('Number of Faculty')
nrow(ap.tel.data)

#Number of Faculty with matching first and last name = 3945
cat('Number of Faculty with matching first and last name')
nrow(ap.tel.data.dupl.final)

# Percentage of duplicate data - 6.2%
cat(' Percentage of duplicate data')
(nrow(ap.tel.data.dupl.final)/nrow(ap.tel.data))*100

# Number of colleges with atleast one duplicate faculty = 741
cat('Number of colleges with atleast one duplicate faculty')
length(unique(ap.tel.data.dupl.final$Institute.Name))

# Percentage of collages with atleast one duplicate faculty = 67.49%
cat('Percentage of collages with atleast one duplicate faculty')
(length(unique(ap.tel.data$`Institute Name`))/length(unique(ap.tel.data.dupl.final$Institute.Name))) * 100






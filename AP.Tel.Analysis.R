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

source("C:/Sreedhar/R Scrpits/Factly.Stats.R")

Factly.Stats(ap.tel.data)


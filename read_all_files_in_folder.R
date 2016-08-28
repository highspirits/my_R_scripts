
#get the names of all the files in a folder having extension as ".csv" 
filenames = list.files(path = "C:/Sreedhar/Data Science Competitions/Crowd Analytix/Predict fuel flow rate of airplanes during different phases of a flight/Data/CAX_Train_1", pattern = ".csv")

#Read all the files from a given folder into a dataframe
train1 = do.call(rbind, lapply(paste("C:/Sreedhar/Data Science Competitions/Crowd Analytix/Predict fuel flow rate of airplanes during different phases of a flight/Data/CAX_Train_1/", filenames, sep = ''), read.csv))
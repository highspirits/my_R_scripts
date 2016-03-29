#Categorical Data Analysis
#To create a Bar chart giving the % of target variable among each level of a categorical variable

train.boc = my.split.boc(train)
names(train.boc$factor)
numlevels <- sapply(train, function(x) length(unique(x)))

#assuming that all columns that have less than 10 unique levels are categorical
catvars <- numlevels[numlevels<10]

#I'll use this next query to systematically sort through the variables that have a 
#higher number of levels but might still be categorical
maybecats <- numlevels[numlevels >=10 & numlevels < 50]

#skipping ahead, I repeated the step above along with a quick check (levels(as.factor(var_to_check))) and came up with below
#it's set at 150 since I found trainData$v56 had 123 unique letter combinations
catvars <- numlevels[numlevels<150]

#quick check to make sure there aren't any more above 150, let's set the threshold at 250 
#to draw the line somewhere
maybecats <- numlevels[numlevels >=150 & numlevels <250] 

#I'll create frequency tables for the categorical variables that have less than 15 levels 
#just to keep the plots that will be created simpler/less cluttered
#NOTE: these tables omit/ignore NAs
v3count <- table(trainData$target, trainData$v3) 
v24count <- table(trainData$target, trainData$v24)
v30count <- table(trainData$target, trainData$v30)
v38count <- table(trainData$target, trainData$v38)
v47count <- table(trainData$target, trainData$v47)
v52count <- table(trainData$target, trainData$v52)
v62count <- table(trainData$target, trainData$v62)
v66count <- table(trainData$target, trainData$v66)
v71count <- table(trainData$target, trainData$v71)
v72count <- table(trainData$target, trainData$v72)
v74count <- table(trainData$target, trainData$v74)
v75count <- table(trainData$target, trainData$v75)
v91count <- table(trainData$target, trainData$v91)
v107count <- table(trainData$target, trainData$v107)
v110count <- table(trainData$target, trainData$v110)
v129count <- table(trainData$target, trainData$v129)

#barplots of frequencies
par(mfrow=c(2,2))
barplot(v3count, ylab="#", main="v3count", legend.text=TRUE)
barplot(v24count, ylab="#", main="v24count", legend.text=TRUE)
barplot(v30count, ylab="#", main="v30count", legend.text=TRUE)
barplot(v38count, ylab="#", main="v38count", legend.text=TRUE)
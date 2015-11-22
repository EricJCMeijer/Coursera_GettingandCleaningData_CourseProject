# load library
library(dplyr)

# load test data in dataframes and adjust column names
readtestSubjects <- read.table("subject_test.txt")
testSubjects <- rename(readtestSubjects, subject = V1)
readtestActivityLabels <- read.table("y_test.txt")
testActivityLabels <- rename(readtestActivityLabels, activity = V1)
testData <- read.table("X_test.txt")

# combine test Subjects and Activity Labels data in one data frame
testSubActivLabels <- cbind(testSubjects, testActivityLabels)

# load training data in dataframes and adjust column names
readtrainingSubjects <- read.table("subject_train.txt")
trainingSubjects <-rename(readtrainingSubjects, subject = V1)
readtrainingActivityLabels <- read.table("y_train.txt")
trainingActivityLabels <- rename(readtrainingActivityLabels, activity = V1)
trainingData <- read.table("X_train.txt")

# combine training Subjects and Activity data in one data frame
trainingSubActivLabels <- cbind(trainingSubjects, trainingActivityLabels)

# combine all Subject and Activity Labels in one data frame
allSubActivLabels <- rbind(testSubActivLabels, trainingSubActivLabels)

# combine all test and training data in one dataframe
allData <- rbind(testData, trainingData)

# load features file in data frame
features <- read.table("features.txt")

# make vector with column names
colnames <- features[ ,2]

# insert column names in dataframe
colnames(allData) <- colnames

# make susbset of features with only "mean()"
meanFeatures <- features[grep("mean()", features$V2, fixed = TRUE),]

# make susbset of features with only "std()"
stdFeatures <- features[grep("std()", features$V2, fixed = TRUE),]

# combine mean and std Features into one data frame
targetFeatures <- rbind(meanFeatures, stdFeatures)

# make vector of target features
indexTargetFeatures <- targetFeatures[ , 1]

# apply vector of target features on target data
targetData <- allData[ , indexTargetFeatures]

# add subjects and activities to target data
richData <- cbind(allSubActivLabels, targetData)

# calculate mean data
calculated <- aggregate(richData[, 3:68], list(richData$subject, richData$activity), mean)

# load activity labels
activity <- read.table("activity_labels.txt")

# merge activity labels and calculated means
inclActLabels <- merge(activity, calculated, by.x = "V1", by.y = "Group.2", all = TRUE)

# remove V1 from inclActLabels
removeV1 <- inclActLabels[ , 2:69]

tidyDataSet <- rename(removeV1, subject = Group.1, activity = V2)

# write txt file of tidyDataSey
write.table(tidyDataSet, file = "tidy_data_set.txt", row.name=FALSE)
# load dplyr library
library(dplyr)

# load test data in dataframes and adjust column names
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
testSubjects <- rename(testSubjects, subject = V1)
testActivityLabels <- read.table("UCI HAR Dataset/test/y_test.txt")
testActivityLabels <- rename(testActivityLabels, activity = V1)
testData <- read.table("UCI HAR Dataset/test/X_test.txt")

# combine test Subjects and Activity Labels data in one data frame
testSubActivLabels <- cbind(testSubjects, testActivityLabels)

# load training data in dataframes and adjust column names
trainingSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainingSubjects <-rename(trainingSubjects, subject = V1)
trainingActivityLabels <- read.table("UCI HAR Dataset/train/y_train.txt")
trainingActivityLabels <- rename(trainingActivityLabels, activity = V1)
trainingData <- read.table("UCI HAR Dataset/train/X_train.txt")

# combine training Subjects and Activity data in one data frame
trainingSubActivLabels <- cbind(trainingSubjects, trainingActivityLabels)

# combine all Subject and Activity Labels in one data frame
allSubActivLabels <- rbind(testSubActivLabels, trainingSubActivLabels)

# combine all test and training data in one dataframe
allData <- rbind(testData, trainingData)

# load features file in data frame
features <- read.table("UCI HAR Dataset/features.txt")

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
aggregatedData <- aggregate(richData[, 3:68], list(richData$subject, richData$activity), mean)

# load activity labels
activity <- read.table("UCI HAR Dataset/activity_labels.txt")

# merge activity labels and calculated means
aggregatedData <- merge(activity, aggregatedData, by.x = "V1", by.y = "Group.2", all = TRUE)

# remove V1 from inclActLabels
aggregatedData <- aggregatedData[ , 2:69]

# rename variables V1 and V2
tidyDataSet <- rename(aggregatedData, subject = Group.1, activity = V2)

# write txt file of tidyDataSey
write.table(tidyDataSet, file = "tidy_data_set.txt", row.name=FALSE)
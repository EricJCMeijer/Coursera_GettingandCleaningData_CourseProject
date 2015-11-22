------
title: "CodeBook Getting and Cleaning Data"
date: "The date here"
output: tidy_data_set.txt
------

## Project Description
This project aims to tidy up the data in the "Human Activity Recognition Using Smartphones Data Set". The ultimate aim is to creat a tidy data set describing mean and standard deviation of a large number of observations. A description of the original data project can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Study design and data processing

###Collection of the raw data
The raw data come from the "Human Activity Recognition Using Smartphones Data Set" These data can be downloaded through this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

###Notes on the original (raw) data 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
See the documentation that comes with the original data for more detailed information about the original data.

##Creating the tidy datafile

###Guide to create the tidy data file
The R script "run_analysis.R" processes and cleans the original raw data into a tidy data set: "tidy_data_set.txt". It does so by performing the following actions:
1) Merging of the training and the test data sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Every statement in the R script, is accompanied by extended comments.

##Description of the variables in the "tidy_data_set.txt" file

|    | Variable Name                     |Description|
|----|-----------------------------------|----|
| 1  | "activity"               	     |activity type|
| 2  | "subject"                         |subject number|
| 3  | "tBodyAcc-mean()-X"               |time domain signals body acceleration mean x-axis|
| 4  | "tBodyAcc-mean()-Y"               |time domain signals body acceleration mean y-axis|
| 5  | "tBodyAcc-mean()-Z"               |time domain signals body acceleration mean z-axis |
| 6  | "tGravityAcc-mean()-X"            |time domain signals gravity acceleration mean x-axis |
| 7  | "tGravityAcc-mean()-Y"            |time domain signals gravity acceleration mean y-axis |
| 8  | "tGravityAcc-mean()-Z"            |time domain signals gravity acceleration mean z-axis |
| 9  | "tBodyAccJerk-mean()-X"           |time domain signals body acceleration Jerk signals mean x-axis |
| 10 | "tBodyAccJerk-mean()-Y"           |time domain signals body acceleration Jerk signals mean y-axis |
| 11 | "tBodyAccJerk-mean()-Z"           |time domain signals body acceleration Jerk signals mean z-axis |
| 12 | "tBodyGyro-mean()-X"              |time domain signals body gyroscope mean x-axis |
| 13 | "tBodyGyro-mean()-Y"              |time domain signals body gyroscope mean y-axis |
| 14 | "tBodyGyro-mean()-Z"              |time domain signals body gyroscope mean z-axis |
| 15 | "tBodyGyroJerk-mean()-X"          |time domain signals body gyroscope Jerk signals mean x-axis |
| 16 | "tBodyGyroJerk-mean()-Y"          |time domain signals body gyroscope Jerk signals mean y-axis |
| 17 | "tBodyGyroJerk-mean()-Z"          |time domain signals body gyroscope Jerk signals mean z-axis |
| 18 | "tBodyAccMag-mean()"              |time domain signals body acceleration magnitude mean|
| 19 | "tGravityAccMag-mean()"           |time domain signals gravity acceleration magnitude mean |
| 20 | "tBodyAccJerkMag-mean()"          |time domain signals body acceleration Jerk signals magnitude mean |
| 21 | "tBodyGyroMag-mean()"             |time domain signals body gyroscope magnitude mean |
| 22 | "tBodyGyroJerkMag-mean()"         |time domain signals body gyroscope mean Jerk signals magnitude mean |
| 23 | "fBodyAcc-mean()-X"               |Fast Fourier Transform (FFT) body acceleration mean x-axis||
| 24 | "fBodyAcc-mean()-Y"               |Fast Fourier Transform (FFT) body acceleration mean y-axis|
| 25 | "fBodyAcc-mean()-Z"               |Fast Fourier Transform (FFT) body acceleration mean z-axis |
| 26 | "fBodyAccJerk-mean()-X"           |Fast Fourier Transform (FFT) body acceleration Jerk signals mean x-axis |
| 27 | "fBodyAccJerk-mean()-Y"           |Fast Fourier Transform (FFT) body acceleration Jerk signals mean y-axis |
| 28 | "fBodyAccJerk-mean()-Z"           |Fast Fourier Transform (FFT) body acceleration Jerk signals mean z-axis |
| 29 | "fBodyGyro-mean()-X"              |Fast Fourier Transform (FFT) body gyroscope mean x-axis |
| 30 | "fBodyGyro-mean()-Y"              |Fast Fourier Transform (FFT) body gyroscope mean y-axis |
| 31 | "fBodyGyro-mean()-Z"              |Fast Fourier Transform (FFT) body gyroscope mean z-axis |
| 32 | "fBodyAccMag-mean()"              |Fast Fourier Transform (FFT) body acceleration magnitude mean|
| 33 | "fBodyBodyAccJerkMag-mean()"      |Fast Fourier Transform (FFT) body acceleration Jerk signals magnitude mean |
| 34 | "fBodyBodyGyroMag-mean()"         |Fast Fourier Transform (FFT) body gyroscope magnitude mean |
| 35 | "fBodyBodyGyroJerkMag-mean()"     |Fast Fourier Transform (FFT) body gyroscope mean Jerk signals magnitude mean|
| 36 | "tBodyAcc-std()-X"               |time domain signals body acceleration Standard deviation x-axis|
| 37 | "tBodyAcc-std()-Y"               |time domain signals body acceleration Standard deviation y-axis|
| 38 | "tBodyAcc-std()-Z"               |time domain signals body acceleration Standard deviation z-axis |
| 39 | "tGravityAcc-std()-X"            |time domain signals gravity acceleration Standard deviation x-axis |
| 40 | "tGravityAcc-std()-Y"            |time domain signals gravity acceleration Standard deviation y-axis |
| 41 | "tGravityAcc-std()-Z"            |time domain signals gravity acceleration Standard deviation z-axis |
| 42 | "tBodyAccJerk-std()-X"           |time domain signals body acceleration Jerk signals Standard deviation x-axis |
| 43 | "tBodyAccJerk-std()-Y"           |time domain signals body acceleration Jerk signals Standard deviation y-axis |
| 44 | "tBodyAccJerk-std()-Z"           |time domain signals body acceleration Jerk signals Standard deviation z-axis |
| 45 | "tBodyGyro-std()-X"              |time domain signals body gyroscope Standard deviation x-axis |
| 46 | "tBodyGyro-std()-Y"              |time domain signals body gyroscope Standard deviation y-axis |
| 47 | "tBodyGyro-std()-Z"              |time domain signals body gyroscope Standard deviation z-axis |
| 48 | "tBodyGyroJerk-std()-X"          |time domain signals body gyroscope Jerk signals Standard deviation x-axis |
| 49 | "tBodyGyroJerk-std()-Y"          |time domain signals body gyroscope Jerk signals Standard deviation y-axis |
| 50 | "tBodyGyroJerk-std()-Z"          |time domain signals body gyroscope Jerk signals Standard deviation z-axis |
| 51 | "tBodyAccMag-std()"              |time domain signals body acceleration magnitude Standard deviation|
| 52 | "tGravityAccMag-std()"           |time domain signals gravity acceleration magnitude Standard deviation |
| 53 | "tBodyAccJerkMag-std()"          |time domain signals body acceleration Jerk signals magnitude Standard deviation |
| 54 | "tBodyGyroMag-std()"             |time domain signals body gyroscope magnitude Standard deviation |
| 55 | "tBodyGyroJerkMag-std()"         |time domain signals body gyroscope Jerk signals magnitude Standard deviation |
| 56 | "fBodyAcc-std()-X"               |Fast Fourier Transform (FFT) body acceleration Standard deviation x-axis|
| 57 | "fBodyAcc-std()-Y"               |Fast Fourier Transform (FFT) body acceleration Standard deviation y-axis|
| 58 | "fBodyAcc-std()-Z"               |Fast Fourier Transform (FFT) body acceleration Standard deviation z-axis |
| 59 | "fBodyAccJerk-std()-X"           |Fast Fourier Transform (FFT) body acceleration Jerk signals Standard deviation x-axis |
| 60 | "fBodyAccJerk-std()-Y"           |Fast Fourier Transform (FFT) body acceleration Jerk signals Standard deviation y-axis |
| 61 | "fBodyAccJerk-std()-Z"           |Fast Fourier Transform (FFT) body acceleration Jerk signals Standard deviation z-axis |
| 62 | "fBodyGyro-std()-X"              |Fast Fourier Transform (FFT) body gyroscope Standard deviation x-axis |
| 63 | "fBodyGyro-std()-Y"              |Fast Fourier Transform (FFT) body gyroscope Standard deviation y-axis |
| 64 | "fBodyGyro-std()-Z"              |Fast Fourier Transform (FFT) body gyroscope Standard deviation z-axis |
| 65 | "fBodyAccMag-std()"              |Fast Fourier Transform (FFT) body acceleration magnitude Standard deviation|
| 66 | "fBodyBodyAccJerkMag-std()"      |Fast Fourier Transform (FFT) body acceleration Jerk signals magnitude Standard deviation |
| 67 | "fBodyBodyGyroMag-std()"         |Fast Fourier Transform (FFT) body gyroscope magnitude Standard deviation |
| 68 | "fBodyBodyGyroJerkMag-std()"     |Fast Fourier Transform (FFT) body gyroscope Jerk signals magnitude Standard deviation |



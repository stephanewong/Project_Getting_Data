# Getting and Cleaning Data
# Course Project
# Author: Stéphane Wong

# run_analysis.R does the following:
# 1. Merges the training and the test sets in one data set
# 2. 1st tidy dataset: extract measurements on the mean and standard deviation
#     - 7352 records
#     - subject, activity code, activity label, variables (mean and std)
#     - step 1: merge subject + acivity + selected variables
#     - step 2: rename columns
# 3. Uses descriptive activity names
# 4. Appropriately labels the data set with descriptive variable names
# 5. 2nd tidy dataset (30 subject x 6 activities)
#     - the average of each variable (mean of mean + mean of std)
#     - for each activity and for each subject

# Overall deliverables:
# - "tidy dataset": txt file uploaded in Coursera
# - "code": run_analysis.R uploaded in Github
# - "script explanation": README.md in Github
# - "cookbook": in Github

# Principle reminder
# Four elements:
#     1. raw data
#     2. tidy data set
#     3. code book describing each variable and its values in the tidy data set.
#     4. explicit and exact recipe you used to go from 1 -> 2,3
# Tidy dataset principles:
#     - one variable - one column
#     - each observation in different row
#     - one table per "kind" of variable
#     - multiple tables => link column
# also,
#     - row at the top of each file with variable names
#     - variable names human readable AgeAtDiagnosis instead of AgeDx
#     - one file per table
# review => https://github.com/jtleek/datasharing

#########
# script
#########

# working directory: not needed if the user stay in his default directory
# setwd("./Project Getting Data/")
# getwd()

# Download raw data (done once)
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "./data/Dataset.zip", mode = "wb")
unzip("./data/Dataset.zip") # unzip in "./UCI HAR Dataset/"
unzip("./data/Dataset.zip", list = TRUE) # file list

# Load the raw data

HARPath <- "./UCI HAR Dataset/"
trainSigPath <- "./UCI HAR Dataset/train/Inertial Signals/"
trainPath <- "./UCI HAR Dataset/train/"
testPath <- "./UCI HAR Dataset/test/"

features <- read.table(paste0(HARPath, "features.txt"))
activityLabels <- read.table(paste0(HARPath, "activity_labels.txt"))
Xtrain <- read.table(paste0(trainPath, "X_train.txt"))
ytrain <- read.table(paste0(trainPath, "y_train.txt"))
subtrain <- read.table(paste0(trainPath, "subject_train.txt"))
Xtest <- read.table(paste0(testPath, "X_test.txt"))
ytest <- read.table(paste0(testPath, "y_test.txt"))
subtest <- read.table(paste0(testPath, "subject_test.txt"))

## explore the data (temporary code)

# baxtrain <- read.table(paste0(trainSigPath, "body_acc_x_train.txt"))
# 
# dim(features); dim(Xtrain); dim(ytrain); dim(subtrain); dim(baxtrain)
#     # [1] 561   2   : list of features "code" + "label"
#     # [1] 7352  561 : 561 features per record
#     # [1] 7352    1 : activity codes per record
#     # [1] 7352    1 : subject per record
#     # [1] 7352  128 : raw measurements (3 x 3-xyz)
# dim(Xtest); dim(ytest); dim(subtest)
#     # [1] 2947  561
#     # [1] 2947    1
#     # [1] 2947    1
# activityLabels
# 
# head(features, 3)
# head(Xtrain, 2)
# head(ytrain, 3)
# head(subtrain, 3)
# 
# unique(ytrain); unique(subtrain)
# unique(ytest); unique(subtest)

###############################################################################
# Creation of the 1st merged tidy dataset
# 1. Merges the training and the test sets in one data set
# 2. 1st tidy dataset: extract measurements on the mean and standard deviation
# 3. Uses descriptive activity names
# 4. Appropriately labels the data set with descriptive variable names
###############################################################################

## process training data

# add activity labels to training activity code list
ytrainLab <- merge(ytrain, activityLabels, by.x = 1, by.y = 1,
                all.x = TRUE, all.y = FALSE)
colnames(ytrainLab) <- c("activityCode", "activityLabel")

# add activity code and labels to training data set 
colnames(Xtrain) <- features[ ,2] # rename columns with variable names
Mtrain <- cbind(ytrainLab, Xtrain)
Mtrain <- cbind(subject = subtrain[,1], Mtrain)
Mtrain <- cbind(type = "train", Mtrain)

## process test data

# add activity labels to test activity code list
ytestLab <- merge(ytest, activityLabels, by.x = 1, by.y = 1,
                all.x = TRUE, all.y = FALSE)
colnames(ytestLab) <- c("activityCode", "activityLabel")

# add activity code and labels to training data set 
colnames(Xtest) <- features[ ,2] # rename columns with variable names
Mtest <- cbind(ytestLab, Xtest)
Mtest <- cbind(subject = subtest[,1], Mtest)
Mtest <- cbind(type = "test", Mtest)

# merge training and test raws into a single data frame
Mall <- rbind(Mtrain, Mtest)

# head(Mtrain, 3)[1:5]; tail(Mtrain, 3)[1:5]
# head(Mtest, 3)[1:5]; tail(Mtest, 3)[1:5]
# head(Mall, 4)[1:5]
# tail(Mall, 4)[1:5]
# nrow(Mall); nrow(Xtrain); nrow(Xtest)

# identify the list of variables that make a mean and standard deviation measurement
variables <- c(grep("mean()", features[ ,2], value = TRUE, fixed = TRUE),
               grep("std()", features[ ,2], value = TRUE, fixed = TRUE)) 
# full list of columns that to keep in the 1st tidy data set
colFilter <- c("type", "subject", "activityCode", "activityLabel", variables)

## Result => 1st tidy dataset
mergedDataset <- Mall[, colFilter]

# check content: it looks correct!
# names(mergedDataset)
# head(mergedDataset, 3)[1:6]; tail(mergedDataset, 3)[1:6]
#       type subject activityCode activityLabel tBodyAcc-mean()-X tBodyAcc-mean()-Y
# 1     train       1            1       WALKING         0.2885845       -0.02029417
# 2     train       1            1       WALKING         0.2784188       -0.01641057
# 3     train       1            1       WALKING         0.2796531       -0.01946716
#       type subject activityCode activityLabel tBodyAcc-mean()-X tBodyAcc-mean()-Y
# 10297 test      24            6        LAYING         0.3499661        0.03007744
# 10298 test      24            6        LAYING         0.2375938        0.01846687
# 10299 test      24            6        LAYING         0.1536272       -0.01843651

########################################################################
# Creation of the 2nd tidy dataset
# 5. 2nd tidy dataset (30 subject x 6 activities)
#     - the average of each variable (i.e mean of mean + mean of std)
#     - for each activity and for each subject
########################################################################

library(plyr)

# 2nd data set
meanDataset <- ddply(mergedDataset, .(subject, activityLabel),
                     function(df) {
                         colwise(mean) (df[, variables])
                         })

########################################################################
# Generation of the text file from the tidy dataset created in step 5
########################################################################

write.table(meanDataset, file = "mean_activity_subject.txt",
            sep =",", row.names = FALSE)
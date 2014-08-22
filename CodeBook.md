---
title: "Code Book"
author: "Stephane"
date: "Thursday, August 14, 2014"
output: html_document
---

This document describes the data in the two tidy data sets produced in *Coursera Getting and Cleaning Data course* final project:

* 1st tidy data set: R data  frame *mergedDataset*
* 2nd tidy data set: text file *mean_activity_subject.txt*

Note that several data contained in those data sets are a simple copy without transformation of orginal data. The full definition is not restated in this document and can be found in the 'README.txt' or 'features_info.txt' original files in './UCI HAR Dataset/'.

####mergedDataset

*mergedDataset* is an R data frame which is made of 70 colulns describe below:

* 'type'
    + Description: tell if the record comes from test or training data
    + Format: factor 'test' or 'train'
* 'subject'
    + Description: identifies the subject, same convention as original data
    + Format: integer from 1 to 30
* 'activityCode'
    + Description: indicates the activity code, same convention as orginal data
    + Format: interger from 1 to 6
* 'activityLabel'
    + Description: name of the activity, same names as orginal data
    + Format: 6 factors 'LAYING', 'SITTING'...
* 66 selected variables concerning the mean and standard deviation measurements
    + Description: contain the selected measurement from training and tests, see detailed description in original files
    + Format: numeric, unit is same as orginal data
    + List of variables:
        type  | 
        subject  | 
        activityCode  | 
        activityLabel  | 
        tBodyAcc-mean()-X  | 
        tBodyAcc-mean()-Y  | 
        tBodyAcc-mean()-Z  | 
        tGravityAcc-mean()-X  | 
        tGravityAcc-mean()-Y  | 
        tGravityAcc-mean()-Z  | 
        tBodyAccJerk-mean()-X  | 
        tBodyAccJerk-mean()-Y  | 
        tBodyAccJerk-mean()-Z  | 
        tBodyGyro-mean()-X  | 
        tBodyGyro-mean()-Y  | 
        tBodyGyro-mean()-Z  | 
        tBodyGyroJerk-mean()-X  | 
        tBodyGyroJerk-mean()-Y  | 
        tBodyGyroJerk-mean()-Z  | 
        tBodyAccMag-mean()  | 
        tGravityAccMag-mean()  | 
        tBodyAccJerkMag-mean()  | 
        tBodyGyroMag-mean()  | 
        tBodyGyroJerkMag-mean()  | 
        fBodyAcc-mean()-X  | 
        fBodyAcc-mean()-Y  | 
        fBodyAcc-mean()-Z  | 
        fBodyAccJerk-mean()-X  | 
        fBodyAccJerk-mean()-Y  | 
        fBodyAccJerk-mean()-Z  | 
        fBodyGyro-mean()-X  | 
        fBodyGyro-mean()-Y  | 
        fBodyGyro-mean()-Z  | 
        fBodyAccMag-mean()  | 
        fBodyBodyAccJerkMag-mean()  | 
        fBodyBodyGyroMag-mean()  | 
        fBodyBodyGyroJerkMag-mean()  | 
        tBodyAcc-std()-X  | 
        tBodyAcc-std()-Y  | 
        tBodyAcc-std()-Z  | 
        tGravityAcc-std()-X  | 
        tGravityAcc-std()-Y  | 
        tGravityAcc-std()-Z  | 
        tBodyAccJerk-std()-X  | 
        tBodyAccJerk-std()-Y  | 
        tBodyAccJerk-std()-Z  | 
        tBodyGyro-std()-X  | 
        tBodyGyro-std()-Y  | 
        tBodyGyro-std()-Z  | 
        tBodyGyroJerk-std()-X  | 
        tBodyGyroJerk-std()-Y  | 
        tBodyGyroJerk-std()-Z  | 
        tBodyAccMag-std()  | 
        tGravityAccMag-std()  | 
        tBodyAccJerkMag-std()  | 
        tBodyGyroMag-std()  | 
        tBodyGyroJerkMag-std()  | 
        fBodyAcc-std()-X  | 
        fBodyAcc-std()-Y  | 
        fBodyAcc-std()-Z  | 
        fBodyAccJerk-std()-X  | 
        fBodyAccJerk-std()-Y  | 
        fBodyAccJerk-std()-Z  | 
        fBodyGyro-std()-X  | 
        fBodyGyro-std()-Y  | 
        fBodyGyro-std()-Z  | 
        fBodyAccMag-std()  | 
        fBodyBodyAccJerkMag-std()  | 
        fBodyBodyGyroMag-std()  | 
        fBodyBodyGyroJerkMag-std()

####mean_activity_subject.txt

*mean_activity_subject.txt* is as csv text file contaning 68 fields with their names in the header (1st line).

Here are the fields:

* 'subject'
    + Description: identifies the subject, same convention as original data
    + Format: integer from 1 to 30
* 'activityLabel'
    + Description: name of the activity, same names as orginal data
    + Format: character 'LAYING', 'SITTING'...
* 66 selected variables concerning the mean and standard deviation measurements    + Description: mean of the variable for the given subject and activity in above fields
    + Format: numeric, unit is same as original data
    + List of variables: same list and names as in the 1st tidy data set *mergedDataset*

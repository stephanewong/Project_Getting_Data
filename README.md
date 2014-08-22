---
title: "Readme"
author: "Stephane Wong"
date: "Friday, August 22, 2014"
output: html_document
---

This document provides an explanation of the script run_analysis.R and the accompanying files.

####Context
This document and accompanying files are the result of *Coursera Getting and Cleaning Data course* final project. The purpose is to clean a set of raw data into two tidy data set.

####Files
* README.md => Current document that provides a overview of the files.
* CodeBook.md =>  Description of the data in the two tidy data sets: R data  frame *mergedDataset* and text file *mean_activity_subject.txt*
* mean_activity_subject.txt => Second independent tidy data set with the average of each variable for each activity and each subject
* run_analysis.R => script that generate the two tidy data sets

####*run_analysis.R* script description
#####Inputs
The input files are extracted from 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'.

The script uses the following raw data files as inputs

* features.txt
* activity_labels.txt
* X_train.txt
* y_train.txt
* subject_train.txt
* X_test.txt
* y_test.txt
* subject_test.txt

Note that a description of those files is available in the 'README.txt' of the downloaded data set 'Dataset.zip'.

#####Outputs
The script produces two main outputs

* 1st tidy data set => the R data.frame *mergedDataset* (in computer memory)
* 2nd tidy dat set => the text file *mean_activity_subject.txt*

#####Processing

The script *run_analysis.R* goes through the following steps

* step 1: download and then unzip the raw data files into './UCI HAR Dataset/' directory
* step 2: load the input files into R data frames
* step 3: create the 1st tidy data set into *mergedDataset* data frame
    + merge activity labels from 'activity_labels.txt' with activity lists from 'y_train' and 'y_test'
    + merge activity labels and codes into training and test measurement data set coming from 'X_train.txt' and 'X_test.txt'
    + rename columns with variable names from 'features.txt'
    + merge training records and test records into a single data frame while keeping track of the record type 'train' vs 'test'
    + clean out variables that we do no want to keep in the tidy data set: keep only variables containing "mean()" or "std()" words; note that variables with "meanFreq()" or "gravityMean" in their name have been excluded as per the author understanding; 66 variables remain in the end
* step 4: create the 2nd tidy data set *mean_activity_subject.txt*
    + calculate the mean of the variables per activity and subject: 6 x 30 possible combinations but less in reality because all subjects do not perform all activities; use 'ddply()' function from 'plyr' package
    + generate the text file with 'write.table()'

####How to use *run_analysis.R*

*run_analysis.R* does not need any special parameters to be input.

The main prerequisite is to install 'plyr' package and possibly check software versions below but I guess it should work with other versions.

All the files are read or written in relative directory path with the current working directory:

* the zip file is downloaded in './data'
* the input files are in structure under './UCI HAR Dataset/' as received from downloaded data
* the second tidy data set is generated directly in the working directory
    
The script can be executed directly without modification with R or R Studio.

####Software versions
R: 3.1.1

RStudio: 0.98.953

Plyr package: 1.8.1
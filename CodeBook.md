---
title: "CodeBook"
author: "Jagadeesha"
date: "September 30, 2017"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Introduction
The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

### Data

The source data was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


### Variables:
* ```source``` - Contains the path for the project files on server.
* ```destination``` - Contains the local file name.
* ```trainingset``` - Contains the training data from the source file X_train.txt.
* ```traininglabels``` - Contains the labels for training data from the source file y_train.txt.
* ```subjecttrain``` - Contains the subject data (subject who performed the activity for each window sample) from the source file subject_train.txt.

* ```testset``` - Contains the test data from the source file X_test.txt.
* ```testlabels``` - Contains the labels for training data from the source file y_test.txt.
* ```subjecttest``` - Contains the subject data (subject who performed the activity for each window sample) from the source file subject_test.txt.

* ```features``` - Contains the list of all features from the file features.txt.
* ```activitylabels``` - Contains the  from the source file activity_labels.txt (Links the class labels with their activity name). 
* ```mergetrain``` - Combines traininglabels, subjecttrain and trainingset.
* ```mergetest``` - Combines testlabels, subjecttest and testset.
* ```completedataset``` - Contains the merged data (Merges mergetrain and mergetest)
* ```columnnames``` - Contains the column names of completedataset.
* ```meansdvector``` - A logical vector to fetch only necessary columns from completedataset.
* ```meanandsddataset``` - Contains mean and standard deviation measurements by using thelogical vector meansdvector
* ```setactivitylabels``` - Contains the data in meanandsddataset with descriptive activity names.
* ```tidydataset``` - Contains independent tidy data set with the average of each variable for each activity and each subject.


### Data clean up process

The R code file "run_analysis.R" performs the following steps:

1. Merge the training and the test sets to create one data set.

    * Download the file from the server and unzip its contents
 
    * Read the training data
    
    * Read the test data
    
    * Read features
    
    * Read activity labels
    
    * Assign column names
 
    * Merge all data in one set
 
2. Extract only the measurements on the mean and standard deviation for each measurement

    * Read column names
 
    * Create a logical vector for defining ID, mean and standard deviation
 
    * Extract only the measurements on the mean and standard deviation with the help of above vector
 
3. Use descriptive activity names to name the activities in the data set.

4. Appropriately label the data set with descriptive variable names.

5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

    * Create a second tidy data set
 
    * Write the second tidy data set into a txt file


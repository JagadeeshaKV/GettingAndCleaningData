# file name      : run_analysis.R
# Created On     : 27-Sep-2017
# Description    : This file contains R script that does the following
#
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement.
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive variable names.
# 5. From the data set in step 4, create a second, independent tidy data set with the 
#    average of each variable for each activity and each subject.

source<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destination<-"ProjectDataset.zip"
#download the file
download.file(source,destfile=destination)
#unzip
unzip(zipfile = destination)

#1. Merge the training and the test sets to create one data set.
#1.1 Read the training data
trainingset<-read.table("./UCI HAR Dataset/train/X_train.txt")
traininglabels<-read.table("./UCI HAR Dataset/train/y_train.txt")
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#1.2 Read the test data
testset<-read.table("./UCI HAR Dataset/test/X_test.txt")
testlabels<-read.table("./UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#1.3 to 1.5 will help to simplify task 2 to 4 
#1.3 Read features
features <- read.table('./UCI HAR Dataset/features.txt')

#1.4 Read activity labels
activitylabels <- read.table('./UCI HAR Dataset/activity_labels.txt')


#1.5 Assign column names before merging to simplify the tasks from 2 to 5
colnames(trainingset) <- features[,2] 
colnames(traininglabels) <-"Activity"
colnames(subjecttrain) <- "Subject"

colnames(testset) <- features[,2] 
colnames(testlabels) <- "Activity"
colnames(subjecttest) <- "Subject"

colnames(activitylabels) <- c("Activity","ActivityName")


#1.6 Merge training labels, subject train and training set to create a single dataset for training
mergetrain <- cbind(traininglabels, subjecttrain, trainingset)

#1.7 Merge testing labels, subject test and test set to create a single dataset for test
mergetest <- cbind(testlabels, subjecttest, testset)

#1.8 Merge train and test dataset
completedataset<- rbind(mergetrain, mergetest)


# 2. Extract only the measurements on the mean and standard deviation for each measurement.

#2.1 Read column names
columnnames <- colnames(completedataset)

#2.2 Create a logical vector to define mean and standard deviation. Activity and Subject
# are retained to simplify next steps
meansdvector <- (grepl("Activity" , columnnames) |  grepl("Subject" , columnnames) | 
                     grepl("mean.." , columnnames) |  grepl("std.." , columnnames))

#2.3 Extract only the measurements on the mean and standard deviation with the help of above vector 
meansddataset <- completedataset[ , meansdvector == TRUE]

# 3. Use descriptive activity names to name the activities in the data set
# Use the "ActivityName" column from activitylabels to assign the descriptive activity names
setactivitylabels <- merge(meansddataset, activitylabels,by.x="Activity", all=TRUE)


# 4. Appropriately label the data set with descriptive variable names.
names(setactivitylabels) <- gsub("^t", "Time", names(setactivitylabels))
names(setactivitylabels) <- gsub("^f", "Frequency", names(setactivitylabels))
names(setactivitylabels) <- gsub('mean',".Mean",names(setactivitylabels))
names(setactivitylabels) <- gsub('std',".StandardDeviation",names(setactivitylabels))
names(setactivitylabels) <- gsub('Freq\\.',"Frequency.",names(setactivitylabels))
names(setactivitylabels) <- gsub('Freq$',"Frequency",names(setactivitylabels))
names(setactivitylabels) <- gsub("Acc", "Accelerometer", names(setactivitylabels))
names(setactivitylabels) <- gsub("Gyro", "Gyroscope", names(setactivitylabels))
names(setactivitylabels) <- gsub("Mag", "Magnitude", names(setactivitylabels))
names(setactivitylabels) <- gsub("BodyBody", "Body", names(setactivitylabels))

#5. From the data set in step 4, creates a second, independent tidy data set with the average 
#   of each variable for each activity and each subject.
tidydataset <- aggregate(. ~Subject + ActivityName, setactivitylabels, mean)
tidydataset <- tidydataset[order(tidydataset$Subject, tidydataset$ActivityName),]
write.table(tidydataset, "tidydataset.txt", row.name=FALSE)



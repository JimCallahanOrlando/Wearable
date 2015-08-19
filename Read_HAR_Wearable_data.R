### FILE:     Read_HAR_Wearable_data.R
### PURPOSE:  Merge training and test sets and create tidy data file per requirements
### AUTHOR:   James B. Callahan (Jim)
### DATE:     August 12, 2015
###
### TRACK:    Coursera: Data Scientist Certification Track
### COURSE:   Getting and Cleaning Data (GetData) -- Class Project
###
### LANGUAGE: R statistical programming language
###           R version 3.2.1 (2015-06-18) -- "World Famous Astronaut"
###           Copyright (C) 2015 The R Foundation for Statistical Computing
###           Platform: x86_64-w64-mingw32/x64 (64-bit)
###
### IDE:      RStudio
###           Version 0.99.463 – © 2009-2014 RStudio, Inc.
###
### PLATFORM: Microsoft Windows 7 Professional [Version 6.1.7601]

### REQUIREMENTS:
### Create one R script called run_analysis.R that does the following. 
###   1. Merges the training and the test sets to create one data set.
###   2. Extracts only the mean and standard deviation for each measurement. 
###   3. Uses descriptive activity names to name the activities in the data set
###   4. Appropriately labels the data set with descriptive variable names. 
###   5. From the data set in step 4, creates a second, independent tidy data set 
###      with the average of each variable for each activity and each subject.

### If you comment out this specific setwd(); use the getwd() 
### to note what directory you are in.
setwd("C:/Users/Jim/Documents/GitHub/Wearable/")

### Where am I? (in the directory tree -- useful for debugging file string)
getwd()

### descr has the file.head function for dumping the first few lines of a file without interpretation
require(descr)

file.head("data/UCI_HAR_Dataset/train/X_train.txt",1)
file.head("data/UCI_HAR_Dataset/train/Y_train.txt")

### STEP 0: READ IN THE DATA

### Training Set
X_train <- read.table("data/UCI_HAR_Dataset/train/X_train.txt", 
                      header=FALSE, colClasses="numeric", sep="")
# str(X_train)
class(X_train)
ncol(X_train)
nrow(X_train)
# head(X_train,1)

Y_train <- read.table("data/UCI_HAR_Dataset/train/y_train.txt", 
                      header=FALSE,  sep="")
str(Y_train)
class(Y_train)
ncol(Y_train)
nrow(Y_train)
head(Y_train,1)

subject_train <- read.table("data/UCI_HAR_Dataset/train/subject_train.txt", 
                           header=FALSE,  sep="")
str(subject_train)
class(subject_train)
ncol(subject_train)
nrow(subject_train)
head(subject_train)

### Test (holdout) Set
X_test <- read.table("data/UCI_HAR_Dataset/test/X_test.txt", 
                     header=FALSE, colClasses="numeric", sep="")
# str(X_test)
class(X_test)
ncol(X_test)
nrow(X_test)
# head(X_test,1)

# CHECK FIRST 3 VALUES
# readchk is read from the file using R code
readchk <- c( X_test$V1[1], X_test$V2[1], X_test$V3[1] )
# filechk is cut and paste from the X_test file (the first 3 values in the first row)
filechk <- c( 2.5717778e-001, -2.3285230e-002, -1.4653762e-002 )
# diffchk subtracts what should be identical values which should yield zero
diffchk <- readchk - filechk
# Display the results of the check -- is the data as expected?
rbind(readchk, filechk, diffchk)



Y_test <- read.table("data/UCI_HAR_Dataset/test/y_test.txt", 
                      header=FALSE,  sep="")
str(Y_test)
class(Y_test)
ncol(Y_test)
nrow(Y_test)
head(Y_test)

subject_test <- read.table("data/UCI_HAR_Dataset/test/subject_test.txt", 
                     header=FALSE,  sep="")
str(subject_test)
class(subject_test)
ncol(subject_test)
nrow(subject_test)
head(subject_test)

features <- read.table("data/UCI_HAR_Dataset/features.txt", 
                       stringsAsFactors = FALSE)
str(features)

# features_info may have to be interpreted by hand

# features_info <- read.table("data/UCI_HAR_Dataset/features_info.txt", 
#                            stringsAsFactors = FALSE)
# str(features_info)

activity_labels <- read.table("data/UCI_HAR_Dataset/activity_labels.txt")
str(activity_labels)


### All (combined) set


### STEP 1: MERGE THE (Test and Training) DATA
### Stack the train and test data sets
X_all <-rbind(X_train, X_test)
Y_all <-rbind(Y_train, Y_test)
# str(x_all)
class(X_all)
ncol(X_all)
nrow(X_all)

class(Y_all)
ncol(Y_all)
nrow(Y_all)


### STEP 2: EXTRACT ONLY VARIABLES THAT REPRESENT MEAN AND STD DEV FOR EACH MEASUREMENT

### STEP 3: APPLY ACTIVITY NAMES TO DATA (activity_labels.txt -- can use R ordered factors)
### Join the y (activity?) column 
YX_all = cbind(Y_all, X_all)





### STEP 4: LABEL THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES (features.txt)
### STEP 5: 

### FILE: run_analysis.R
### PURPOSE: create tidy data sub-sample per requirements.
### AUTHOR:   James B. Callahan (Jim)
### DATE:     August 19, 2015
###
### TRACK:    Coursera: Data Scientist Certification Track
### COURSE:   Getting and Cleaning Data (GetData) -- Class Project
###
### LANGUAGE: R statistical programming language
###           R version 3.2.2 (2015-08-14) -- "Fire Safety"
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

setwd("~/GitHub/Wearable/")
# DEBUG: getwd()

### STEP 0: READ IN THE DATA

### Descriptive data

subject_test <- read.table("data/UCI_HAR_Dataset/test/subject_test.txt", 
                           header=FALSE,  sep="")

features <- read.table("data/UCI_HAR_Dataset/features.txt", 
                       stringsAsFactors = FALSE)

activity_labels <- read.table("data/UCI_HAR_Dataset/activity_labels.txt")

### Training Set (seperated for estimating or training model)
X_train <- read.table("data/UCI_HAR_Dataset/train/X_train.txt", 
                      header=FALSE, colClasses="numeric", sep="")

Y_train <- read.table("data/UCI_HAR_Dataset/train/y_train.txt", 
                      header=FALSE,  sep="")

subject_train <- read.table("data/UCI_HAR_Dataset/train/subject_train.txt", 
                            header=FALSE,  sep="")

### Test Set (holdout data seperated for testing/validating model)
X_test <- read.table("data/UCI_HAR_Dataset/test/X_test.txt", 
                     header=FALSE, colClasses="numeric", sep="")

Y_test <- read.table("data/UCI_HAR_Dataset/test/y_test.txt", 
                     header=FALSE,  sep="")

subject_test <- read.table("data/UCI_HAR_Dataset/test/subject_test.txt", 
                           header=FALSE,  sep="")


### STEP 1: MERGE THE (Test and Training) DATA
### Stack the train and test data sets
X_all <-rbind(X_train, X_test)
Y_all <-rbind(Y_train, Y_test)

### STEP 2: EXTRACT ONLY VARIABLES THAT 
###         REPRESENT MEAN AND STD DEV FOR EACH MEASUREMENT


### STEP 3: APPLY ACTIVITY NAMES TO DATA 
###         (activity_labels.txt -- can use R ordered factors)
### Join the y (activity?) column 
YX_all = cbind(Y_all, X_all)




### STEP 4: LABEL THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES (features.txt)


### STEP 5: 
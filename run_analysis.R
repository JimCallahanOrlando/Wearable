### FILE: run_analysis.R
### PURPOSE:  Merge training and test and create tidy data per requirements.
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

subject_all <- rbind(subject_train, subject_test)
Y_all       <-rbind(Y_train, Y_test)
X_all       <-rbind(X_train, X_test)



### STEP 2: EXTRACT ONLY VARIABLES THAT 
###         REPRESENT MEAN AND STD DEV FOR EACH MEASUREMENT
match_mean <- grep("mean", features$V2)
match_std  <- grep("std", features$V2)
match <- c(match_mean, match_std)
match <- sort(match)




### STEP 3: APPLY ACTIVITY NAMES TO DATA 
###         (activity_labels.txt -- can use R ordered factors)
### Join the y (activity?) column 
YXS_all = cbind(subject_all, Y_all, X_all)




### STEP 4: LABEL THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES (features.txt)

### Check names -- see last example in make.names() documentation
### state.name[make.names(state.name) != state.name] # those 10 with a space
### features[make.names(features) != features]

FeatureTrim  <- trimws(features, which = "left")
FeatureTrim

# FeatureNames <- make.names(FeatureTrim)
# FeatureNames




### STEP 5: 
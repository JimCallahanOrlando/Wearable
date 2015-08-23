### FILE:     Read_HAR_Wearable_data.R
### PURPOSE:  Merge training and test and create tidy data per requirements.
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
subject_all <- rbind(subject_train, subject_test)
Y_all       <-rbind(Y_train, Y_test)
X_all       <-rbind(X_train, X_test)

class(X_all)
ncol(X_all)
nrow(X_all)

class(Y_all)
ncol(Y_all)
nrow(Y_all)


### STEP 2: EXTRACT ONLY VARIABLES THAT REPRESENT MEAN AND STD DEV FOR EACH MEASUREMENT
# A. Find the rows in features that have "mean(" or "std(".
match_mean <- grep("mean(", features$V2, fixed = TRUE)
length(match_mean)
match_mean
match_std  <- grep("std(", features$V2, fixed = TRUE)
length(match_std)
match_std
match <- c(match_mean, match_std)
match <- sort.int(match)
length(match)

# B. Use the "match" list (as column numbers) to subset the columns in X_all
XView  <- X_all[,match]
# Also create a subset of rows of features
FRange <- (features$V1 %in% match)
FView  <- features[FRange, ]

## Clean up the feature names in FView
## by removing parentheses, fixing a typo and spelling out abbreviations.
## * convert dash "-" to underscore "_"
## * remove "(" and ")"
## * convert "BodyBody" to "Body"        # Apparently a typo
## * convert "Gyro" to "Gyroscope"
## * convert "Acc" to "Acceleration"
## * convert "Mag" to "Magnitude"
## * convert "TBody" to "TimeBody"
## * convert "FBody" to "FFTBody"


## HONOR CODE: Note source for parentheses:
## http://stackoverflow.com/questions/9449466/remove-parenthesis-from-string
## and apply gsub() to a data frame
## http://stackoverflow.com/questions/14871249/can-i-use-gsub-on-each-element-of-a-data-frame
FView2 <- as.data.frame(FView["V2"])
FView2 <- as.data.frame(apply(FView2, 1, function(x1) gsub("-", "_", x1, fixed = TRUE)))
FView2 <- as.data.frame(apply(FView2, 1, function(x2) gsub("(", "", x2, fixed = TRUE)))
FView2 <- as.data.frame(apply(FView2, 1, function(x3) gsub(")", "", x3, fixed = TRUE)))
FView2 <- as.data.frame(apply(FView2, 1, function(x4) gsub("BodyBody", "Body", x4, fixed = TRUE)))
FView2 <- as.data.frame(apply(FView2, 1, function(x5) gsub("Gyro", "Gyroscope", x5, fixed = TRUE)))
FView2 <- as.data.frame(apply(FView2, 1, function(x6) gsub("Acc", "Acceleration", x6, fixed = TRUE)))
FView2 <- as.data.frame(apply(FView2, 1, function(x7) gsub("Mag", "Magnitude", x7, fixed = TRUE)))
FView2 <- as.data.frame(apply(FView2, 1, function(x8) gsub("tBody", "TimeBody", x8, fixed = TRUE)))
FView2 <- as.data.frame(apply(FView2, 1, function(x9) gsub("tGravity", "TimeGravity", x9, fixed = TRUE)))
FView2 <- as.data.frame(apply(FView2, 1, function(x10) gsub("fBody", "FFTBody", x10, fixed = TRUE)))
FView2 <- as.data.frame(apply(FView2, 1, function(x11) gsub("fGravity", "FFTGravity", x11, fixed = TRUE)))
names(FView2) <- "V1"

### STEP 3: APPLY ACTIVITY NAMES TO DATA (activity_labels.txt -- use R factors)
### and join the y (activity) column to the x data
Activity    <- factor(Y_all$V1, labels = activity_labels$V2)
subject_all <- factor(subject_all$V1)        # we don't have labels for subjects

Subject_Y_XView = cbind(subject_all, Activity, XView)


### STEP 4: LABEL THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES (features.txt)
ColumnNames <- c("subject","activity", as.vector(FView2$V1) )
colnames(Subject_Y_XView) <- ColumnNames

## melt feature columns to a single column

# Tidy1 <- melt()
require(reshape2)
wearableTidy <- melt(Subject_Y_XView, id = c("subject", "activity"),
                measure.vars = FView2$V1)
colnames(wearableTidy) <- c("subject", "activity", "feature", "value")



### STEP 5: From the data set in step 4, create a second, tidy data set 
###         with the average of each variable for each activity and each subject.
require(plyr)
wearableSummary = ddply( wearableTidy, .(subject, activity, feature), summarize, 
                     mean = mean(value)
                     )
str(wearableSummary)
# ?capature.output
# http://127.0.0.1:30448/library/utils/html/capture.output.html
str_wearableSummary <- capture.output(str(wearableSummary))

write.table(wearableSummary, 
            file = "data/wearableSummary.txt", 
            append = FALSE,
            sep = "\t",
            row.name=FALSE,
            col.names = TRUE
            )

# http://stackoverflow.com/questions/15488350/programmatically-creating-markdown-tables-in-r-with-knitr
library(knitr)
kable(head(iris[,1:3]), format = "markdown")


library(knitr)
kable(head(wearableSummary[,1:4]), format = "markdown")

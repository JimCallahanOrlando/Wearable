### FILE:     Get_Wearable_Data.R
### PURPOSE:  Download zip file of wearable devices data.
### AUTHOR:   James B. Callahan (Jim)
### DATE:     August 12, 2015
###
### TRACK:    Coursera: Data Scientist Certification Track
### COURSE:   Getting and Cleaning Data -- Class Project
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

### descr has the file.head function for dumping the first few lines of a file without interpretation
### require(descr)

### If you comment out this specific setwd(); use the getwd() to note what directory you are in.
setwd("C:/Users/Jim/Documents/Coursera/DataScientist/GetDataHomework")

### Where am I? (in the directory tree -- useful for debugging file string)
getwd()

### Download "FUCI HAR Dataset.zip"
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"FUCI.zip", mode="wb")


### Unzip the data file
unzip("FUCI.zip", 
      overwrite = TRUE, exdir = ".", unzip = "internal", setTimes = TRUE)


### Data file should be downloaded and unzipped; ready for next program read into R.
### End of: Get_Wearable_Data.R
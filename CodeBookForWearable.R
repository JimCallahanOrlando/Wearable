# CodeBookForWearable.R
# Jim Callahan
# Program to produce CodeBook text file: CodeBookForWearable.md

# SAVE STRUCTURE
# Found capture.output while reading ?sink
# ?capture.output
str_wearableTidy    <- capture.output(   str(wearableTidy)   )
str_wearableSummary <- capture.output(   str(wearableSummary)   )

# SAVE CONTENTS
# Found kable while google-ing for "R write to markdown"
# http://stackoverflow.com/questions/15488350/programmatically-creating-markdown-tables-in-r-with-knitr
library(knitr)
# iris[,1:5] is columns 1 to 5 of the iris data set endcol must be <= ncol
# head(item,2) is first 2 lines of item -- can vary the number as needed
KnitTable_wearableTidy1 <- kable( head(wearableTidy[,1:ncol(wearableTidy)],2), format = "markdown" )
KnitTable_wearableTidy2 <- kable( tail(wearableTidy[,1:ncol(wearableTidy)],2, addrownums = FALSE), 
                                  format = "markdown" )

KnitTable_wearableSummary1 <- kable( head(wearableSummary[,1:ncol(wearableSummary)],2), format = "markdown" )
KnitTable_wearableSummary2 <- kable( tail(wearableSummary[,1:ncol(wearableSummary)],2, addrownums = FALSE), format = "markdown" )

# OPEN FILE
mdFile = file("CodeBookForWearable.md", "w") # open an output file connection

# WRITE TITLE
cat("## Code Book for 'Wearable' data set  \n", file = mdFile)

# WRITE HEADING
cat("\n\n#### wearableTidy  \n", file = mdFile)
cat("\n **wearableTidy** is an R ", file = mdFile)

# WRITE STRUCTURE
# ?write.line
writeLines(str_wearableTidy, mdFile)
                 

# WRITE CONTENTS
cat("\n First few lines of **wearableTidy**.  \n", file = mdFile)
writeLines(KnitTable_wearableTidy1, mdFile)
                

# WRITE CONTENTS
cat("\n Last few lines of **wearableTidy**.  \n", file = mdFile)
writeLines(KnitTable_wearableTidy2, mdFile)


# WRITE HEADING
cat("\n\n#### wearableSummary  \n", file = mdFile)
cat("\n **wearableSummary** is also an R ", file = mdFile)


# WRITE STRUCTURE
# ?write.line
writeLines(str_wearableSummary, mdFile)


# WRITE CONTENTS
cat("\n First few lines of **wearableSummary**.  \n", file = mdFile)
writeLines(KnitTable_wearableSummary1, mdFile)


# WRITE CONTENTS
cat("\n Last few lines of **wearableSummary**.  \n", file = mdFile)
writeLines(KnitTable_wearableSummary2, mdFile)

cat("\n The mean is calculated for each combination of  \n", file = mdFile)
cat("subject(30), activity(6) and feature(66) for a total of   \n", file = mdFile)
cat("11,880 levels (30*6*66).  \n", file = mdFile)

# Factors
cat("\n #### FACTOR: activity ####.  \n", file = mdFile)
writeLines(as.character(levels(wearableSummary$activity)), mdFile)

cat("\n #### FACTOR: subject ####.  \n", file = mdFile)
writeLines(as.character(levels(wearableSummary$subject)), mdFile)

cat("\n #### FACTOR: feature ####.  \n", file = mdFile)
writeLines(as.character(levels(wearableSummary$feature)), mdFile)


cat("\n The features selected for this database come from the  \n", file = mdFile)
cat("\n accelerometer and gyroscope signals of Samsung smart phones using \n", file = mdFile)
cat("\n the 3-axial raw signals TimeAccelaration-XYZ and TimeGyroscope-XYZ  \n", file = mdFile)
cat("\n These time domain signals (prefix 'Time' to denote time)   \n", file = mdFile)
cat("\n were captured at a constant rate of 50 Hz.   \n", file = mdFile)
cat("\n Then they were filtered using a median filter and a 3rd order low pass  \n", file = mdFile)
cat("\n Butterworth filter with a corner frequency of 20 Hz to remove noise.   \n", file = mdFile)
cat("\n Similarly, the acceleration signal was then separated into body and gravity signals \n", file = mdFile)
cat("\n (TimeBodyAcceleration-XYZ and TimeGravityAcceleration-XYZ) using another low pass \n", file = mdFile)
cat("\n Butterworth filter with a corner frequency of 0.3 Hz.  \n", file = mdFile)
cat("\n Subsequently, the body linear acceleration and angular velocity were derived in time \n", file = mdFile)
cat("\n to obtain Jerk signals (TimeBodyAccelerationJerk-XYZ and TimeBodyGyroJerk-XYZ). \n", file = mdFile)
cat("\n Also the magnitude of these three-dimensional signals were calculated  \n", file = mdFile)
cat("\n using the Euclidean norm  \n", file = mdFile)
cat("\n (TimeBodyAccelerationMagnitude, TimeGravityAccelerationMagnitude,  \n", file = mdFile)
cat("\n TiimeBodyAccelerationJerkMagnitude, tBodyGyroscopeMagnitude, tBodyGyroscopeJerkMagnitude). \n", file = mdFile)
cat("\n Finally a Fast Fourier Transform (FFT) was applied to some of these signals \n", file = mdFile)
cat("\n producing FFTBodyAcceleration-XYZ, FFTBodyAccelerationJerk-XYZ, FFTBodyGyroscope-XYZ \n", file = mdFile)
cat("\n FFTBodyAccelerationJerkMagnitude, FTBodyGyroscopeMagnitude, FFTBodyGyrosopeJerkMagnitude.\n", file = mdFile)
cat("\n (Note the 'FFT' to indicate frequency domain signals).    \n", file = mdFile)
cat("\n These signals were used to estimate variables of the feature vector  \n", file = mdFile)
cat("\n for each pattern:   \n", file = mdFile)
cat("\n '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  \n", file = mdFile)


# CLOSEFILE
close(mdFile)
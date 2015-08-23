## Wearable  ...two data sets
## a text file and an R Program

James B. Callahan (Jim)  
August 2015

a course project for..

#### Johns Hopkins
* Data Science Specialization (via Coursera on-line)
* Dr. Jeff Leek's "Getting and Cleaning Data" course
* Based on HAR (Human Activity Recognition) data set 
* Retrieved from the UCI (Univeristy of California, Irvine) Machine Learning Repository http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
(by course instructor)

#### Abstract
The **"Human Activity Recognition"** (via smart phone sensors) source data files were combined into one (in memory) **R** data set (organized according to the principles of **"tidy data"** developed by Dr. Hadley Wickham and covered in the course) by the program **run_analysis.R**. Per the **"Project Requirements"** (below) "only the mean and standard deviation for each measurement [feature]" were included in the (in memory) R data set. According to the source data's **README.txt** file: "Features are normalized and bounded within [-1,1]." In statistical terms, "normalization" usually refers to subtracting the mean and dividing by either the population or sample standard deviation see for example the Wikipedia article:  
https://en.wikipedia.org/wiki/Normalization_(statistics)  
-- it has not been independently confirmed that that is the "normalization" process used or intended by the authors of the source data set.
Pursuant to **"Project Requirement" #5** (below) the program **run_analysis.R** created, in addition, **a second data set** computing the average ("of each variable for each activity and each subject") of the already normalized values (perhaps to create an "expected value?") and wrote this second in memory data set **to disk** as a text file (**wearableSummary.txt**).  

#### Assignment:
You will be required to submit:   
1) a **tidy data set** as described below,   
2) a **link** to a **Github repository** with your **script** for performing the analysis, and  
3) a **code book** that describes the variables, the data, and any transformations or work that you performed to clean up the data called **CodeBook.md**.
 
#### Project Requirements:
Create one **R** script called **run_analysis.R** that does the following.  
  1. Merges the training and the test sets to create one data set.  
  2. Extracts only the mean and standard deviation for each measurement.  
  3. Uses descriptive activity names to name the activities in the data set.  
  4. Appropriately labels the data set with descriptive variable names.   
  5. From the data set in step 4, creates a **second**, independent **tidy data set**
     with the average of each variable for each activity and each subject.  
     
#### Additional Instructions:
"Please submit a **link** to a **Github repo** with the **code** for performing your analysis.   
The code [repo?] should have a file **run_analysis.R** in the main directory   
that can be run as long as the Samsung data [/data/UCI_HAR_Data] is in your working [Wearable/data] directory. 
The output should be the tidy data set (**wearableSummary.txt**) you submitted for part 1.  
You should include a **README.md**  [this file] in the repo describing how the script works 
and the **code book** describing the variables.  

#### Evaluation Criteria
...Was **code book** submitted to GitHub that modifies and updates the codebooks 
available to you with the data to indicate all the variables and summaries you calculated, 
along with units, and any other relevant information?  
...I was able to follow the **README** in the directory that explained what the analysis files did."  

#### Analysis: run_analysis.R
The text file created by **run_analysis.R** can be read with:

    Summary <- read.table("wearableSummary.txt", sep="\t")

The "steps" (see program comments) in **run_analysis.R** correspond to
the five "Project Requirements" listed above, with an additional "Step 0" for
reading in the source data files.

The main program comments in run_analysis.R are:
 ### STEP 0: READ IN THE DATA
 * No surprises here
 
 ### STEP 2: EXTRACT ONLY VARIABLES THAT REPRESENT MEAN AND STD DEV FOR EACH MEASUREMENT
 # A. Find the rows in features that have "mean(" or "std(".
 * The grep() function is used to find "mean" and "std".
 # B. Use the "match" list (as column numbers) to subset the columns in X_all
 * XView  <- X_all[,match]
 # Also create a subset of rows of features
 
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

The above is probably more convoluted than necessary, but it works!

Step 3 is just 3 lines of code.

 ### STEP 3: APPLY ACTIVITY NAMES TO DATA (activity_labels.txt -- use R factors)
 ### and join the y (activity) column to the x data
 
Create the factor for the six activity levels. 
 Activity    <- factor(Y_all$V1, labels = activity_labels$V2)
 
Create the factor for the subjects. 
 subject_all <- factor(subject_all$V1)        # we don't have labels for subjects
 
 (I guess that is why one does not want to use underscores in variable names).

The features are used in a machine learning model to predict the activity levels.
Think of it conceptually as:  Activity = function(Features). 
So, the Activity column is joined to the left of the Feature table. 
The Subject number column is then joined to the left of the Activity column.

 Subject_Y_XView = cbind(subject_all, Activity, XView)
 
Fortunately all of this joining was in one simple cbind() function (above).

  ### STEP 4: LABEL THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES (features.txt)
  
    ColumnNames <- c("subject","activity", as.vector(FView2$V1) )
    colnames(Subject_Y_XView) <- ColumnNames

 Since we just bound the "subject" and "activity" columns we have to add
 the column names as well.
 
 Now comes the "tidy" part.
 
 ## melt feature columns to a single column

 # Tidy1 <- melt()
require(reshape2)
wearableTidy <- melt(Subject_Y_XView, id = c("subject", "activity"),
                     measure.vars = FView2$V1)
colnames(wearableTidy) <- c("subject", "activity", "feature", "value")
 

This is analogous to the mtcars example in the lecture where HP and MPG
became part of a column (in fact, I used the same function).

In this case, "subject", "activity" are retained as ID variables,
while all of the feature column names become one long "feature"
variable and the corresponding number appears in the "value column".

Again, all of the features are analogous to HP and MPG.

In step 5 we compute the average (or mean) using the ddply() function
and write the results to a text file using the write.table function.
Since, the file is .txt and not .csv, we chose to write it as tab-delimited
by setting the sep option to the escape sequence "backslash t".

Just before outputing the file, we do a last minute check on the structure of
the file, so we know what to expect when we (from the console) 
read it back in with:

    Summary <- read.table("wearableSummary.txt", sep="\t")

 ### STEP 5: From the data set in step 4, create a second, tidy data set 
 ###         with the average of each variable for each activity and each subject.
require(plyr)
wearableSummary = ddply( wearableTidy, .(subject, activity, feature), summarize, 
                         mean = mean(value)
                         )
str(wearableSummary)

write.table(wearableSummary, 
            file = "wearableSummary.txt", 
            append = FALSE,
            sep = "\t",
            row.name=FALSE,
            col.names = TRUE
            )

 ### End of run_analysis.R

The "End of" comment is a holdover from the days when one had to make sure 
the machine read your last punch card!


#### Source Data:

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================


License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

## Wearable  ...two data sets

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
The **"Human Activity Recognition"** source data files were combined into one (in memory) **R** data set (organized according to the principles of **"tidy data"** developed by Dr. Hadley Wickham and covered in the course) by the program **run_analysis.R**. Per the **"Project Requirements"** (below) "only the mean and standard deviation for each measurement [feature]" were included in the (in memory) R data set. According to the source data's **README.txt** file: "Features are normalized and bounded within [-1,1]." In statistical terms, "normalization" usually refers to subtracting the mean and dividing by either the population or sample standard deviation see for example the Wikipedia article:  
https://en.wikipedia.org/wiki/Normalization_(statistics)  
-- it has not been independently confirmed that that is the "normalization" process used or intended by the authors of the source data set.
Pursuant to **"Project Requirement" #5** (below) the program **run_analysis.R** created **a second data set** averaging the already normalized values (perhaps to create an "expected value?") and wrote this data set **to disk** as a **text file**.  

 
#### Project Requirements:
Create one **R** script called **run_analysis.R** that does the following. 
  1. Merges the training and the test sets to create one data set.  
  2. Extracts only the mean and standard deviation for each measurement.  
  3. Uses descriptive activity names to name the activities in the data set.  
  4. Appropriately labels the data set with descriptive variable names.   
  5. From the data set in step 4, creates a **second**, independent **tidy data set**
     with the average of each variable for each activity and each subject.  
     
#### Additional Instructions:
"Please submit a link to a Github repo with the code for performing your analysis.   
The code should have a file **run_analysis.R** in the main directory   
that can be run as long as the Samsung data [UCI HAR] is in your working directory. 
The output should be the tidy data set you submitted for part 1.  
You should include a **README.md** in the repo describing how the script works 
and the **code book** describing the variables.  

#### Evaluation Criteria
...Was **code book** submitted to GitHub that modifies and updates the codebooks 
available to you with the data to indicate all the variables and summaries you calculated, 
along with units, and any other relevant information?  
...I was able to follow the **README** in the directory that explained what the analysis files did."  

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

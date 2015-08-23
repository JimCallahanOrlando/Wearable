## Code Book for the 'Wearable' data set  


#### wearableTidy  

 **wearableTidy** is an R 'data.frame':	679734 obs. of  4 variables:
 $ subject : Factor w/ 30 levels "1","2","3","4",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ activity: Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..: 5 5 5 5 5 5 5 5 5 5 ...
 $ feature : Factor w/ 66 levels "TimeBodyAcceleration_mean_X",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ value   : num  0.289 0.278 0.28 0.279 0.277 ...

 First few lines of **wearableTidy**.  
|subject |activity |feature                     |     value|
|:-------|:--------|:---------------------------|---------:|
|1       |STANDING |TimeBodyAcceleration_mean_X | 0.2885845|
|1       |STANDING |TimeBodyAcceleration_mean_X | 0.2784188|

 Last few lines of **wearableTidy**.  
|       |subject |activity         |feature                           |      value|
|:------|:-------|:----------------|:---------------------------------|----------:|
|679733 |24      |WALKING_UPSTAIRS |FFTBodyGyroscopeJerkMagnitude_std | -0.6549599|
|679734 |24      |WALKING_UPSTAIRS |FFTBodyGyroscopeJerkMagnitude_std | -0.6252073|


#### wearableSummary  

 **wearableSummary** is also an R 'data.frame':	11880 obs. of  4 variables:
 $ subject : Factor w/ 30 levels "1","2","3","4",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ activity: Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ feature : Factor w/ 66 levels "TimeBodyAcceleration_mean_X",..: 1 2 3 4 5 6 7 8 9 10 ...
 $ mean    : num  0.2773 -0.0174 -0.1111 -0.2837 0.1145 ...

 First few lines of **wearableSummary**.  
|subject |activity |feature                     |       mean|
|:-------|:--------|:---------------------------|----------:|
|1       |WALKING  |TimeBodyAcceleration_mean_X |  0.2773308|
|1       |WALKING  |TimeBodyAcceleration_mean_Y | -0.0173838|

 Last few lines of **wearableSummary**.  
|      |subject |activity |feature                            |       mean|
|:-----|:-------|:--------|:----------------------------------|----------:|
|11879 |30      |LAYING   |FFTBodyGyroscopeJerkMagnitude_mean | -0.9778213|
|11880 |30      |LAYING   |FFTBodyGyroscopeJerkMagnitude_std  | -0.9754815|

 The mean is calculated for each combination of  
subject(30), activity(6) and feature(66) for a total of   
11,880 levels (30*6*66).  

 #### FACTOR: activity ####.  
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING

 #### FACTOR: subject ####.  
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30

 #### FACTOR: feature ####.  
TimeBodyAcceleration_mean_X
TimeBodyAcceleration_mean_Y
TimeBodyAcceleration_mean_Z
TimeBodyAcceleration_std_X
TimeBodyAcceleration_std_Y
TimeBodyAcceleration_std_Z
TimeGravityAcceleration_mean_X
TimeGravityAcceleration_mean_Y
TimeGravityAcceleration_mean_Z
TimeGravityAcceleration_std_X
TimeGravityAcceleration_std_Y
TimeGravityAcceleration_std_Z
TimeBodyAccelerationJerk_mean_X
TimeBodyAccelerationJerk_mean_Y
TimeBodyAccelerationJerk_mean_Z
TimeBodyAccelerationJerk_std_X
TimeBodyAccelerationJerk_std_Y
TimeBodyAccelerationJerk_std_Z
TimeBodyGyroscope_mean_X
TimeBodyGyroscope_mean_Y
TimeBodyGyroscope_mean_Z
TimeBodyGyroscope_std_X
TimeBodyGyroscope_std_Y
TimeBodyGyroscope_std_Z
TimeBodyGyroscopeJerk_mean_X
TimeBodyGyroscopeJerk_mean_Y
TimeBodyGyroscopeJerk_mean_Z
TimeBodyGyroscopeJerk_std_X
TimeBodyGyroscopeJerk_std_Y
TimeBodyGyroscopeJerk_std_Z
TimeBodyAccelerationMagnitude_mean
TimeBodyAccelerationMagnitude_std
TimeGravityAccelerationMagnitude_mean
TimeGravityAccelerationMagnitude_std
TimeBodyAccelerationJerkMagnitude_mean
TimeBodyAccelerationJerkMagnitude_std
TimeBodyGyroscopeMagnitude_mean
TimeBodyGyroscopeMagnitude_std
TimeBodyGyroscopeJerkMagnitude_mean
TimeBodyGyroscopeJerkMagnitude_std
FFTBodyAcceleration_mean_X
FFTBodyAcceleration_mean_Y
FFTBodyAcceleration_mean_Z
FFTBodyAcceleration_std_X
FFTBodyAcceleration_std_Y
FFTBodyAcceleration_std_Z
FFTBodyAccelerationJerk_mean_X
FFTBodyAccelerationJerk_mean_Y
FFTBodyAccelerationJerk_mean_Z
FFTBodyAccelerationJerk_std_X
FFTBodyAccelerationJerk_std_Y
FFTBodyAccelerationJerk_std_Z
FFTBodyGyroscope_mean_X
FFTBodyGyroscope_mean_Y
FFTBodyGyroscope_mean_Z
FFTBodyGyroscope_std_X
FFTBodyGyroscope_std_Y
FFTBodyGyroscope_std_Z
FFTBodyAccelerationMagnitude_mean
FFTBodyAccelerationMagnitude_std
FFTBodyAccelerationJerkMagnitude_mean
FFTBodyAccelerationJerkMagnitude_std
FFTBodyGyroscopeMagnitude_mean
FFTBodyGyroscopeMagnitude_std
FFTBodyGyroscopeJerkMagnitude_mean
FFTBodyGyroscopeJerkMagnitude_std

 The features selected for this database come from the  

 accelerometer and gyroscope signals of Samsung smart phones using 

 the 3-axial raw signals TimeAccelaration-XYZ and TimeGyroscope-XYZ  

 These time domain signals (prefix 'Time' to denote time)   

 were captured at a constant rate of 50 Hz.   

 Then they were filtered using a median filter and a 3rd order low pass  

 Butterworth filter with a corner frequency of 20 Hz to remove noise.   

 Similarly, the acceleration signal was then separated into body and gravity signals 

 (TimeBodyAcceleration-XYZ and TimeGravityAcceleration-XYZ) using another low pass 

 Butterworth filter with a corner frequency of 0.3 Hz.  

 Subsequently, the body linear acceleration and angular velocity were derived in time 

 to obtain Jerk signals (TimeBodyAccelerationJerk-XYZ and TimeBodyGyroJerk-XYZ). 

 Also the magnitude of these three-dimensional signals were calculated  

 using the Euclidean norm  

 (TimeBodyAccelerationMagnitude, TimeGravityAccelerationMagnitude,  

 TiimeBodyAccelerationJerkMagnitude, tBodyGyroscopeMagnitude, tBodyGyroscopeJerkMagnitude). 

 Finally a Fast Fourier Transform (FFT) was applied to some of these signals 

 producing FFTBodyAcceleration-XYZ, FFTBodyAccelerationJerk-XYZ, FFTBodyGyroscope-XYZ 

 FFTBodyAccelerationJerkMagnitude, FTBodyGyroscopeMagnitude, FFTBodyGyrosopeJerkMagnitude.

 (Note the 'FFT' to indicate frequency domain signals).    

 These signals were used to estimate variables of the feature vector  

 for each pattern:   

 '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  

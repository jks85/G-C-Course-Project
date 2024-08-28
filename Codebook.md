---
title: "Codebook"
author: "Julian Simington"
date: "2024-08-28"
output: html_document
---


### Information about Variables

The variables in the tidy data file represent modifications from variables and data in the source codebook *features_info.txt*. They have been separated into two categories below-- **Identifiers** and **Measurements**. The *Subject* and *Activity* variables were created in the process of tidying the source data and serve as **Identifiers**. Both identifiers are necessary for a unique observation within the data.

Otherwise, the remaining variables are **Measurements** calculated from the source data. Specifically these variables represent group averages of selected features data based on *Subject* and *Activity*. The naming format for these calculated variables is *mean_AAA*, where the string *AAA* represents a feature from the source data.

For example, the variable name *mean_tBodyAcc-mean()-X* indicates that the mean of the feature variable *tBodyAcc-mean()-X* was calculated for a *Subject* and *Activity*. Note that the *X* in this string means this variable was calculated with respect to the X-axis in the source data. Where appropriate corresponding variables exist for the X, Y and Z axes.

Consult the source codebook mentioned above for more details regarding the original features. 

### Identifiers

* Subject-- Number corresponding to the experimental subject( 1 through 30)
    + `1`
    + `2`
    + `3`
    + `4`
    + `5`
    + `6`
    + `7`
    + `8`
    + `9`
    + `10`
    + `11`
    + `12`
    + `13`
    + `14`
    + `15`
    + `16`
    + `17`
    + `18`
    + `19`
    + `20`
    + `21`
    + `22`
    + `23`
    + `24`
    + `25`
    + `26`
    + `27`
    + `28`
    + `29`
    + `30`

* Activity-- Activity performed by a subject during the experiment

    + `WALKING`
    + `WALKING_UPSTAIRS`
    + `WALKING_DOWNSTAIRS`
    + `SITTING`
    + `STANDING`
    + `LAYING`
    
### Measurements

    
* `mean_tBodyAcc-mean()-X`
* `mean_tBodyAcc-mean()-Y`
* `mean_tBodyAcc-mean()-Z`
* `mean_tBodyAcc-std()-X`
* `mean_tBodyAcc-std()-Y`
* `mean_tBodyAcc-std()-Z`
* `mean_tGravityAcc-mean()-X`
* `mean_tGravityAcc-mean()-Y`
* `mean_tGravityAcc-mean()-Z`
* `mean_tGravityAcc-std()-X`
* `mean_tGravityAcc-std()-Y`
* `mean_tGravityAcc-std()-Z`
* `mean_tBodyAccJerk-mean()-X`
* `mean_tBodyAccJerk-mean()-Y`
* `mean_tBodyAccJerk-mean()-Z`
* `mean_tBodyAccJerk-std()-X`
* `mean_tBodyAccJerk-std()-Y`
* `mean_tBodyAccJerk-std()-Z`
* `mean_tBodyGyro-mean()-X`
* `mean_tBodyGyro-mean()-Y`
* `mean_tBodyGyro-mean()-Z`
* `mean_tBodyGyro-std()-X`
* `mean_tBodyGyro-std()-Y`
* `mean_tBodyGyro-std()-Z`
* `mean_tBodyGyroJerk-mean()-X`
* `mean_tBodyGyroJerk-mean()-Y`
* `mean_tBodyGyroJerk-mean()-Z`
* `mean_tBodyGyroJerk-std()-X`
* `mean_tBodyGyroJerk-std()-Y`
* `mean_tBodyGyroJerk-std()-Z`
* `mean_tBodyAccMag-mean()`
* `mean_tBodyAccMag-std()`
* `mean_tGravityAccMag-mean()`
* `mean_tGravityAccMag-std()`
* `mean_tBodyAccJerkMag-mean()`
* `mean_tBodyAccJerkMag-std()`
* `mean_tBodyGyroMag-mean()`
* `mean_tBodyGyroMag-std()`
* `mean_tBodyGyroJerkMag-mean()`
* `mean_tBodyGyroJerkMag-std()`
* `mean_fBodyAcc-mean()-X`
* `mean_fBodyAcc-mean()-Y`
* `mean_fBodyAcc-mean()-Z`
* `mean_fBodyAcc-std()-X`
* `mean_fBodyAcc-std()-Y`
* `mean_fBodyAcc-std()-Z`
* `mean_fBodyAccJerk-mean()-X`
* `mean_fBodyAccJerk-mean()-Y`
* `mean_fBodyAccJerk-mean()-Z`
* `mean_fBodyAccJerk-std()-X`
* `mean_fBodyAccJerk-std()-Y`
* `mean_fBodyAccJerk-std()-Z`
* `mean_fBodyGyro-mean()-X`
* `mean_fBodyGyro-mean()-Y`
* `mean_fBodyGyro-mean()-Z`
* `mean_fBodyGyro-std()-X`
* `mean_fBodyGyro-std()-Y`
* `mean_fBodyGyro-std()-Z`
* `mean_fBodyAccMag-mean()`
* `mean_fBodyAccMag-std()`
* `mean_fBodyBodyAccJerkMag-mean()`
* `mean_fBodyBodyAccJerkMag-std()`
* `mean_fBodyBodyGyroMag-mean()`
* `mean_fBodyBodyGyroMag-std()`
* `mean_fBodyBodyGyroJerkMag-mean()`
* `mean_fBodyBodyGyroJerkMag-std()`

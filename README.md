---
title: Getting and Cleaning Data Course Project
author: "Julian Simington"
date: "2024-08-27"
output: html_document
---

## Overview 

The stated objectives of this project were *"...to demonstrate your ability to collect, work with, and clean a data set"* and *"...to prepare tidy data that can be used for later analysis."*

This project used existing experimental data from participants who performed various activities while wearing a Samsung Galaxy S II smartphone. The original data included a variety of measurements that were recorded from each participant, during each activity.

The following files were created for this project:

* run_analysis.r, .
    + An R script that produces a tidy data set from the experimental data. 
    + The tidy data provides average values of selected features from the experimental data.
* README.md 
    + A README file, this document :), that describes the source data and explains tidying process and other design decisions from the project.
* Codebook.md 
    + A codebook that updates the source codebook to reflect modifications to the original data.



See the **Source Data** section of this file for links to the original data. Consult the ReadME in the source data for more detailed information regarding the original experiment.

Thanks for taking the time to read this and to grade my project :).

## For the Grader

This section includes instructions for loading the data. It also explains two major decisions that were made in the construction of the data set. More detailed information regarding construction of the data set can be found further into this README.

### Loading the tidy data 

The data can be read into R and viewed using `read.table()` where `filepath` is the file path to the text file containing the tidy data.

`tidy_data = read.table(filepath, header = TRUE)`

`View(tidy_data)`

### Design decisions
1. The project guidelines indicated that the script should only extract measurements on the mean and standard deviation of features. Features that included *mean()* or *std()* in the name explicitly fit the criteria and were included. A number of features included *mean* in the name (e.g gravityMean), but were computed by averaging other signals in the data. These features were not extracted due to being transformations of other source data.

2. The tidy data is ultimately presented in a wide format. Both wide and narrow formats are acceptable for this data as the feature name could be treated as a variable in a narrow data set. However, the mean of each feature qualifies as a variable, thus each column in the final data frame represents a single variable. Similarly each row in the data frame represents as an observation, where an observation is characterized by a *Subject* and an *Activity*.



## Installation and Setup

The software and packages used for this project are listed below.

* Software
    + R version 4.4.1
    + RStudio 2024.04.2
* Packages
    + dplyr
    + The script run_analysis.R installs and loads the dplyr package.
    
## Data     

### Source Data


* [Human Activity Recognition Using Smartphones Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The source data links to a zip folder containing six (6) files:

1. activity_labels.txt
    + Activities were assigned a number. This document matches an activity with its corresponding number.
2. features.txt
    + Variables measured during the experiment.
3. features_info.txt
    + Provides more detailed information about which variables were measured and how they were measured.
4. README.txt
    + Provides detailed information about the experiment including objective, design methods, variables, data sets etc.
5. test
    + Folder containing experimental data for subjects in the "test" group.
    + Includes "subject", "y", and "x" text files containing subject identifiers, activity labels, and feature                measurements respectively.
6. train
    + Folder containing experimental data for subjects in the "train" group.
    + Includes "subject", "y", and "x" text files containing subject identifiers, activity labels, and feature                measurements respectively.

Note: the test and train folders both also contained a subfolder titled "Inertial Signals". This data was not used in the tidying process.


### Data Acquisition

The script run_analysis.R downloads the zip file from the link included in the **Source Data** section. Additionally, the script unzips the folder, extracts all files into the working directory, and reads the required files into R using `read.table()`.


### Tidying the Data

Ultimately the run_analysis.R script creates a tidy data set from the six files mentioned in the **Source Data** section. The code uses relative file paths in hopes that the script can run as long as the source files are in the working directory.

**Below you will find more detailed information about how each source file was used or modified in order to tidy the data**.

#### Using/Modifying the Source Data

1. activity_labels.txt
    + The column names of this data were changed to **Number** and **Activity** to describe the data in each column.
    + This file was referenced to convert the numerical labels to more descriptive labels in the *y* files within the test and train data.  


2. features.txt
    + The column names for this file were changed to **Feature Number** and **Feature Name** in order to describe the data in each column. This file contained 561 rows, while the *x* files for both the test and train folders contained 561 columns.
    + The matching dimensions implied that the *x* files data corresponded to features, specifically the feature names. Therefore the **Feature Name** data was used to name the columns of the *x* files in both the test and train data sets.

3. features_info.txt
    + This data was not modified. It served as the codebook for the data and was used to identify which variables among the features should be included in the final tidy data set. It was also used to create the updated codebook for this project. 
    + See the **For the Grader** section for more info regarding the decision making process of which variables to include in the final tidy data set.

4. README.txt
    + This file was not modified but was used to determine the purpose of each file in the source data and to understand the design of the original experiment (e.g. number of subjects, variables, etc.). In particular this file clarified that the  designers of the experiment split the 30 subjects into two groups called "test" and "train". Therefore the "subject", "y", and "x" files from the test and train folders should be combined to form the final data set. 

5. test

The *test* folder contains "subject", "y", and "x" text files.

* subject,
    + The column name of this file was changed to **Subject** to indicate which subject was measured.
* y 
    + The column name of this file was changed to **Activity** to indicate which activity was performed.
    + The numerical values in this file were changed to WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING according to the "activity_labels" file. This change clarifies the activity performed by a subject for a particular measurement.
* x 
    + The column names of this file were changed to match the feature names in the "features" file. This naming               structure clarifies which variable corresponds to a particular measurement
    
After the modifications above, the columns of the three files were bound together in the order "subject"", "y", "x".

6. train
    + The train folder contained three more text files titled "subject", "y", and "x". These files contained the same type of data as those in the test folder, but corresponding to different subjects. The three files were modified using the same procedures as described for the test files above.


#### Creating the Tidy Data

After the test files were bound by columns and the train files were bound by columns, the resulting file was bound by rows. The new result was a dataframe containing every observation from the experiment. The script installs and loads dplyr in case the user does not have the package. The dplyr package was then used to clean the data further.

Per the project instructions *measurements on the mean and standard deviation for each measurement* were the only extracted features. These features were extracted using regular expressions in combination with dplyr functions. As noted in the **For the Grader** section some features containing *mean* in the title were excluded since they were calculated using the source data.

The dplyr packaged was then used to calculate the desired averages. The data was grouped by the subject number         (1 through 30) and by activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING), and the mean of each feature was calculated based on the groups (180 total groups). Additionally, the names of the feature columns were renamed to indicate that the mean of a feature was computed. For example the column name `tBodyAcc-mean()-X` was changed to `mean_tBodyAcc-mean()-X`.

#### Result

The tidy data frame was named `feature_averages_wide` to indicate that the average of the features was calculated and that the data is in a "wide" tidy format. The file contains 180 rows and 68 columns. Each column represents a unique variable including Subject, Activity, and the desired feature means. Each row represents an observation with the Subject and Activity labels combining to identify unique observations. 

Again, see the **For the Grader** for details regarding the decision to present the data in this format.

For convenience a screenshot of a portion of `feature_averages_wide` is included below:

![](C:/Users/jksim/Pictures/Screenshots/Screenshot 2024-08-27 180554.png)



## Acknowledgements and References

This project represents my own work, but was completed with acknowledgement of and with reference to the sources below.

* [David Hood's](https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/) blog post
    + This post was helpful in settling on a wide vs narrow format for the final tidy data set and especially helpful in writing a README that would streamline the peer evaluation process.
* [Pragy's](https://github.com/pragyy/datascience-readme-template?tab=readme-ov-file) datascience README template
    + This document was useful in structuring this README document and deciding what information to include
* Coursera discussion forums
    + The project guidelines were fairly open ended and the forums provided useful advice and direction.


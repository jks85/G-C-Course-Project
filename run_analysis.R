# Commented code for tidying the Samsung wearable tech dataset can be found below


# set wd and download project zip folder

setwd("C:/Users/jksim/Desktop/R Coursera/Getting and Cleaning Data/Course Project")
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"./Project.zip")


# unzip folder and extract files
#set working directory to folder containing project files

unzip("./Project.zip", exdir = file.path(getwd()))
setwd("./UCI HAR Dataset")


# Note: Using relative file paths so that the script can be run as long as the files are in the working directory 


# Load feature names
# These are the column names for test_x and train_x files
# assign names to feature columns

features = read.table("./features.txt")
names(features) = c('Feature Number', "Feature Name")


# Load activity label definitions and name columns

activity_labels = read.table("./activity_labels.txt")
names(activity_labels) = c('Number','Activity')


# Load test data for test group and trial group
# Assign feature names from above as column names to test and train data frames

x_test = read.table("./test/X_test.txt")
names(x_test) = features$`Feature Name`
x_train = read.table("./train/X_train.txt")
names(x_train) = features$`Feature Name`


# Load activity labels for test group and trial group
# Assign column names

y_test = read.table("./test/y_test.txt")
names(y_test) = c('Activity')
y_train = read.table("./train/y_train.txt")
names(y_train) = c('Activity')


# Replace numerical labels with descriptions from the activity labels
for(i in 1:6){
  y_test[y_test$Activity== i,] = 
    activity_labels[i,2]
  y_train[y_train$Activity== i,] = 
    activity_labels[i,2]
}


# Load subject info for test group

subject_test = read.table("./test/subject_test.txt")
names(subject_test) = c('Subject')
subject_train = read.table("./train/subject_train.txt")
names(subject_train) = c('Subject')


#Bind columns from test files together; bind columns train files together
combined_testdata = cbind(subject_test, y_test, x_test)
combined_traindata = cbind(subject_train, y_train, x_train)

# Bind rows from test data and train data
full_data = rbind(combined_testdata,combined_traindata)

#install and load dplyr to allow processing and analysis of data
install.packages("dplyr")
library(dplyr)

# Select columns that indicate  mean or std dev of signals. Keep Subject and Activity columns also
requested_data = full_data%>%select(matches("Subject|Activity|-mean\\()|-std\\()")) 

# Compute the mean for each of the selected feature variables for each subject based on the activity
feature_averages_wide = requested_data%>%
  group_by(Subject,Activity)%>%
  summarize(across(`tBodyAcc-mean()-X`:`fBodyBodyGyroJerkMag-std()`,mean, .names = "mean_{.col}"))

# feature_averages_wide is the tidy data set
# wide has been included in the name to reflect the shape
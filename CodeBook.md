Getting and Cleaning Data (Coursera). Course Project Codebook
==============================================================

Thiscode book describes the variables, the data, and any transformations or work that was performed to clean up the data


## Original Data

* [description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

* [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

Check *README.txt* and *features_info.txt* in unzipped dataset folder for detailed information about dataset


## run_analysis.R script

Steps performed in cleaning of data:

1. merge training and test sets
  * merge training set *train/X_train.txt* with test set *test/X_test.txt* into variable `X`  (10299x561 data frame)
  * merge training labels *train/y_train.txt* with test labels *test/y_test.txt* into variable `Y`  (10299x1 data frame)
  * merge training subjects *train/subject_train.txt* with test subjects *test/subject_test.txt* into variable `subject` (10299x1 data frame)

2. extract mean and standard deviation measurements
  * read the list of all features from *features.txt* into `features` variable
  * use features list to filter mean and standard measurements in `X` (66 measures)
  * change variable names in  `X` using  `features` variable
  * remove (, ) and - from variable names and lowercase them

#### Example of original and tidy data names

 | Original data               | Tidy data             | 
 | --------------------------- | --------------------- |
 | tBodyAcc-mean()-X           | tbodyaccmeanx         |
 | tBodyGyroJerkMag-std()      | tbodygyrojerkmagstd   |


3. use descriptive activity names to name the activities in the data set
  * read activity names from  *activity_labels.txt* into `activity_labels` variable
  * remove _ from activity names lowercase them
  * replace activity numbers with appropriate activity names in `Y`

4. Appropriately labels the data set with descriptive variable names
  * change variable names in  `X` using  `features` variable
  * remove (, ) and - from variable names and lowercase them
  * change column name in `Y` to "activity"
  * change column name in `subject` to "subject"

5. Combine and save dataset
  * combine `X`, `Y` and `subject` into one dataset `cleandata`
  * save that dataset to *clean_data.txt* in working directory

6. Calculate second clean dataset 
  * for each activity and each subject calculate average value for each measurement and save the value in `cleandataMean` dataset
  * save that dataset to *clean_data_mean.txt* in working directory
  
  

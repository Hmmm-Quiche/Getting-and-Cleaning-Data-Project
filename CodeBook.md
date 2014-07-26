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
  * merge training set `train/X_train.txt` with test set `test/X_test.txt` into variable `X`
  * merge training labels `train/y_train.txt` with test labels `test/y_test.txt` into variable `Y`
  * merge training subjects `train/subject_train.txt` with test subjects `test/subject_test.txt` into variable `subject`



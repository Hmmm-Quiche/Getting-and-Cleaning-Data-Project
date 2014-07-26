Getting-and-Cleaning-Data-Project
=================================

This script explains how to successfully run_analysis.R script


* download and unzip raw data set from [source link] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* rename folder with unzipped data to: "UCI HAR Dataset"
* make sure that run_analysis.R script and "UCI HAR Dataset" folder are in the same directory
* set working directory in run_analysis.R script

```r
  # before you run this script change path to point to directory
  # with run_analysis.R script and "UCI HAR Dataset" folder 
  setwd("~/Documents/JH_data_science/Getting_and_Cleaning_Data/course_project")
```

* run script with `source("run_analysis.R")` command in RStudio
* script reads data from "UCI HAR Dataset" and produces two datasets:
  
1. **clean_data.txt**         --  10299 x 68 data set with mean and standard deviation measurements
2. **clean_data_mean.txt**    --  180 x 68 data set with avarage values for each activity and each subject of mean and standard deviation measurements 

* you can use  `data <- read.table("clean_data_mean.txt.txt")` to read the latter.

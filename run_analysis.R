
# before you run this script change path to point to directory
# with run_analysis.R script and "UCI HAR Dataset" folder 
setwd("~/Documents/JH_data_science/Getting_and_Cleaning_Data/course_project")

# source od data:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# files were downloaded and unzipped in UCI_HAR_Dataset subfolder in working directory

# script steps:

# 1. Merges the training and the test sets to create one data set.

train <- read.table("UCI_HAR_Dataset/train/X_train.txt")
test <- read.table("UCI_HAR_Dataset/test/X_test.txt")
X <- rbind(train, test)

train <- read.table("UCI_HAR_Dataset/train/y_train.txt")
test <- read.table("UCI_HAR_Dataset/test/y_test.txt")
Y <- rbind(train, test)

train <- read.table("UCI_HAR_Dataset/train/subject_train.txt")
test <- read.table("UCI_HAR_Dataset/test/subject_test.txt")
subject <- rbind(train, test)

#remove temp variables
rm(train)
rm(test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("UCI_HAR_Dataset/features.txt")
meanStdCols <- grep("mean\\(\\)|std\\(\\)", features[, 2])

X <- X[, meanStdCols]

# 3. Uses descriptive activity names to name the activities in the data set

activity_labels <- read.table("UCI_HAR_Dataset/activity_labels.txt")
activity_labels[, 2] <- tolower(gsub("_", "", activity_labels[, 2]))

Y[,1] <- activity_labels[Y[,1], 2]

# 4. Appropriately labels the data set with descriptive variable names. 

names(X) <- features[meanStdCols, 2]
names(X) <- gsub("\\(|\\)|-", "", names(X))  # remove (, ) and - from column names
names(X) <- tolower(names(X))  # lowercase column names

names(Y) <- "activity"

names(subject) <- "subject"

# combine datasets
cleandata<- cbind(subject, Y, X)

# write dataset to file
write.table(cleandata, "clean_data.txt")

# 5. Creates a second, independent tidy data set with the average of each 
# variable for each activity and each subject. 

require(reshape2)

cleandataMelt <- melt(cleandata, id.vars=c("subject", "activity"), measure.vars=names(cleandata)[-c(1:2)])

cleandataMean <- dcast(cleandataMelt, activity + subject ~ variable, mean)

# write dataset to file
write.table(cleandataMean, "clean_data_mean.txt")


## file name "run_analysis.r", author: Kasandra Castle

## Step 1: Merge the training and the test sets to create one data set

## load packages

library(dplyr)

## read in data  

trainValues <- read.table("X_train.txt")
trainActivities <- read.table("y_train.txt")
trainSubjects <- read.table("subject_train.txt")
testSubjects <- read.table("subject_test.txt")
testActivities <- read.table("y_test.txt")
testValues <- read.table("X_test.txt")
names <- read.table("features.txt", as.is = TRUE)
activities <- read.table("activity_labels.txt", stringsAsFactors = FALSE)

## merge dataframes to create one dataframe

merged <- rbind(
  cbind(trainSubjects, trainValues, trainActivities),
  cbind(testSubjects, testValues, testActivities))

## give the columns names

colnames(merged) <- c("subject", names[, 2], "activity")

## Step 2: Extract only the measurements of mean and standard deviation

x <- c("subject", "std", "mean", "activity")
measurements <- merged[grepl(paste(x, collapse = "|"), names(merged))] ## extract all columns with variable names including "std" or "mean"

## Step 3: Give activities specific labels

measurements$activity <- factor(measurements$activity,
  levels = c(1, 2, 3, 4, 5, 6),
  labels = c("walking", "walkingUpstairs", "walkingDownstairs", "sitting", "standing", "laying"))

## Step 4: Label the data set with descriptive variable names

actNames <- colnames(measurements)
actNames <- gsub("[\\(\\)-]", "", actNames) ## remove punctuation
actNames <- gsub("^t", "time", actNames) ## expand abbreviation t
actNames <- gsub("^f", "frequency", actNames) ## expand abbreviation f
actNames <- gsub("Mag", "Magnitude", actNames) ## expand abbreviation Mag
actNames <- gsub("Acc", "Acceleration", actNames) ## expand abbrevation Acc
actNames <- gsub("Gyro", "Gyroscope", actNames) ## expand abbreviation Gyro
actNames <- gsub("mean", "Mean", actNames) ## capitalize mean for consistent use of camel case
actNames <- gsub("std", "StandardDeviation", actNames) ## expand std abbreviation and capitalize for consistent use of camel case
actNames <- gsub("BodyBody", "Body", actNames) ## remove repeated words

## use the modified activity names as the column names of the final data set

colnames(measurements) <- actNames

## Step 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject

grouped <- group_by(measurements, subject, activity) ## group the data by subject and activity
variableMeans <- grouped %>% summarize_all(mean) ## take the mean of all non-grouping columns  

## save data to file

write.table(variableMeans, file = "samsung_tidy_data.txt", quote = FALSE, sep = " ", row.names = FALSE)
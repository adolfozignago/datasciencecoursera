## Script run_analysis.R for Peer-graded Assigment : Getting and Clean Data Course

## Reading files and prepare the data

## Feature and activity files
df_act_labels <- read.table("./activity_labels.txt")
df_features <- read.table("./features.txt")

## Test files
x_subject_test <- read.table("./test/subject_test.txt")
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")

## Adding new columns on Test File
colnames(x_subject_test) <- c("subj_ID")
colnames(y_test) <- c("act_ID")
colnames(x_test) <- df_features[, 2]

df_test <- cbind(x_subject_test, y_test, x_test)

## Training files
x_subject_train <- read.table("./train/subject_train.txt")
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")

## Adding new columns on Train File
colnames(x_subject_train) <- c("subj_ID")
colnames(y_train) <- c("act_ID")
colnames(x_train) <- df_features[, 2]

df_train <- cbind(x_subject_train, y_train, x_train)

## Merges the training and the test sets to create one data set.
ds_test_train <- rbind(df_test, df_train)

## Extracts only the measurements on the mean and standard deviation for each measurement.
colnames_list <- colnames(ds_test_train) # Read columns names to find the characters
df_mean_sd <- (grepl("subj_ID", colnames_list) |
                         grepl("act_ID", colnames_list) |
                         grepl("mean..", colnames_list) |
                         grepl("std..", colnames_list)) ## Using and regular expresion 

ds_only_mean_std <- ds_test_train[, df_mean_sd] 

## Uses descriptive activity names to name the activities in the data set.
## Appropriately labels the data set with descriptive variable names. 

colnames(df_act_labels) <- c("act_ID", "act_NAME") ## Add column name to activity dataframe to make the merge

df <- ds_test_train[order(ds_test_train[, 2]), ]
ds_test_train <- merge(df, df_act_labels, by="act_ID") ## Adding the activity_NAME

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

myTidyData <- aggregate(. ~subj_ID + act_NAME, ds_test_train, mean)
myTidyData <- myTidyData[order(myTidyData$subj_ID, myTidyData$act_ID), ]

write.table(myTidyData, "MyTidyData.txt", row.name = FALSE)

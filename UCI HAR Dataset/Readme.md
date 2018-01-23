# Script run_analysis.R for Peer-graded Assigment : Getting and Clean Data Course

Copy the complete folder UCI HAR Dataset on your computer and setup as working directory on R

## Reading files and prepare the data
The script read first the feature and the activity files.

Then, read the all the test and train files. After read the files, adds column names to all the files
to make both files equals.

## Merges the training and the test sets to create one data set.
The script uses the function rbind to merge both files.

## Extracts only the measurements on the mean and standard deviation for each measurement.

After merge the files, the script creates a list of the column names to find all the columns to have the word "mean" and "std"
to select only those columns.

## Uses descriptive activity names to name the activities in the data set.
## Appropriately labels the data set with descriptive variable names. 

Add column names to activity dataframe to make the merge with the complete data set.

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The aggregate function allows to group the data set by subject_ID and activity_ID to generate the average for all the columns.
After that, the script create a .txt file in the same directory. 
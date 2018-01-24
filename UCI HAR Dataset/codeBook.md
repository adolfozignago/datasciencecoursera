# CODE BOOK for Getting and Cleaning Data Assignment

## Data

This database come from the experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years wearing a smartphone.
The raw data contains accelerometer and gyroscope.
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

	- Data file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
	- CodeBooke: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset includes the following files:

- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'activity_labels.txt': Links the class labels with their activity name.


- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

## Data Load

- Create a new dataset that contain subject, activity and data for both groups (Test and Train)
- Select only the columns of interest, thats means all the columns that contain mean() and std() information.
You must check on the features file which columns are.

## Transformation

- Read the files
- Add columns names on subject, activity and dataset (test and train) to make the merge.

- Select only the columns of interest, creating a new list of columns that has mean or std in the colnames.
The result is ds_only_mean_std dataset.

- The column names are tidied by removing "(", "-", ".", changing "t" by "time", etc.

The result is myTidyData
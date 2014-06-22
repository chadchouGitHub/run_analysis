The orignial data download from this link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This data source is comming from this project:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

In peer review assignment I will perform these steps to create new data set "ren_analysis_result.txt"

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The zip file will unzip into 2 folder and several txt file. Two folders are "test" and "train" folder.

This data set came from 30 people. Each person perform 6 activities. Each activity record 128 time fragment Each time fragment record the sensor reading from X,Y, and Z.

This Data set including 561 feature vector computing from 128 time fragment data for each subject in each activity.

The merge of test and train will created a 180 (30 people with 6 activities) row data with 563 col (561 features plus subject ID and activities).

The activities label in the train and test data set are label with class number (1~6) as show in activity_labels.txt.

Transform activitiy class number into activity name with labels. 
The older of elements in the label must match the activity_labels.txt. So the index number of elements in the lables can be use to subset the element to replace activity class number in the activity col.

Use melt function and dcast function to create final_means data.


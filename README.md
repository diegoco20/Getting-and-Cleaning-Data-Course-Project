# Getting-and-Cleaning-Data-Course-Project

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


# How Script Works 
The current Script involve the following 4 steps
1. It loads the data from the following site https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
the files loaded in the Global Environment are the train and test measurements and activities and the subjects who performed the activity as data frames X_train/test, y_train/test and subject_train/test respectively descriptive files of activities and features are also loaded as activities and features respectively.
The train and test data frames are merged by the rbind function in the x_merge, y_merge and Subjects data frames.

2. The values of only mean and std are extracted from measurements with the grepl function and are appropriately labeled
3. The numerical labels of the activities are changed for descriptive labels through the factor function.
4. With the data filtered and properly labeled, a new data frame called tidy_data is created, this is grouped by subject and activity in a new data frame called tidy_data_group with the group_by function to later be summarized for the mean of measurements according to the subject and activity and with the function write.table the file "tidy_data.txt" is created. 

      
      

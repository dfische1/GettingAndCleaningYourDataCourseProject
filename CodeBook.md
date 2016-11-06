The following is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data

Data Used (UCI HAR Dataset folder):
- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Variable List:
 [1] "subject"                   "activity_desc"             "activity_code"            
 [4] "tBodyAcc_std_X"            "tBodyAcc_std_Y"            "tBodyAcc_std_Z"           
 [7] "tGravityAcc_std_X"         "tGravityAcc_std_Y"         "tGravityAcc_std_Z"        
[10] "tBodyAccJerk_std_X"        "tBodyAccJerk_std_Y"        "tBodyAccJerk_std_Z"       
[13] "tBodyGyro_std_X"           "tBodyGyro_std_Y"           "tBodyGyro_std_Z"          
[16] "tBodyGyroJerk_std_X"       "tBodyGyroJerk_std_Y"       "tBodyGyroJerk_std_Z"      
[19] "tBodyAccMag_std"           "tGravityAccMag_std"        "tBodyAccJerkMag_std"      
[22] "tBodyGyroMag_std"          "tBodyGyroJerkMag_std"      "fBodyAcc_std_X"           
[25] "fBodyAcc_std_Y"            "fBodyAcc_std_Z"            "fBodyAccJerk_std_X"       
[28] "fBodyAccJerk_std_Y"        "fBodyAccJerk_std_Z"        "fBodyGyro_std_X"          
[31] "fBodyGyro_std_Y"           "fBodyGyro_std_Z"           "fBodyAccMag_std"          
[34] "fBodyBodyAccJerkMag_std"   "fBodyBodyGyroMag_std"      "fBodyBodyGyroJerkMag_std" 
[37] "tBodyAcc_mean_X"           "tBodyAcc_mean_Y"           "tBodyAcc_mean_Z"          
[40] "tGravityAcc_mean_X"        "tGravityAcc_mean_Y"        "tGravityAcc_mean_Z"       
[43] "tBodyAccJerk_mean_X"       "tBodyAccJerk_mean_Y"       "tBodyAccJerk_mean_Z"      
[46] "tBodyGyro_mean_X"          "tBodyGyro_mean_Y"          "tBodyGyro_mean_Z"         
[49] "tBodyGyroJerk_mean_X"      "tBodyGyroJerk_mean_Y"      "tBodyGyroJerk_mean_Z"     
[52] "tBodyAccMag_mean"          "tGravityAccMag_mean"       "tBodyAccJerkMag_mean"     
[55] "tBodyGyroMag_mean"         "tBodyGyroJerkMag_mean"     "fBodyAcc_mean_X"          
[58] "fBodyAcc_mean_Y"           "fBodyAcc_mean_Z"           "fBodyAccJerk_mean_X"      
[61] "fBodyAccJerk_mean_Y"       "fBodyAccJerk_mean_Z"       "fBodyGyro_mean_X"         
[64] "fBodyGyro_mean_Y"          "fBodyGyro_mean_Z"          "fBodyAccMag_mean"         
[67] "fBodyBodyAccJerkMag_mean"  "fBodyBodyGyroMag_mean"     "fBodyBodyGyroJerkMag_mean"

Transformations (broken out by steps of the assigmment):
#1 Merges the training and the test sets to create one data set.
#set wd to correct folder
setwd("~/Documents/UCI HAR Dataset")
merge test labels and dataset
read/add test subject
merge train labels and dataset
read/add train subject
combine the test and training datasets
######################################################################################################################
#2 Extract only the measurements on the mean and standard deviation for each measurement
######################################################################################################################
#3 Use descriptive activity names to name the activities in the data set
assign activity description to activity code
######################################################################################################################
#4 Appropriately label the data set with descriptive variable names
Already completed - see step 1 where feature_name is assigned
######################################################################################################################
#5 From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
modify variable names to allow for summary statistic calculations
aggregate the data to get averages for each measure
drop the description column as it is part of the aggregation
remove extra subject column
rename aggregation fields with more meaningful names
write file for tidy data using write.table()




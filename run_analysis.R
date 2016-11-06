###################################################################################################################################################
#1 Merges the training and the test sets to create one data set.
#set wd to correct folder
#setwd("~/Documents/UCI HAR Dataset")

#read feature information
features_df = read.table("~/Documents/GettingAndCleaningDataCourseProject/UCI HAR Dataset/features.txt")
nrow(features_df)
#head(features_df)
features = features_df[2]
names(features) <- c('feature_name')
names(features)
#head(features)

#test labels
y_test = read.table("~/Documents/GettingAndCleaningDataCourseProject/UCI HAR Dataset/test/y_test.txt")
names(y_test) <- c('activity')
#head(y_test)

x_test = read.table("~/Documents/GettingAndCleaningDataCourseProject/UCI HAR Dataset/test/x_test.txt")
names(x_test) <- features$feature_name
#head(x_test)
length(x_test)
nrow(x_test)

#merge test labels and dataset
test <- merge(y_test,x_test,by=0)
#head(test)
nrow(test)

#test subject
test_sub = read.table("~/Documents/GettingAndCleaningDataCourseProject/UCI HAR Dataset/test/subject_test.txt")
names(test_sub) <- c('subject')
head(test_sub)
nrow(test_sub)
unique(test_sub)

#Add subject
test$subject <- test_sub$subject
#head(test)

#train labels
y_train = read.table("~/Documents/GettingAndCleaningDataCourseProject/UCI HAR Dataset/train/y_train.txt")
names(y_train) <- c('activity')
#head(y_train)

x_train = read.table("~/Documents/GettingAndCleaningDataCourseProject/UCI HAR Dataset/train/X_train.txt")
names(x_train) <- features$feature_name
#head(x_train)
nrow(x_train)

#merge train labels and dataset
train <- merge(y_train,x_train,by=0)
#head(train)

#train subject
train_sub = read.table("~/Documents/GettingAndCleaningDataCourseProject/UCI HAR Dataset/train/subject_train.txt")
names(train_sub) <- c('subject')
head(train_sub)
#nrow(train_sub)
#unique(test_sub)

#Add subject
train$subject <- train_sub$subject
#head(train)

#combine the test and training datasets
full_data = rbind(train,test)
#head(full_data)
nrow(test)
nrow(train)
nrow(full_data)

###################################################################################################################################################
#2 Extract only the measurements on the mean and standard deviation for each measurement
stdDF <- full_data[,grepl('std()',names(full_data),fixed=TRUE)]
names(stdDF)

meanDF <- full_data[,grepl('mean()',names(full_data),fixed=TRUE)]
names(meanDF)

activity_code <- full_data$activity
#head(activity_code)

subject <- full_data$subject

final_data <- cbind(activity_code,subject,stdDF,meanDF)

names(final_data)
head(final_data)

###################################################################################################################################################
#3 Use descriptive activity names to name the activities in the data set
#assign activity description to activity code
final_data$activity_desc[which(final_data$activity_code == 1)] <- "walking"
final_data$activity_desc[which(final_data$activity_code == 2)] <- "walking upstairs"
final_data$activity_desc[which(final_data$activity_code == 3)] <- "walking downstairs"
final_data$activity_desc[which(final_data$activity_code == 4)] <- "sitting"
final_data$activity_desc[which(final_data$activity_code == 5)] <- "standing"
final_data$activity_desc[which(final_data$activity_code == 6)] <- "laying"

#perform quality checks to ensure proper description assignment
unique(final_data$activity_desc)
#head(subset(final_data, final_data$activity_code == 1)) #repeat for activities 2:6

###################################################################################################################################################
#4 Appropriately label the data set with descriptive variable names
#Already completed - see step 1 where feature_name is assigned

###################################################################################################################################################
#5 From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

#modify variable names to allow for summary statistic calculations
namesStr1 <- names(final_data)
namesStr2 <- gsub("-","_",namesStr1)
namesStr3 <- gsub("mean\\()","mean",namesStr2)
namesStr4 <- gsub("std\\()","std",namesStr3)

names(final_data) <- namesStr4
names(final_data)

#aggregate the data to get averages for each 
aggdata <-aggregate(final_data, by=list(final_data$subject,final_data$activity_desc), FUN=mean, na.rm=TRUE)

#drop the description column as it is part of the aggregation
aggdata_final <- subset(aggdata, select = -c(71) )
head(aggdata_final)

#remove extra subject column
aggdata_final <- subset(aggdata_final, select = -c(4) )
head(aggdata_final)


#rename aggregation fields with more meaningful names
finalNameStr1 <- names(aggdata_final)
finalNameStr2 <- gsub("Group.1","subject",finalNameStr1)
finalNameStr3 <- gsub("Group.2","activity_desc",finalNameStr2)
names(aggdata_final) <- finalNameStr3

#write file for tidy data using write.table()
write.table(aggdata_final,"~/Documents/GettingAndCleaningDataCourseProject/tidy_data.txt",row.names=FALSE)


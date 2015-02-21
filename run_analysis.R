#Step 1 - Import Data 
  #1.1 - Test Data
library(plyr)
test_X<-read.table("./UCI HAR Dataset/test/X_test.txt")
test_y<-read.table("./UCI HAR Dataset/test/y_test.txt")
test_subject<-read.table("./UCI HAR Dataset/test/subject_test.txt")
  
  #1.2 - Train Data
train_X<-read.table("./UCI HAR Dataset/train/X_train.txt")
train_y<-read.table("./UCI HAR Dataset/train/y_train.txt")
train_subject<-read.table("./UCI HAR Dataset/train/subject_train.txt")

  #1.3 - Reference Data
ref_features<- read.table("./UCI HAR Dataset/features.txt")
ref_activities<- read.table("./UCI HAR Dataset/activity_labels.txt")

#Step 2 - Merging both train and test data sets
data_frame_observations<- rbind(test_X, train_X)
data_frame_activities<- rbind(test_y, train_y)
data_frame_subjects<- rbind(test_subject, train_subject)

#Step 3 - Naming the features of each column in the data frame of observations
names(data_frame_observations)<- as.character(unlist(ref_features[2]))


#Step 4 - New Data frame with filtered observations for mean and standard deviation
final_data_frame<-data_frame_observations[
  grep("mean()|std()", names(data_frame_observations)) ]

final_data_frame<-final_data_frame[
  !grepl("meanFreq", names(final_data_frame)) ]

#Step 5 - Adding the information about the activity and the subject for each observed features
final_data_frame$ACTIVITY<- as.character(data_frame_activities$V1)
final_data_frame$subject<-as.character(data_frame_subjects$V1)

#Step 6 - Replacing Activity ID for its description
list_activities =  ref_activities$V2
names(list_activities) = ref_activities$V1
final_data_frame$ACTIVITY <-  as.character(list_activities[as.numeric(final_data_frame$ACTIVITY)])

#Step 7 - Just to reorder the columns in the dataframe
final_data_frame<-final_data_frame[c("subject","ACTIVITY",setdiff(names(final_data_frame), c("ACTIVITY","subject")))]


#Step 8 - Calculate the tidy data set
final_data_frame_for_submission <- 
  ddply(final_data_frame, .(subject, ACTIVITY), numcolwise(mean))

#Step 9 - Export the tidy data set to a text file
write.table(final_data_frame_for_submission, file = "./tidy_data_set.txt", row.name=FALSE)

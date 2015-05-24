library(stringr)
library(data.table)
library(dplyr)

path3 =("c:/users/alfred/get and clean data/UCI HAR Dataset")

##open tables to construct master frame and descriptions 
features<-read.table(str_c(path3,"/features.txt"))

Testdat<-read.table(str_c(path3,"/test/X_test.txt"),col.names=features$V2)
traindat<-read.table(str_c(path3, "/train/X_train.txt"),col.names=features$V2)###1
train_label<-read.table(str_c(path3,"/train/y_train.txt")) ###1
test_label<-read.table(str_c(path3,"/test/y_test.txt"))    ###2
activities<-read.table(str_c(path3,"/activity_labels.txt"))
Test_subjects<-read.table(str_c(path3,"/test/subject_test.txt"))###2
Train_subjects<-read.table(str_c(path3,"/train/subject_train.txt")) ###1

Subjects<-rbind(Test_subjects,Train_subjects)

Dataset<-rbind(Testdat,traindat)
#merge or left-join actual activities with label index and preserve there 
#actual order of performance as indicated by y_train.txt and y_test.txt

Activity_test_label<-left_join(test_label,activities)
Activity_train_label<-left_join(train_label,activities)
#creat Activity set
Activity_label<-rbind(Activity_test_label,Activity_train_label)

# select rows containing precalculated mean and std reading's
 #for both training and test data and combine
Dataset1<-select(Dataset,contains( "mean"))
Dataset2<-select(Dataset,contains( "std"))
Dataset<-cbind(Dataset1,Dataset2)

# set descripitive column names for the subjects and the activity /id
# testing order is preserved
colnames(Subjects)<-"Subject_id"
colnames(Activity_label) <- c("Activity_ID","Activity")
Data_Complete<-cbind(Subjects,Activity_label,Dataset)

# reshape ; calculate average for all features by subject and activity 
require(reshape2)
tidy_data<-melt(as.data.table(Data_Complete),id=1:3)
#calculate and reconstitute  shape
tidydata<-dcast.data.table(tidy_data,Subject_id + Activity_ID + Activity ~ variable,fun=mean)

#modify names to be more descripitive while being aware of oversised widths for names
# scrape the names to prevent subsequent code from throwing warnings 
# also adds to performance since the whole table is not copied to memory a second time.
tidynames<-colnames(tidydata)

tidynames<-gsub("...","-",tidynames,fixed=TRUE)
tidynames<-gsub("..","-",tidynames,fixed=TRUE)
tidynames<-gsub(".","-",tidynames,fixed=TRUE)
tidynames<-gsub("BodyBody","Body",tidynames,fixed=TRUE)
tidynames<-gsub("mean","Mean",tidynames,fixed=TRUE)
tidynames<-gsub("std","Std",tidynames,fixed=TRUE)
 # reset the modified names to our tidydata
setnames(tidydata,tidynames)

# save to disc on local machine.
write.table(tidydata,file = str_c(path3,"/tidy_dataset.txt"),sep="\t",row.names=FALSE,)

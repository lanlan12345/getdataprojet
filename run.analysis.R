library(data.table)
library(stats)

# read the data from local files
X_train <- fread("./UCI HAR Dataset/train/X_train.txt")
Y_train <- fread("./UCI HAR Dataset/train/Y_train.txt")
X_test  <- fread("./UCI HAR Dataset/test/X_test.txt")
Y_test <- fread("./UCI HAR Dataset/test/Y_test.txt")
act_labels <- fread("./UCI HAR Dataset/activity_labels.txt")
features <- fread("./UCI HAR Dataset/features.txt")
subject_train <- fread("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- fread("./UCI HAR Dataset/test/subject_test.txt")

#1 Merges the training and the test sets to create one data set.
Y <- rbind(Y_train,Y_test)
X <- rbind(X_train,X_test)
subject <- rbind(subject_train,subject_test)
names(subject) <- "subject"

#2 Extracts only the measurements on the 
#mean and standard deviation for each measurement. 
mean_feature <- grep("mean",features$V2)
std_feature <- grep("std",features$V2)
mean_std_feature <- sort(union(mean_feature,std_feature))
cols = paste("V", mean_std_feature, sep="")
Xms <- X[, cols, with=FALSE]

#3 Uses descriptive activity names to 
#name the activities in the data set
Y<-Y[,act_labels$V2[Y$V1]]

#4. Appropriately labels the data set 
#with descriptive variable names. 
colns<-features$V2[mean_std_feature]
names(Xms) <- colns

#5 From the data set in step 4, creates a second, 
#independent tidy data set with the average of 
#each variable for each activity and each subject.
tab<-cbind(subject,act = Y,Xms)
write.table(tab,"./alldata.txt",row.names = F)

df <- aggregate(tab, by=list(activity=tab$act,subj= tab$subject), FUN=mean)
df2 <- df[,-c(3,4)]
write.table(tab,"./tidydata.txt",row.names = F)


# load dplyr library
library(dplyr)


#import files
  #training set
X_train <- read.table('./UCI HAR Dataset/train/X_train.txt')
Y_train <- read.table('./UCI HAR Dataset/train/Y_train.txt')
S_train <- read.table('./UCI HAR Dataset/train/subject_train.txt')
  #test set
X_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
Y_test <- read.table('./UCI HAR Dataset/test/Y_test.txt')
S_test <- read.table('./UCI HAR Dataset/test/subject_test.txt')
  #features/activities
features <- read.table('./UCI HAR Dataset/features.txt')
activities <- read.table('./UCI HAR Dataset/activity_labels.txt')

#names columns
colnames(S_test) <- c('Subject')
colnames(S_train) <- c('Subject')

colnames(Y_test) <- c('Label')
colnames(Y_train) <- c('Label')
  #X names from features list
colnames(X_test) <- features$V2
colnames(X_train) <- features$V2

#Insert activity labels
Y_test[,'Label'] <- activities$V2[Y_test$Label]
Y_train[,'Label'] <- activities$V2[Y_train$Label]

#join data sets
train <- cbind(S_train,Y_train,X_train)
test <- cbind(S_test,Y_test,X_test)

all_data <- rbind(train,test)

#mean and std cols
names_mean <- grep("-mean()",features$V2) + 2
names_std <- grep("-std()",features$V2) + 2

#mean and std only
small_data <- all_data[,c(1:2,names_mean,names_std)]

#summarize into column means
summary.data <- ddply(small_data, .(Subject, Label), colwise(mean))

#output
write.table(summary.data,"Ass_output.txt",row.name=FALSE)




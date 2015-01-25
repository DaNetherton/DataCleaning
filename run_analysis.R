# run_analysis.R
# Load the packages needed for processing
library(dplyr)

# Load the two main data files and create data frames from them
## Test data file--We were told to run as if files were in the same folder, but this checks
## to make sure that files aren't in the subfolder in which they appear when unzipped.
if(file.exists("./test/X_test.txt")) {
	test<-read.table("./test/X_test.txt")
	} else {
	test<-read.table("./X_test.txt")
	}

## Training data file--We were told to run as if files were in the same folder, but this 
## Checks to make sure that files aren't in the subfolder in which they appear when unzipped.
if(file.exists("./train/X_train.txt")) {
	train<-read.table("./train/X_train.txt")
	} else {
	train<-read.table("./X_train.txt")
	}

# Append the two big files together in this order: test, train, so that train is at the
# bottom of the file and test is at the top.
all<-rbind(test, train)

## Delete those large files from working memory
rm(test); rm(train)

# Load the subject id files, while checking to make sure they exist
## test subject IDs
if(file.exists("./test/subject_test.txt")) {
	test_sids<-read.table("./test/subject_test.txt")
	} else {
	test_sids<-read.table("./subject_test.txt")
	}
	
## training subject IDs
if(file.exists("./train/subject_train.txt")) {
	train_sids<-read.table("./train/subject_train.txt")
	} else {
	train_sids<-read.table("./subject_train.txt")
	}

# Append the two subject ID files together in the same order as data file: test, train
all_sids<-rbind(test_sids, train_sids)

## Delete those large files from working memory
rm(test_sids); rm(train_sids)

# Load the activities files, checking their locations
## Pull in the test data file showing the activities--as df integers
if(file.exists("./test/y_test.txt")) {
	test_acts<-read.table("./test/y_test.txt")
	} else {
	test_acts<-read.table("./y_test.txt")
	}
	
## Pull in the training data file of activities trained--as df integers
if(file.exists("./train/y_train.txt")) {
	train_acts<-read.table("./train/y_train.txt")
	} else {
	train_acts<-read.table("./y_train.txt")
	}

# Append the two subject ID files together in the same order as data file: test, train
all_acts<-rbind(test_acts, train_acts)

## Delete those large files from working memory
rm(test_acts); rm(train_acts)

# Load column labels for the large data frame
col_names<-read.table("features.txt", stringsAsFactors = FALSE)

# Attach column labels to the data frame with all of the data in it
col_mat<-as.matrix(col_names)
col_vect<-as.vector(col_mat[,2])
names(all)<-col_vect

# Replace the values of activities with their labels--both given in "activity_labels.txt"
		all_acts$V1 <- replace(all_acts$V1, all_acts$V1==1, "WALKING")
		all_acts$V1 <- replace(all_acts$V1, all_acts$V1==2, "WALKING_UPSTAIRS")
		all_acts$V1 <- replace(all_acts$V1, all_acts$V1==3, "WALKING_DOWNSTAIRS")
		all_acts$V1 <- replace(all_acts$V1, all_acts$V1==4, "SITTING")
		all_acts$V1 <- replace(all_acts$V1, all_acts$V1==5, "STANDING")
		all_acts$V1 <- replace(all_acts$V1, all_acts$V1==6, "LAYING")

# Stick the three data frames together
all<-cbind(all_sids, all_acts, all)

# Give the two new variables names
colnames(all)[1]<-c("sid")
colnames(all)[2]<-c("activities")

# Make the activities variable a factor
all$activities <- factor(all$activities)

# Create subset with just the means and standard deviations
## Create a vector including variable names that include the string "std", "mean", or "Mean"
stds_and_means<-col_names$V2[grep("std",col_names$V2)]
stds_and_means<-c(stds_and_means,col_names$V2[grep("mean",col_names$V2)])
stds_and_means<-c(stds_and_means,col_names$V2[grep("Mean",col_names$V2)])

## Now select only the column names in the column name vector
stds_and_means <- c("activities", "sid", stds_and_means)

## And, finally, subset the data frame by that vector
all<- subset(all, select= c(stds_and_means))

# Make this a table so that it can be manipulated and summarized more easily
all<-tbl_df(all)

# Create variable names in a more standard notation
## Take the names from all
varsToChange<-names(all)

## Except for the first two, because they don't need to be renamed
varsToChange<-varsToChange[-c(1,2)]

## Change out the hyphens, the parentheses, commas, etc, and make camelCase
shortnames<-gsub("-","",varsToChange, fixed=TRUE)
shortnames<-gsub("meanFreq()","MeanFreq",shortnames, fixed=TRUE)
shortnames<-gsub("std()","Std",shortnames, fixed=TRUE)
shortnames<-gsub("mean()","Mean",shortnames, fixed=TRUE)
shortnames<-gsub("()","",shortnames, fixed=TRUE)
shortnames<-gsub("(","",shortnames, fixed=TRUE)
shortnames<-gsub(",","",shortnames, fixed=TRUE)
shortnames<-gsub(")","",shortnames, fixed=TRUE)
shortnames<-gsub("__","_",shortnames, fixed=TRUE)
shortnames<-gsub("gravity","Gravity",shortnames, fixed=TRUE)
shortnames<-gsub("anglet","tAngle",shortnames, fixed=TRUE)

# Apply the shortened names to the dataset
names(all)<-c("activities", "sid", shortnames)

# Create the tidy report summarizing the data
AccelerometerData<-summarise(group_by(all,activities, sid),
	tBodyAccStdXMean=mean(tBodyAccStdX),
	tBodyAccStdYMean=mean(tBodyAccStdY),
	tBodyAccStdZMean=mean(tBodyAccStdZ),
	tGravityAccStdXMean=mean(tGravityAccStdX),
	tGravityAccStdYMean=mean(tGravityAccStdY),
	tGravityAccStdZMean=mean(tGravityAccStdZ),
	tBodyAccJerkStdXMean=mean(tBodyAccJerkStdX),
	tBodyAccJerkStdYMean=mean(tBodyAccJerkStdY),
	tBodyAccJerkStdZMean=mean(tBodyAccJerkStdZ),
	tBodyGyroStdXMean=mean(tBodyGyroStdX),
	tBodyGyroStdYMean=mean(tBodyGyroStdY),
	tBodyGyroStdZMean=mean(tBodyGyroStdZ),
	tBodyGyroJerkStdXMean=mean(tBodyGyroJerkStdX),
	tBodyGyroJerkStdYMean=mean(tBodyGyroJerkStdY),
	tBodyGyroJerkStdZMean=mean(tBodyGyroJerkStdZ),
	tBodyAccMagStdMean=mean(tBodyAccMagStd),
	tGravityAccMagStdMean=mean(tGravityAccMagStd),
	tBodyAccJerkMagStdMean=mean(tBodyAccJerkMagStd),
	tBodyGyroMagStdMean=mean(tBodyGyroMagStd),
	tBodyGyroJerkMagStdMean=mean(tBodyGyroJerkMagStd),
	fBodyAccStdXMean=mean(fBodyAccStdX),
	fBodyAccStdYMean=mean(fBodyAccStdY),
	fBodyAccStdZMean=mean(fBodyAccStdZ),
	fBodyAccJerkStdXMean=mean(fBodyAccJerkStdX),
	fBodyAccJerkStdYMean=mean(fBodyAccJerkStdY),
	fBodyAccJerkStdZMean=mean(fBodyAccJerkStdZ),
	fBodyGyroStdXMean=mean(fBodyGyroStdX),
	fBodyGyroStdYMean=mean(fBodyGyroStdY),
	fBodyGyroStdZMean=mean(fBodyGyroStdZ),
	fBodyAccMagStdMean=mean(fBodyAccMagStd),
	fBodyBodyAccJerkMagStdMean=mean(fBodyBodyAccJerkMagStd),
	fBodyBodyGyroMagStdMean=mean(fBodyBodyGyroMagStd),
	fBodyBodyGyroJerkMagStdMean=mean(fBodyBodyGyroJerkMagStd),
	tBodyAccMeanXMean=mean(tBodyAccMeanX),
	tBodyAccMeanYMean=mean(tBodyAccMeanY),
	tBodyAccMeanZMean=mean(tBodyAccMeanZ),
	tGravityAccMeanXMean=mean(tGravityAccMeanX),
	tGravityAccMeanYMean=mean(tGravityAccMeanY),
	tGravityAccMeanZMean=mean(tGravityAccMeanZ),
	tBodyAccJerkMeanXMean=mean(tBodyAccJerkMeanX),
	tBodyAccJerkMeanYMean=mean(tBodyAccJerkMeanY),
	tBodyAccJerkMeanZMean=mean(tBodyAccJerkMeanZ),
	tBodyGyroMeanXMean=mean(tBodyGyroMeanX),
	tBodyGyroMeanYMean=mean(tBodyGyroMeanY),
	tBodyGyroMeanZMean=mean(tBodyGyroMeanZ),
	tBodyGyroJerkMeanXMean=mean(tBodyGyroJerkMeanX),
	tBodyGyroJerkMeanYMean=mean(tBodyGyroJerkMeanY),
	tBodyGyroJerkMeanZMean=mean(tBodyGyroJerkMeanZ),
	tBodyAccMagMeanMean=mean(tBodyAccMagMean),
	tGravityAccMagMeanMean=mean(tGravityAccMagMean),
	tBodyAccJerkMagMeanMean=mean(tBodyAccJerkMagMean),
	tBodyGyroMagMeanMean=mean(tBodyGyroMagMean),
	tBodyGyroJerkMagMeanMean=mean(tBodyGyroJerkMagMean),
	fBodyAccMeanXMean=mean(fBodyAccMeanX),
	fBodyAccMeanYMean=mean(fBodyAccMeanY),
	fBodyAccMeanZMean=mean(fBodyAccMeanZ),
	fBodyAccMeanFreqXMean=mean(fBodyAccMeanFreqX),
	fBodyAccMeanFreqYMean=mean(fBodyAccMeanFreqY),
	fBodyAccMeanFreqZMean=mean(fBodyAccMeanFreqZ),
	fBodyAccJerkMeanXMean=mean(fBodyAccJerkMeanX),
	fBodyAccJerkMeanYMean=mean(fBodyAccJerkMeanY),
	fBodyAccJerkMeanZMean=mean(fBodyAccJerkMeanZ),
	fBodyAccJerkMeanFreqXMean=mean(fBodyAccJerkMeanFreqX),
	fBodyAccJerkMeanFreqYMean=mean(fBodyAccJerkMeanFreqY),
	fBodyAccJerkMeanFreqZMean=mean(fBodyAccJerkMeanFreqZ),
	fBodyGyroMeanXMean=mean(fBodyGyroMeanX),
	fBodyGyroMeanYMean=mean(fBodyGyroMeanY),
	fBodyGyroMeanZMean=mean(fBodyGyroMeanZ),
	fBodyGyroMeanFreqXMean=mean(fBodyGyroMeanFreqX),
	fBodyGyroMeanFreqYMean=mean(fBodyGyroMeanFreqY),
	fBodyGyroMeanFreqZMean=mean(fBodyGyroMeanFreqZ),
	fBodyAccMagMeanMean=mean(fBodyAccMagMean),
	fBodyAccMagMeanFreqMean=mean(fBodyAccMagMeanFreq),
	fBodyBodyAccJerkMagMeanMean=mean(fBodyBodyAccJerkMagMean),
	fBodyBodyAccJerkMagMeanFreqMean=mean(fBodyBodyAccJerkMagMeanFreq),
	fBodyBodyGyroMagMeanMean=mean(fBodyBodyGyroMagMean),
	fBodyBodyGyroMagMeanFreqMean=mean(fBodyBodyGyroMagMeanFreq),
	fBodyBodyGyroJerkMagMeanMean=mean(fBodyBodyGyroJerkMagMean),
	fBodyBodyGyroJerkMagMeanFreqMean=mean(fBodyBodyGyroJerkMagMeanFreq),
	tAngleBodyAccMeanGravityMean=mean(tAngleBodyAccMeanGravity),
	tAngleBodyAccJerkMeanGravityMeanMean=mean(tAngleBodyAccJerkMeanGravityMean),
	tAngleBodyGyroMeanGravityMeanMean=mean(tAngleBodyGyroMeanGravityMean),
	tAngleBodyGyroJerkMeanGravityMeanMean=mean(tAngleBodyGyroJerkMeanGravityMean),
	angleXGravityMeanMean=mean(angleXGravityMean),
	angleYGravityMeanMean=mean(angleYGravityMean),
	angleZGravityMeanMean=mean(angleZGravityMean))

# Write the data to a file
write.table(AccelerometerData, file = "AccelerometerData.txt", row.name=FALSE)


# AccelerometerDataCodebook.md

This codebook documents the variables in AccelerometerData.txt, which is a summary of
certain characteristics of the UCI HAR Dataset (Davide Anguita, Alessandro Ghio, 
Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on 
Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International 
Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012).

The UCI HAR Dataset contains the results of experiments recording 30 subjects performing 
6 different activities while wearing a smartphone (Samsung Galaxy S II) on the waist.
Full documentation for the original UCI HAR Dataset is available at the following URL:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
and in text files within the dataset itself, which is available for download here:
http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

This summary dataset, which contains the mean of each variable corresponding to a mean
or standard deviation in the original dataset for each of 180 combinations of 
activities and subjects was created using data downloaded on Sun Jan 25 11:27:30 2015 
from the URL above.  

# Abbreviations
The concordance below describes the AccelerometerData.txt dataset in terms of each 
variable's original name.  To shorten the resulting variable names, the following 
abbreviations and standardizations (brought from variable names in the source data)
were employed:

* Acc: Acceleration
* Std: Standard Deviation
* Gyro: Gyroscope
* t: time
* f: Fast Fourier Transform of Frequency
* Freq: Frequency
* Mag: Magnitude

N.B.: In several cases, the original variable names introduced some unpleasant but inexplicable
repetition in the names of variables in AccelerometerData.txt.  Although nine 
fields contain the word Body twice (e.g. fBodyBodyAccJerkMagStdMean), which does not seem 
to add any meaning to the labels, that repetition has been retained in labelling
the summary dataset, just in case it does, somehow, matter.

# Concordance of Summary and Source Variable Names

AccelerometerData                               Name of Field from
Variable Name                                   UCI HAR Dataset source
----------------------------------------------------------------------------------------
activity                             | = the activity performed by a subject:
                                     |   WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,
                                     |   SITTING, STANDING, or LAYING, 
                                     |   from y_train.txt and y_test.txt files
sid                                  | = the subject identification number, from
                                     |   subject_train.txt and subject_test.txt files
tBodyAccStdXMean                     | = mean of "tBodyAcc-std()-X"
tBodyAccStdYMean                     | = mean of "tBodyAcc-std()-Y"
tBodyAccStdZMean                     | = mean of "tBodyAcc-std()-Z"
tGravityAccStdXMean                  | = mean of "tGravityAcc-std()-X"
tGravityAccStdYMean                  | = mean of "tGravityAcc-std()-Y"
tGravityAccStdZMean                  | = mean of "tGravityAcc-std()-Z"
tBodyAccJerkStdXMean                 | = mean of "tBodyAccJerk-std()-X"
tBodyAccJerkStdYMean                 | = mean of "tBodyAccJerk-std()-Y"
tBodyAccJerkStdZMean                 | = mean of "tBodyAccJerk-std()-Z"
tBodyGyroStdXMean                    | = mean of "tBodyGyro-std()-X"
tBodyGyroStdYMean                    | = mean of "tBodyGyro-std()-Y"
tBodyGyroStdZMean                    | = mean of "tBodyGyro-std()-Z"
tBodyGyroJerkStdXMean                | = mean of "tBodyGyroJerk-std()-X"
tBodyGyroJerkStdYMean                 = mean of "tBodyGyroJerk-std()-Y"
tBodyGyroJerkStdZMean                 = mean of "tBodyGyroJerk-std()-Z"
tBodyAccMagStdMean                    = mean of "tBodyAccMag-std()"
tGravityAccMagStdMean                 = mean of "tGravityAccMag-std()"
tBodyAccJerkMagStdMean                = mean of "tBodyAccJerkMag-std()"
tBodyGyroMagStdMean                   = mean of "tBodyGyroMag-std()"
tBodyGyroJerkMagStdMean               = mean of "tBodyGyroJerkMag-std()"
fBodyAccStdXMean                      = mean of "fBodyAcc-std()-X"
fBodyAccStdYMean                      = mean of "fBodyAcc-std()-Y"
fBodyAccStdZMean                      = mean of "fBodyAcc-std()-Z"
fBodyAccJerkStdXMean                  = mean of "fBodyAccJerk-std()-X"
fBodyAccJerkStdYMean                  = mean of "fBodyAccJerk-std()-Y"
fBodyAccJerkStdZMean                  = mean of "fBodyAccJerk-std()-Z"
fBodyGyroStdXMean                     = mean of "fBodyGyro-std()-X"
fBodyGyroStdYMean                     = mean of "fBodyGyro-std()-Y"
fBodyGyroStdZMean                     = mean of "fBodyGyro-std()-Z"
fBodyAccMagStdMean                    = mean of "fBodyAccMag-std()"
fBodyBodyAccJerkMagStdMean            = mean of "fBodyBodyAccJerkMag-std()"
fBodyBodyGyroMagStdMean               = mean of "fBodyBodyGyroMag-std()"
fBodyBodyGyroJerkMagStdMean           = mean of "fBodyBodyGyroJerkMag-std()"
tBodyAccMeanXMean                     = mean of "tBodyAcc-mean()-X"
tBodyAccMeanYMean                     = mean of "tBodyAcc-mean()-Y"
tBodyAccMeanZMean                     = mean of "tBodyAcc-mean()-Z"
tGravityAccMeanXMean                  = mean of "tGravityAcc-mean()-X"
tGravityAccMeanYMean                  = mean of "tGravityAcc-mean()-Y"
tGravityAccMeanZMean                  = mean of "tGravityAcc-mean()-Z"
tBodyAccJerkMeanXMean                 = mean of "tBodyAccJerk-mean()-X"
tBodyAccJerkMeanYMean                 = mean of "tBodyAccJerk-mean()-Y"
tBodyAccJerkMeanZMean                 = mean of "tBodyAccJerk-mean()-Z"
tBodyGyroMeanXMean                    = mean of "tBodyGyro-mean()-X"
tBodyGyroMeanYMean                    = mean of "tBodyGyro-mean()-Y"
tBodyGyroMeanZMean                    = mean of "tBodyGyro-mean()-Z"
tBodyGyroJerkMeanXMean                = mean of "tBodyGyroJerk-mean()-X"
tBodyGyroJerkMeanYMean                = mean of "tBodyGyroJerk-mean()-Y"
tBodyGyroJerkMeanZMean                = mean of "tBodyGyroJerk-mean()-Z"
tBodyAccMagMeanMean                   = mean of "tBodyAccMag-mean()"
tGravityAccMagMeanMean                = mean of "tGravityAccMag-mean()"
tBodyAccJerkMagMeanMean               = mean of "tBodyAccJerkMag-mean()"
tBodyGyroMagMeanMean                  = mean of "tBodyGyroMag-mean()"
tBodyGyroJerkMagMeanMean              = mean of "tBodyGyroJerkMag-mean()"
fBodyAccMeanXMean                     = mean of "fBodyAcc-mean()-X"
fBodyAccMeanYMean                     = mean of "fBodyAcc-mean()-Y"
fBodyAccMeanZMean                     = mean of "fBodyAcc-mean()-Z"
fBodyAccMeanFreqXMean                 = mean of "fBodyAcc-meanFreq()-X"
fBodyAccMeanFreqYMean                 = mean of "fBodyAcc-meanFreq()-Y"
fBodyAccMeanFreqZMean                 = mean of "fBodyAcc-meanFreq()-Z"
fBodyAccJerkMeanXMean                 = mean of "fBodyAccJerk-mean()-X"
fBodyAccJerkMeanYMean                 = mean of "fBodyAccJerk-mean()-Y"
fBodyAccJerkMeanZMean                 = mean of "fBodyAccJerk-mean()-Z"
fBodyAccJerkMeanFreqXMean             = mean of "fBodyAccJerk-meanFreq()-X"
fBodyAccJerkMeanFreqYMean             = mean of "fBodyAccJerk-meanFreq()-Y"
fBodyAccJerkMeanFreqZMean             = mean of "fBodyAccJerk-meanFreq()-Z"
fBodyGyroMeanXMean                    = mean of "fBodyGyro-mean()-X"
fBodyGyroMeanYMean                    = mean of "fBodyGyro-mean()-Y"
fBodyGyroMeanZMean                    = mean of "fBodyGyro-mean()-Z"
fBodyGyroMeanFreqXMean                = mean of "fBodyGyro-meanFreq()-X"
fBodyGyroMeanFreqYMean                = mean of "fBodyGyro-meanFreq()-Y"
fBodyGyroMeanFreqZMean                = mean of "fBodyGyro-meanFreq()-Z"
fBodyAccMagMeanMean                   = mean of "fBodyAccMag-mean()"
fBodyAccMagMeanFreqMean               = mean of "fBodyAccMag-meanFreq()"
fBodyBodyAccJerkMagMeanMean           = mean of "fBodyBodyAccJerkMag-mean()"
fBodyBodyAccJerkMagMeanFreqMean       = mean of "fBodyBodyAccJerkMag-meanFreq()"
fBodyBodyGyroMagMeanMean              = mean of "fBodyBodyGyroMag-mean()"
fBodyBodyGyroMagMeanFreqMean          = mean of "fBodyBodyGyroMag-meanFreq()"
fBodyBodyGyroJerkMagMeanMean          = mean of "fBodyBodyGyroJerkMag-mean()"
fBodyBodyGyroJerkMagMeanFreqMean      = mean of "fBodyBodyGyroJerkMag-meanFreq()"
tAngleBodyAccMeanGravityMean          = mean of "angle(tBodyAccMean,gravity)"
tAngleBodyAccJerkMeanGravityMeanMean  = mean of "angle(tBodyAccJerkMean),gravityMean)"
tAngleBodyGyroMeanGravityMeanMean     = mean of "angle(tBodyGyroMean,gravityMean)"
tAngleBodyGyroJerkMeanGravityMeanMean = mean of "angle(tBodyGyroJerkMean,gravityMean)"
angleXGravityMeanMean                 = mean of "angle(X,gravityMean)"
angleYGravityMeanMean                 = mean of "angle(Y,gravityMean)"
angleZGravityMeanMean                 = mean of "angle(Z,gravityMean)"

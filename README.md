#  #UCI HAR Dataset
* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
## /train
*  'X_train.txt': Training set.
*  'y_train.txt': Training labels.
*  'subject_train.txt' --Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
###  /Inertial Signals
*   body_acc_x_train.txt --The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
*   body_acc_y_train.txt
*   body_acc_z_train.txt
*   body_gyro_x_train.txt  --The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
*   body_gyro_y_train.txt
*   body_gyro_z_train.txt
*   total_acc_x_train.txt  --The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector.
*   total_acc_y_train.txt
*   total_acc_z_train.txt
## /test
##  'X_test.txt': Test set.
##  'y_test.txt': Test labels.
##  'subject_test.txt'
##  /Inertial Signals
*   body_acc_x_test.txt
*   body_acc_y_test.txt
*   body_acc_z_test.txt
*   body_gyro_x_test.txt
*   body_gyro_y_test.txt
*   body_gyro_z_test.txt
*   total_acc_x_test.txt
*   total_acc_y_test.txt
*   total_acc_z_test.txt

#'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
#'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
#'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
#'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
|:	tBodyAcc-XYZ		||:		:||	mean(): Mean value	|
|:	tGravityAcc-XYZ		||:		:||	std(): Standard deviation	|
|:	tBodyAccJerk-XYZ		||:		:||	mad(): Median absolute deviation 	|
|:	tBodyGyro-XYZ		||:		:||	max(): Largest value in array	|
|:	tBodyGyroJerk-XYZ		||:		:||	min(): Smallest value in array	|
|:	tBodyAccMag		||:		:||	sma(): Signal magnitude area	|
|:	tGravityAccMag		||:	x, y, z	:||	energy(): Energy measure. Sum of the squares divided by the number of values. 	|
|:	tBodyAccJerkMag		||:		:||	iqr(): Interquartile range 	|
|:	tBodyGyroMag		||:		:||	entropy(): Signal entropy	|
|:	tBodyGyroJerkMag		||:		:||	arCoeff(): Autorregresion coefficients with Burg order equal to 4	|
|:	fBodyAcc-XYZ		||:		:||	correlation(): correlation coefficient between two signals	|
|:	fBodyAccJerk-XYZ		||:		:||	maxInds(): index of the frequency component with largest magnitude	|
|:	fBodyGyro-XYZ		||:		:||	meanFreq(): Weighted average of the frequency components to obtain a mean frequency	|
|:	fBodyAccMag		||:		:||	skewness(): skewness of the frequency domain signal 	|
|:	fBodyAccJerkMag		||:		:||	kurtosis(): kurtosis of the frequency domain signal 	|
|:	fBodyGyroMag		||:		:||	bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.	|
|:	fBodyGyroJerkMag		||:		:||	angle(): Angle between to vectors.	|

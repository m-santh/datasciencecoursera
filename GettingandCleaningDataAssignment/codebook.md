# Code Book for Tidy Data

## Dataset Background 
The tidy data set is created based on the raw data set from "Human Activity Recognition Using Smartphones Dataset Version 1.0".


The data set is based on the experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz was captured.

Original data set contained two sets (training data and test data). It was based on obtained dataset that have been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

### Explaination of files used from original data sets

The downloaded dataset contained the following files that was used to create the tidy data:

- 'features.txt': Contained the description of all the variables/measurements recorded in training and test data set.

- 'activity_labels.txt': Contained the description and level mapping of the experimental activities performed by the persons.

- 'train/X_train.txt': Contained the Training data set for the measurements described in features.txt file.

- 'train/y_train.txt': Contained the experiment activity type for each record in the training data set.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'test/X_test.txt': Contained the Test data set for the measurements described in features.txt file.

- 'test/y_test.txt': Contained the experiment activity type for each record in the training data set.

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


### Transformation of data performed

1. Horizontally merged the activity type and the associated data set
2. Horizontally merged the subjects identifier with the associated data set
3. Vertically merged the resulting training data set and test data set to create a single data set
4. Selected only those coloums that measures the mean and standard deviation for each measurement.
5. Melted the data set based on subjects identifier and activity type for all of the selected measurements.
6. Dcasted the melted data set to compute the mean for each of the variables based on subjects identified and activity type.


##Each record in the tidy data set provides:

subjects_id: 

    Unique identified of the subject
    
    1-30. An identifier of the subject who carried out the experiment.


activity:

    Activities performed by each person
    
    1 WALKING
    
    2 WALKING_UPSTAIRS
    
    3 WALKING_DOWNSTAIRS
    
    4 SITTING

    5 STANDING

    6 LAYING

For each of the subjects and activities types, the average of the below measurements are provided in the data sets.

Measurements:

    tBodyAcc-mean()-X
    tBodyAcc-mean()-Y
    tBodyAcc-mean()-Z
    tBodyAcc-std()-X
    tBodyAcc-std()-Y
    tBodyAcc-std()-Z
    tGravityAcc-mean()-X
    tGravityAcc-mean()-Y
    tGravityAcc-mean()-Z
    tGravityAcc-std()-X
    tGravityAcc-std()-Y
    tGravityAcc-std()-Z
    tBodyAccJerk-mean()-X
    tBodyAccJerk-mean()-Y
    tBodyAccJerk-mean()-Z
    tBodyAccJerk-std()-X
    tBodyAccJerk-std()-Y
    tBodyAccJerk-std()-Z
    tBodyGyro-mean()-X
    tBodyGyro-mean()-Y
    tBodyGyro-mean()-Z
    tBodyGyro-std()-X
    tBodyGyro-std()-Y
    tBodyGyro-std()-Z
    tBodyGyroJerk-mean()-X
    tBodyGyroJerk-mean()-Y
    tBodyGyroJerk-mean()-Z
    tBodyGyroJerk-std()-X
    tBodyGyroJerk-std()-Y
    tBodyGyroJerk-std()-Z
    tBodyAccMag-mean()
    tBodyAccMag-std()
    tGravityAccMag-mean()
    tGravityAccMag-std()
    tBodyAccJerkMag-mean()
    tBodyAccJerkMag-std()
    tBodyGyroMag-mean()
    tBodyGyroMag-std()
    tBodyGyroJerkMag-mean()
    tBodyGyroJerkMag-std()
    fBodyAcc-mean()-X
    fBodyAcc-mean()-Y
    fBodyAcc-mean()-Z
    fBodyAcc-std()-X
    fBodyAcc-std()-Y
    fBodyAcc-std()-Z
    fBodyAcc-meanFreq()-X
    fBodyAcc-meanFreq()-Y
    fBodyAcc-meanFreq()-Z
    fBodyAccJerk-mean()-X
    fBodyAccJerk-mean()-Y
    fBodyAccJerk-mean()-Z
    fBodyAccJerk-std()-X
    fBodyAccJerk-std()-Y
    fBodyAccJerk-std()-Z
    fBodyAccJerk-meanFreq()-X
    fBodyAccJerk-meanFreq()-Y
    fBodyAccJerk-meanFreq()-Z
    fBodyGyro-mean()-X
    fBodyGyro-mean()-Y
    fBodyGyro-mean()-Z
    fBodyGyro-std()-X
    fBodyGyro-std()-Y
    fBodyGyro-std()-Z
    fBodyGyro-meanFreq()-X
    fBodyGyro-meanFreq()-Y
    fBodyGyro-meanFreq()-Z
    fBodyAccMag-mean()
    fBodyAccMag-std()
    fBodyAccMag-meanFreq()
    fBodyBodyAccJerkMag-mean()
    fBodyBodyAccJerkMag-std()
    fBodyBodyAccJerkMag-meanFreq()
    fBodyBodyGyroMag-mean()
    fBodyBodyGyroMag-std()
    fBodyBodyGyroMag-meanFreq()
    fBodyBodyGyroJerkMag-mean()
    fBodyBodyGyroJerkMag-std()
    fBodyBodyGyroJerkMag-meanFreq()
    angle(tBodyAccMean,gravity)
    angle(tBodyAccJerkMean),gravityMean)
    angle(tBodyGyroMean,gravityMean)
    angle(tBodyGyroJerkMean,gravityMean)
    angle(X,gravityMean)
    angle(Y,gravityMean)
    angle(Z,gravityMean)


#####This data set is based on the original data set from 

    Human Activity Recognition Using Smartphones Dataset
    Version 1.0

    Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
    Smartlab - Non Linear Complex Systems Laboratory
    DITEN - Università degli Studi di Genova.
    Via Opera Pia 11A, I-16145, Genoa, Italy.
    activityrecognition@smartlab.ws
    www.smartlab.ws

For more information about this dataset contact: activityrecognition@smartlab.ws

###License:

    Use of this dataset in publications must be acknowledged by referencing the following publication [1] 
    
    [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
    
    This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
    
    Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

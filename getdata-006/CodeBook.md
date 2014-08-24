# Getting and Cleaning Data course project code book

Subject

> Number identifying a subject participated in experiment

Activity

> Name of activity performed during the experiment

The rest of columns indicate measured data. As per project specifications,
only mean() (mean value) and std() (standard deviation) values are included
in the output data set.

Output data are aggregated by averaging all values for every Subject and Activity.

The following measurements are available:

    tBodyAcc-XYZ (3 variables, measured along each axis)
    tGravityAcc-XYZ (3 variables, measured along each axis)
    tBodyAccJerk-XYZ (3 variables, measured along each axis)
    tBodyGyro-XYZ (3 variables, measured along each axis)
    tBodyGyroJerk-XYZ (3 variables, measured along each axis)
    tBodyAccMag
    tGravityAccMag
    tBodyAccJerkMag
    tBodyGyroMag
    tBodyGyroJerkMag
    fBodyAcc-XYZ (3 variables, measured along each axis)
    fBodyAccJerk-XYZ (3 variables, measured along each axis)
    fBodyGyro-XYZ (3 variables, measured along each axis)
    fBodyAccMag
    fBodyAccJerkMag
    fBodyGyroMag
    fBodyGyroJerkMag

Column names are composed from variable name and value specification, for example 
tBodyAcc-mean()-X or fBodyAccMag-std(). Column names should be self-explanatory.

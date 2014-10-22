#
# readDataFiles would take three arguments, X file name, Y file name,
# subject file name.
#   X file name - file name of the data sets
#   Y file name - file containing the activity lables
#   subject file name - file containing the subject ids
# This function would return the dataframe that is created from these files.
# The data frame is created by the following steps.
# 1. Reads the data from X file.
# 2. Appends the subjects id by reading from subject file as a new coloum
# 3. Appends the activity labels by reading from activity file.
# The activity lables are factored using "activity_labels.txt" levels
# The variables are names based on names in "features.txt" file
readDataFiles <- function( XFile, YFile, subjectFile, dataset) {

  # Read the three files (X, subject and y) test data.
  testData <- read.table(XFile, header=FALSE, colClasses="double")
  
  # Read the subject identifier
  subjectData <- read.table(subjectFile, header=FALSE, 
                                     colClasses="integer")
  testData$subjects_id <- subjectData$V1
  rm(subjectData)
  
  # Read the activity Labels
  testAct <- read.table(YFile, header=FALSE, colClasses="integer")
  
  labelFile <- "activity_labels.txt"
  labelFact <- read.table(labelFile, header=FALSE, colClasses="character")
  
  # Add the activity to the data set..
  # This handles question 3 of assignment i.e,
  # 3. Uses descriptive activity names to name the activities in the data
  #    set
  
  testData$activity <- factor(testAct$V1, levels=labelFact$V1,
                              labels=labelFact$V2)
  rm(testAct)
  
  
  # Name the variable names based on features..
  # This address the question 4 of the assignment
  # 4. Appropriately labels the data set with descriptive variable names

  variableFile <- "features.txt"
  variableNames <- read.table(variableFile, header=FALSE, colClasses="character")
  
  # Since we added two new colums (subjects and activity) in the end, need to
  # handle the same...
  numVarNames <- dim(variableNames)[1]
  
  names(testData)[1:numVarNames] <- variableNames$V2
  
  testData
  
}

#
# Download the file and unzip the data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dstfile <- "dataSet.zip"

if(!file.exists(dstfile)) {
  download.file(url, dstfile)  
}

unzip(dstfile)

# The data is unzipped in UCI HAR Dataset. So make it the working directory

setwd("./UCI HAR Dataset")

# Load the test Data
testData <- readDataFiles("test/X_test.txt",
                          "test/y_test.txt",
                          "test/subject_test.txt")

# Load the train data
trainData <- readDataFiles("train/X_train.txt",
                          "train/y_train.txt",
                          "train/subject_train.txt")



# Assignment questions

# 1. Merges the training and the test sets to create one data set.
# Addressing question 1.

# merge data vertically
dataSet <- rbind(testData, trainData)


# Question 2
# 2. Extracts only the measurements on the mean and standard deviation 
#    for each measurement.
# Here assuming that any variable name which has mean. So below is the steps

# lowercase of the names in a variable
# grep for either "mean" or "std" in the names
# create a subset data with only those coloums
variableNames <- tolower(names(dataSet))

selectedVariables <- grepl("mean", variableNames) | 
  grepl("std", variableNames)

# Include subjects_id and activity.
selectedVariables[ncol(dataSet)-1] <- TRUE
selectedVariables[ncol(dataSet)] <- TRUE
# include subjects_id and activities
dataSubset <- dataSet[, selectedVariables]

# Question 3
# 3. Uses descriptive activity names to name the activities in the data set

# Handled as part of reading data files. 

# 4. Appropriately labels the data set with descriptive variable names
# Handled as part of reading data files.

# 5. From the data set in step 4, creates a second, independent tidy data 
#    set with the average of each variable for each activity and each 
#    subject.

# To tidy the data, below is the steps
# 1. melt the data set based on subjects_id and activity and retain all other
#    variables
# 2. Now dcast and compute the mean of the variables.
#
library(plyr)
mtData <- melt(dataSubset, id.vars = .(subjects_id, activity))

tidyData <- dcast(mtData, subjects_id+activity~variable, mean )

# Write the tidy data to a file.

fileName <- "../tidy_data.txt"
write.table(tidyData, fileName, row.names=FALSE)


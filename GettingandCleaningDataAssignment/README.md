## Introduction

This assignement/script uses data from: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

unzips the file in current working directory retaining the directory structure.

The details of the original data sets used and the transformation steps performed by the script is explained in CodeBook.md

The script reads the respective training data sets and test data sets and horizontaly merges these two data sets. 

The script then performs the required data transformation to clean and process the data.

The tidy data is then stored in the current working directory "tidy_data.txt"

To load the data in R you can use the below command ()


    file_path <- "tidy_data.txt"
    data <- read.table(file_path, header = TRUE)
    View(data)
    
This code is based on the inputs from discussion thread - https://class.coursera.org/getdata-008/forum/thread?thread_id=24

In order to get the variables names for the CodeBook.md, used the below command in R

    writeLines(names(tidyData), "var_names.txt")
    
and copied the data from var_names.txt into the CodeBook.md file.

Thank you.
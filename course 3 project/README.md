# Getting and Cleaning Data course project

This is a submission containing [the script](https://github.com/josemanuelnavarro/datasciencecoursera/tree/master/course%203%20project/run.analysis.R) that performs the tasks needed for the completion of the course project of the third course of the Data Science specialization, Getting and Cleaning Data, from Coursera.

The data it works can be found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The steps it takes are as follows (each number here corresponds to the numbered sections on the script):
1. It loads both training and test datasets.
2. Then it aggregates them as they are.
3. It then filters the measurements variables to leave only the ones which contain means or standard deviations.
4. After that it just gives correct labels to the activity column and summarizes the dataset into one row per subject and activity.

The resulting dataset contains the average of each variable for each subject and activity. The script should work as long as a folder named "dat" containing the original data folder structure is present in the working directory.

Regarding the variable naming, I found the original naming quite explanatory, so I did not change it. Every variable is described in the code book, which can be found [here](https://github.com/josemanuelnavarro/datasciencecoursera/tree/master/course%203%20project/CodeBook.md).
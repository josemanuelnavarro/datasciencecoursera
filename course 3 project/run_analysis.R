### Section 1

##Training data loading
subject_train <- read.table(file = "dat/UCI HAR Dataset/train/subject_train.txt")
x_train       <- read.table(file = "dat/UCI HAR Dataset/train/X_train.txt")
y_train       <- read.table(file = "dat/UCI HAR Dataset/train/y_train.txt")

##Test data loading
subject_test  <- read.table(file = "dat/UCI HAR Dataset/test/subject_test.txt")
x_test        <- read.table(file = "dat/UCI HAR Dataset/test/X_test.txt")
y_test        <- read.table(file = "dat/UCI HAR Dataset/test/y_test.txt")

### Section 2

##Raw data aggregation
subject <- rbind(subject_train, subject_test)
x       <- rbind(x_train, x_test)
y       <- rbind(y_train, y_test)
rm(subject_train, x_train, y_train, subject_test, x_test, y_test)

##Get the names for the X part
features <- read.table(file = "dat/UCI HAR Dataset/features.txt")
names(x) <- as.character(features$V2)


### Section 3

##Extract only the measurements on the mean and standard deviation for each measurement
##They follow the following pattern: 1:6, 41:46, 81:86...Let's generate a vector of
##logical values to extract them
valuesWeWant <- logical()
AnalyzeColName <- function(name){
  return(grepl(pattern = "mean()", x = name, fixed = TRUE) | 
           grepl(pattern = "std()", x = name, fixed = TRUE))
}
for(i in 1:dim(x)[2]){
  valuesWeWant[i] <- AnalyzeColName(names(x)[i])
}
x <- x[,valuesWeWant]

### Section 4

##Use descriptive activity names to name the activities in the data set
y$V1 <- factor(y$V1)
levels(y$V1) <- c("walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying")

##Appropriately label the data set with descriptive variable names

  #For this part I find the names given along with the explanations in the text files explanatory 
  #enough.

## From the data in step 4, create a second independent tidy data set with the average of each variable
## for each activity and each subject.

x <- cbind(subject, x)
names(x)[1] <- "subject"
require(plyr)
require(dplyr)
complete <- cbind(x,y)
names(complete)[68] <- "activity"
result <- ddply(.data = complete,.variables = .(subject, activity),
                .fun = function(x){apply(X = x[2:67], MARGIN = 2, FUN = mean)})




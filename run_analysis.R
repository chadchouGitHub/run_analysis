##run_Analysis.R 
## Before run this script, set work direction to the data folder##
##load the library reshape2 and assumes that its already installed.
library(reshape2)
##Import Data form Data folder into R variables with Read.table 
        
        train.x <- read.table("train/X_train.txt") ## Train data set file
        test.x <- read.table("test/X_test.txt") ##Test data set file
        train.y <- read.table("train/y_train.txt") ## Train label file (labe of activities by number)
        test.y <- read.table("test/y_test.txt") ##Test label file (labe of activities by number)
        Subject_test <- read.table("test/subject_test.txt") ##subject ID file for test data set.
        Subject_train <- read.table("train/subject_train.txt") ##Subject ID file for train data set.        
        features <- read.table("features.txt") ## Data feature file              

##Label each imported data sets with col names.
## Replace all puntuation in features v2 col, and put into colNames. ignore case sensitive and no perl regexps.      
        colNames <- gsub("[[:punct:]]","", features$V2, ignore.case = FALSE, perl = FALSE)  

        colnames(train.x) <- colNames ##assign col names to train.x
        colnames(test.x) <- colNames ##assign col names to test.x
        colnames(train.y) <- "Activity" ## add col name Activity to train.y
        colnames(test.y) <- "Activity" ##add col name Activity to test.y
        colnames(Subject_test) <- "Subject" ##add Subject as col name to Subject_test
        colnames(Subject_train) <- "Subject" ## assign col name Subject to Subject_train
##Merge data by col  
testComplete <- cbind(Subject_test, test.y,test.x)
trainComplete <- cbind(Subject_train,train.y,train.x)
TotalData <- rbind(trainComplete,testComplete)
        
        
##subsetting the mean, standard deviation,Subject and Activity for each measurement in allData. 
##assign subsetting information into a new data set

NewData <- TotalData[, grep("mean|std|Subject|Activity", names(TotalData))]
        
        
## add descriptive activity names to name the activities in the New Data data set
## First, create labels with 6 elements and index number match to the activity in the activity_labels.txt
## use NewData Activity col as index number to subset labels and add into NewData-replace class number to activity name.         

labels <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
NewData$Activity <- labels[NewData$Activity]

##Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        
meltedData <- melt(NewData, id.var = c("Subject", "Activity"))
final_means <- dcast(meltedData , Subject + Activity ~ variable,mean)
        
        
## Write tidy data to space separated text file
        
write.table(final_means, file="run_analysis_result.txt", sep = " ")

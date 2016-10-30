# Set working Dir
setwd("D:/R/Data/GD_Wk4/")

# download data
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL, "DataFile.zip", mode ='wb')
unzip("/DataFile.zip")

#include library
library(data.table)

# import Data
train_Data <- fread("D:/R/Data/GD_Wk4/UCI HAR Dataset/train/X_train.txt")
test_Data <- fread("D:/R/Data/GD_Wk4/UCI HAR Dataset/test/X_test.txt")

# 1.  MERGE DATA

DataSet <- as.data.frame(rbind(train_Data, test_Data))

#2.  Descriptive Activities  names
 
activityLabels <- read.table("../GD_Wk4/UCI HAR Dataset/activity_labels.txt")

activityLabels <- as.character(activityLabels[,2])

# 3. Extract means and Standard deviations of each measurement
# Means : features means 
# SD : feature standard deviation


DataSet.Features  <- (fread("../GD_wk4/UCI HAR Dataset/features.txt"))$V2
SD_vect <- grep("[Ss]td|STD",DataSet.Features )
Means_vect <- grep("[Mm]ean|MEAN|[Mm]eans",DataSet.Features)
DataIndx = c(Means_Vect,SD_Vect)

DataSet.Features <- gsub('-mean', 'Mean', DataSet.Features)
DataSet.Features <- gsub('-std', 'Std',DataSet.Features)
DataSet.Features <- gsub('[-()]', '', DataSet.Features)


# 4 Labelling  data set  

trainActivities <- read.table("../GD_wk4/UCI HAR Dataset/Y_train.txt")

trainSubjects <- read.table("../GD_wk4/UCI HAR Dataset/subject_train.txt")

trainSA <- cbind(trainSubjects, trainActivities)



## Load the dataset for test with only mean and std dev columns, activity and subject


testActivities <- read.table("../GD_wk4/UCI HAR Dataset/Y_test.txt") 
    
testSubjects <- read.table("../GD_wk4/UCI HAR Dataset/subject_test.txt")
    
testSA <- cbind(testSubjects, testActivities)
    
    

adVar = rbind(trainSA,testSA)
DataSet1 = cbind(adVar,DataSet[,DataIndx])
names(DataSet1) <- c("Subject","Activities",DataSet.Features[DataIndx])
DataSet1 <- as.data.frame(DataSet1)
DataSet1$Activities <- as.factor(DataSet1$Activities)
DataSet1 = aggregate(.~ Subject + Activities, DataSet1, FUN = mean)

# write table
# Means_SD_Data  : DataSet1 text file.

write.table(DataSet1,
                         file = "DataSet1.txt",
                         row.names = FALSE,
                         
                         sep = "\t"
)



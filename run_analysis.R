#include library
library(data.table)
library(dplyr)
setwd("D:/R/Data/GD_Wk4")

# import Data
train_Data <- fread("../GD_Wk4/UCI HAR Dataset/train/X_train.txt")
test_Data <- fread("../GD_Wk4/UCI HAR Dataset/test/X_test.txt")

# MERGE DATA
Data_Set <- as.data.frame(rbind(train_Data, test_Data))
names(Data_Set) <- (fread("D:/R/Data/GD_Wk4/UCI HAR Dataset/features.txt"))$V2

setwd("D:/R/Data/GD_Wk4/UCI HAR Dataset/Assigment")
#2.  Descriptive Activities  names
# static 
# dynamic 

# 3. Extract means and Standard deviations of each measurement
# Means : features means 
# SD : feature standard deviation


Labels_Data_Set  <- (fread("D:/R/Data/GD_Wk4/UCI HAR Dataset/features.txt"))$V2
SD_vect <- grep("[Ss]td|STD",Labels_Data_Set)
Means_vect <- grep("[Mm]ean|MEAN|[Mm]eans",Labels_Data_Set)
Means_Data <- Data_Set[,Means_vect]
SD_Data <- Data_Set[,SD_vect] 
# 4 Labelling  data set 
for (i in 1:length(Labels_Data_Set)) {
    Label0 <- Labels_Data_Set[i]
    # l0 = nchar(Label0)
    Label1 <- gsub("[-(),_]","",Label0)
    # Label1 <- gsub(i,"",Label1)
    Labels_Data_Set[i] <- Label1
}


# Means_vect : logical vector of variables means
# Means_Data : set of means


# write tables 
# Means_Data  : Mean_Data text file.
# Means_Data.txt : Means_Data Labels text file.

write.table(Means_Data,
                         file = "DataSet1.txt",
                         row.names = FALSE,
                         col.names = FALSE
)
Labels_Data_set1 <- Labels_Data_Set[Means_vect]
write.table(Labels_Data_set1,
            file = "Labels.MeansData.txt",
                         row.names = FALSE,
                         col.names = FALSE
)


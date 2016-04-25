#include library
library(data.table)
setwd("D:/R/Data/GD_Wk4")
# import Data
train_Data <- fread("../GD_Wk4/UCI HAR Dataset/train/X_train.txt")
                    
test_Data <- fread("../GD_Wk4/UCI HAR Dataset/test/X_test.txt")
# MERGE DATA
Data_set <- as.data.frame(rbind(train_Data, test_Data))

setwd("D:/R/Data/GD_Wk4/UCI HAR Dataset/Assigment")
#2.  Descriptive Activities  names
# static 
# dynamic 

# 3. Extract means and Standard deviations of each measurement
# Means : features means 
# SD : feature standard deviation
A <- fread("D:/R/Data/GD_Wk4/UCI HAR Dataset/features.txt")
Labels_DataSet0 <- A$V2
SD_vect <- grep("[Ss]td|STD",Labels_DataSet0)
Means_vect0 <- grep("[Mm]ean|MEAN|[Mm]eans",Labels_DataSet0)
Means0 <- Data_set[,Means_vect0 ] 
SD0 <- Data_set[,SD_vect ] 
 
# 4 Labelling  data set 
for (i in 1:length(Labels_DataSet0)) {
    Label0 <- Labels_DataSet0[i]
    l0 = nchar(Label0)
    Label1 <- gsub("[-(),_]","",Label0)
    # Label1 <- gsub(i,"",Label1)
    Labels_DataSet0[i] <- Label1
}

# 5.DATA SET WITH AVERAGE OF EACH VARIABLE OF EACH ACTIVITY AND EACH SUBJECT
# Means_vect : logical vector of variables means
# Means_Data : set of means
Means_vect <- grep("[Mm]ean|MEANS|[Mm]eans",Labels_DataSet0)
Means_Data <- Data_set[,Means_vect]
# write tables 
# Means_Data  : Mean_Data text file.
# Means_Data.txt : Means_Data Labels text file.
write.table(Means_Data,
                         file = "DataSet1.txt",
                         row.names = FALSE,
                         col.names = FALSE
)
Labels_Data_set1 <- Labels_DataSet0[Means_vect]
write.table(Labels_Data_set1,
            file = "Labels.MeansData.txt",
                         row.names = FALSE,
                         col.names = FALSE
)


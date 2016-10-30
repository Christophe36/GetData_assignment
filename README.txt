is Run_analysis README 
================================================================================
include library : 
    data.table  : very fast package to read table.
Assuming that data are already on your working directory.

1. Import train and test data 
    function : fread() : reads a data table 
               as.data.frame() : coerce data set type from "data.table" "data.frame" 
               to data frame.
 1.a. merging train and test data sets  
    function rbind() : binds train and test data sets with respect to rows 
    and leads to Dataset data frame.
2.  Descriptive Activities  names : comments lines to give descriptives names to 
activities perform by subject

read activity label in file  "activity_labels.txt"

3. Extract means and Standard deviations of each measurement
    "features.txt" : a text file data of features labels.
    Means : features means 
   SD : features standard deviation
   -function : 
               fread (): reads features.txt data file
               grep () : gets regular expression index from features vector extracted from features.txt
               gsub () : removes special characters from above selected features names 
               cbind () : creates a new dataset comprise of Means and SD 
4. Labelling  data set 
 - get subject and activity vectors from given files (subject_train.tx, Y_train.txt,subject_test.txt, Y_train,Y_test)
 - bind columnwise subject and activity to the above dataset with cbind ()

5.DATA SET WITH AVERAGE OF EACH VARIABLE OF EACH ACTIVITY AND EACH SUBJECT
 
 DataSet1 is comprised of  : 6 activities times 30 subjects = 180 rows 
                       : 88 means and SD features


Run_analysis README 
================================================================================
include library : 
    data.table  : very fast package to read table.
Assuming that data are already on your working directory.

1. Import training and test data 
    function : fread() : reads a data table 
               as.data.frame() : coerce data set type from "data.table" "data.frame" 
               to data frame.
 1.a. merging train and test data sets  
    function rbind() : binds data sets with respect to rows 

2.  Descriptive Activities  names : comments lines to give descriptives names to 
activities perform by subject

     - static 

     - dynamic 

3. Extract means and Standard deviations of each measurement
    A : A text data table of data labels.
    Means : features means 
   SD : features standard deviations
   -function : 
               fread() reads features.txt data file
               grep()  gets regular expression in A and realise indexation in data
                by the vector of position returned by grep()
4. Labelling  data set 
   -for loop : labels the latter data set by iterations

5.DATA SET WITH AVERAGE OF EACH VARIABLE OF EACH ACTIVITY AND EACH SUBJECT
 the file delivering the subjects ID ( subject_train.txt and subject test.txt files) are unreadable.
 


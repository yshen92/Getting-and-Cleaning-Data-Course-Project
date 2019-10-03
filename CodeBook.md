## Script Name: run_analysis.R 
> Function: Performs data preparation by a set of steps as described in the course assignment.

### Steps
1. Read in features.txt to get the descriptive feature names
2. Read in the Training and Testing Dataset for further processing:
-- cbind is used to concatenate the X, y and subject data by columns into a dataframe
-- this is done for each dataset type
3. Concatenate the processed training and the testing datasets by row
4. Select the necessary variables using grepl, i.e. mean measurements, standard deviation measurements, activity and subject
5. Read descriptive activity names and map to the dataframe
6. Create the tidy dataset by taking the average of each variable for each activity and subject
7. Save the tidy dataset to TidyData.txt

### Result
TidyData.txt has 180 rows and 81 variables

# Getting and Cleaning Data Course Project
========================================================

Purpose 
-----------------

`run_analysis.R` performs the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

run_analysis.R
-----------------

1. It loads the **train** and **test** data sets by fread with data.table package. Then using `rbind`.
2 and 3. It extracts just the *mean* and *standard deviation* from the **features** data set in a varial named **mean_std_features**. This is done using `grep`.
4. **mean_std_features** are applied to the **Xms** data frame as its column names.  
5. After loading **act_lab**  *subject* column names are named for **y** and **subject** data sets, respectively.
6. The three data sets,**subj**, **x**, **y** and , are merged. Then, it is exported as a *txt* file into the Project folder in the same working directory, named **alldata.txt**.
7. The *mean* of activities and subjects are created into a separate tidy data set which is exported into the Project folder as *txt* file; this is named **tidy.txt**.

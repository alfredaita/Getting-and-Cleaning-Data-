  ## Codebook for run_analysis.R 
   A data cleaning project from a samsung experiment 
   
     Working Directory on local Machine UCI HAR Dataset
      
     * test/X_test.txt – test dataset
     * train/X_train.txt – training dataset
     * test/y_test.txt – labels for test dataset
     * train/y_train.txt – labels for training dataset
     * activity_labels.txt – descriptive names of activities
     * test/subject_test.txt – identifier for each subject who performed activity in test dataset
     * train/subject_train.txt – identifier for each subject who performed activity in train dataset
     *  features.txt – List of all features
   
     ## Variables used in script with their dimensions
     
     * features -  table of all the names features 561 in total
     * Testdat -  table of all X_test.txt data with column names inserted from features [2947 by 561]
     * traindat -  table of all X_train.txt data with column names inserted from features [7352 by 561]
     * test_label -  table of y_test.txt for the testing labels of activities by ID from 1 - 6 [2947 by 1]
     * train_label -  table of y_train.txt for the train labels of activities by ID from 1 - 6 [7352 by 1]
     * activities -  table of activity_labels.txt a character list of 6 activities [IE: WALKING, LAYING, etc.] 
     * Test_subjects -  table of subject_test.txt an id number for  tested random selection of 1-30 [2947 by 1] 
     * Train_subjects -  table of subject_train.txt an id number for trained random selection of 1-30 [7352 by 1] 
     * Subjects -  combined table of Test_subjects and Train_subjects  [10299 by 1]  
     * Dataset - combined table of Testdat and traindat [10299 by 561 ]
     * Activity_test_label - left join of test_label and activities
     * Activity_train_label - left join of train_label and activities
     * Activity_label - combination of Activity_test_label and Activity_train_label
     * Dataset1 - selection of all attributes containing a mean calculation [53 attributes were selected]
     * Dataset2 - selection of all attributes containing a std calculation [33 attributes were selected]
     * Dataset - combination of Dataset1 and Dataset2  [ 10299 by 86 ]
     * Data_Complete - combine Subjects, Activity_label ,Dataset [10299 by 89]
     * tidy_data - load and reshape Data_Complete and set first three columns as id 
     * tidydata - calculate the "average"  for columns 4 to 89 by activity and subjects [180 by 89 ] 86 new calculations
     * tidynames - list of existing name columns 4 thru 89 edited and made more descriptive for tidydata
     *  tidydata is written to disk as tidy_dataset.txt and uploaded 
     
     ## Variable names methodolgy and logic
      
      * Original features and names were loaded and then filtered for columns containing "mean" or "std" [standard deviation]
      * additionaly redundant wording such as BodyBody was replaced with just Body
      * "..." etc. was removed. And some capitalization was added mean to Mean etc.
      * columns for "Subject_id" , "Activity_ID" and "Activity" were added to tidydata 
      
      Note:
      The original files, comprissing Activity_ID, (y_test.txt and y_train.txt) were saved in a particular order, 
      the assumption was then made that all the original obseravtions were saved in that fashion. To preserve the order
      the master file was rebuilt in a test and then train sequence. Also an left inner join command was used to this.
      
      END OF CODEBOOK
      

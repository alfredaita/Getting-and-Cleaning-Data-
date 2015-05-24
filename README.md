## Getting-and-Cleaning-Data-
run_analysis R 
The script run_analysis.R reconstructs the data from the Samsung galaxy expiriment. The files were loaded to a local machine; unziped and extracted to a local directory. Since these files reside in several sub-files a link was created to the Main file " UCI HAR Dataset" . From this point the appropiate path, pointing to the particular needed file, is added.  

       ## create master data file
       * load and combine X_test and X_train into one table [ a total of 561 attributes and 10,299 attributes ]
       * load, combine and add to the table; names for the attributes previously loaded. ["features.txt"]   
       * load and combine activity and activity id. Maintain the original order of activities performed.
       * y_train.txt and y_test.txt contains activity_id and order of performance.
       * The activity labels were " left inner joined " in a separate  column.
       * name the two columns "activity_id" and "activity".
       * Subject_test and subject_train.txt loaded combined.These are the subjects who were tested and trained.
       * name the subject column "subject_id"
       * the above procedures have created a master table consisting of 561 Columns and 10,299 rows.[ see script:"Dataset"]
       * three columns are still to be set . [Subject_id, activity_id, activity] 
       
       ## prepare tidy data set.
        * Mean and Standard Devitation(std) are extrapolated from our "Dataset" and overriding existing ["Dataset].
        * These are the attributtes required by our project.  
        * Names for our subjects, activity_id and activity are created and set and the three rows are now added to our table.
        * tidydata now contains 89 columns 86 of which are a std or mean of features.
        * tidy data is temporarily reshaped and the average for each mean or std is calculated by activity for
         each test and train participant. we now have a table consisting of 180 observations and 89 attributes( 86 of which            are calculated by the script).
        * descripitive data is made by editing the mean or standard devitation column names see code book .
        * tidy data is now saved to local disk and also uploaded as "tidy_dataset.txt"  

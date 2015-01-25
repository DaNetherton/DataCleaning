# DataCleaning
This repository contains three files:
1.  README.md (this file), explaining the contents of the other files in this
    repository, 
2.  run_analysis.R, a program that creates a summary analysis of the UCI HAR
    Dataset, and 
3.  AccelerometerDataCodebook.md, a description of certain relevant aspects of the
    UCI HAR Dataset and the output file obtained by running run_analysis.R.

# Summary of run_analysis.R
The program run_analysis.R creates a summary dataset, AccelerometerData.txt, from
various files in the UCI HAR Dataset.  For references to the source dataset or the
resultant summary dataset, please see the file AccelerometerDataCodebook.md in this 
repository.

1.  Loads the dplyr package for processing
2.  Loads the two main data files X_test.txt and X_train.txt.  The instructions for this
    assignment stated that run_analysis should be able to run if the data files were in
    the same directory as the program. However, since many files were, in the source
    zipfile, contained in subdirectories, the program was written to check the working
    directory and also the subdirectories, just in case there was some mistake in the
    phrasing of the assignment.  
3.  The program then appends the two files together in this order: test, train, so that 
    train is at the bottom of the file and test is at the top.
4.  The separate files are then removed from working memory.
5.  The program then loads the subject id files, which were also separated in test and 
    train files in separate directories, wherever they are.
6.  The program then appends the two subject ID files together in the same order as 
    the data file is in: test, train
7.  Then the separate files are deleted from working memory.
8.  Finally, the separate test and train activity files are loaded, wherever they can 
    be found.
9.  The activity files are then appended together in the same order as the main data 
    file: test, train
10. And the separate activity files are then deleted from working memory
11. Column labels, from features.txt, are loaded into a vector and attached to it.
12. Activity numbers in the activities file are then replaced with descriptive labels.
13. All three data frames are then combined into one.
14. The activities and subject ID columns are labelled
15. Activities are made a factor.
16. The dataframe is then pared down into a subset containing only the variables that 
    are standard deviations and means, which this researcher understood as any variable
	  name containing "std", "Mean", or "mean", even when the mean applied to a frequency.
17. Variable names were shortened and standardized so that they would not throw errors
    in most data analysis programs (which don't like variable names with parentheses,
	decimal points, hyphens, etc.) and were made into camelCase character strings.
18. The new variable names were applied to the dataframe.
19. Then the summary dataset AccelerometerData was created by summarizing each 
    combination of activity and subject and then taking the mean of that data.
20. The data was then output to AccelerometerData.txt using write.table.

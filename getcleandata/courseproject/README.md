# run_analysis.R

It is recommended to download and unzip the dataset:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

put the 'run_analysis.R' script in the same directory, so that UCI HAR Dataset directory is in the same directory.

The script will read in all the training and test datasets in the UCI HAR Dataset directory and combines them.

Feature names are cleaned up. Extraneous spaces, parentheses, and dashes are removed. all names are cast to lower-case.  'acc' is changed to 'acceleration'

Activity names are merged and mean and standard deviations are computed for 66 measurements.

That data is assembled and written out as a tidy dataset to tab-delimited tidy_dataset.txt

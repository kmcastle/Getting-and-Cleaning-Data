# Getting-and-Cleaning-Data

README.txt

Coursera Getting and Cleaning Data Assignment
kmcastle
==================================================================
Source Study:
Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

==================================================================

Source data can be accessed at:
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
A description of the source data can be found at:
 http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

==================================================================

Original Expirement Design

The original design of the expirement is described in the original README.txt as: 

"The experiments have been carried out with a group of 30 volunteers within an age
bracket of 19-48 years. Each person performed six activities
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a
smartphone (Samsung Galaxy S II) on the waist.
Using its embedded accelerometer and gyroscope, we captured 3-axial linear
acceleration and 3-axial angular velocity at a constant rate of 50Hz.
The experiments have been video-recorded to label the data manually. The obtained
dataset has been randomly partitioned into two sets,
where 70% of the volunteers was selected for generating the training data and 30%
the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying
noise filters and then sampled in fixed-width sliding windows of
2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal,
which has gravitational and body motion components, was separated
using a Butterworth low-pass filter into body acceleration and gravity. The
gravitational force is assumed to have only low frequency components,
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector
of features was obtained by calculating variables from the time and
frequency domain. See 'features_info.txt' for more details."

==================================================================
 
Transforming the Data

 The following steps were followed to transform the source data into a single dataframe with grouped means.

	1. The various data sets were merged to create a single dataframe with features.txt serving as column names.
	2. Measurements of mean and standard deviation were extracted.
	3. Values in the activity column were given labels.
	4. Variable names were cleaned and made to be more descriptive: punctuation was removed, abbreviations were expanded, and consistent use of camel case was applied.
	5. A new, tidy data set was created with the average of each variable grouped by subject and activity.
	
	The resulting data set is tidy for the following reasons: 
		1. Each variable forms a column. In this case each measurement forms a column.
		2. Each observation forms a row. In this case each observation = each subject by activity.
		3. Each type of observational unit forms a table.
		
		For a description of tidy data as it relates to this assignment, see David Hood's blog post: 
		https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/

==================================================================

Running the Script

The script run_analysis.R loads required packages (dplyr) and data and then transforms it following the steps listed above.

The script was written using R version 3.3.1 (2016-06-21) and
dplyr version 3.3.1




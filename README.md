This file tries to explain in summary my choices and actions for the proposed assignment.

--------

#Preparing the Environment
###Working Directory
As stated in the assignment description on Coursera: 

> The code should have a file run_analysis.R in the main directory that can be run as long as the Samsung data is in your working directory.

For this reason, I will assume that the **run_analysis.R** should be placed in the folder where we can find the folder **UCI HAR Dataset**.

#Tidy Data Set
The tidy data set requested for the assignment is also on the repository and it is called **tidy_data_set.txt**.

It is a text file containing the tidy data respecting the main principles:
	
> > Each variable you measure should be in one column 

> > Each different observation of that variable should be in a different row
	
I chose to present the data in the **wide-tidy** form, which means that you will find each measure in a different column.
Additionally, I also chose to exclude the measures **meanFreq(*)** as I considered that they were not requested.
In result, I got a **text file with 181 lines (1 line for the column headers + 180 observations) of 68 variables.**

> (*) - You can find more information about these measures in the file features_info.txt from "UCI HAR Dataset" folder.
	
#run_analysis.R

**Step 1** - Import the necessary files to produce the final tidy data set

**Step 2** - Merge the data sets for training and test data

**Step 3** - Label the data set with descriptive variable names

**Step 4** - Create a new data frame but filtering only the variables for mean and standard deviation
	
	4.1 - Remove the variables meanFreq from the Data frame

**Step 5** - Merge the information about the activity and the subject

**Step 6** - Replace Activity ID for its descriptive activity name

**Step 7** - Just to reorder the columns in the data frame

**Step 8** - Calculate the tidy data set by using ddply. (requires plyr package)

**Important note:** If the script run_analysis.R throws an error, it might be due to not having the plyr package installed and you should perform

	> install.packages(plyr)

**Step 9** - Export the tidy data set to a text file named tidy_data_set.txt
	
#codeBook.md
As it is stated on the required results in the assignment: 

> Was code book submitted to GitHub that modifies and updates the codebooks available to you with the data to indicate all the variables and summaries you calculated, along with units, and any other relevant information?

My understanding on this question is that we should only present the changes/calculations that we made over the data so, there is no need to repeat the information that is already presented in the README.txt, features_info.txt, features.txt and activity_labels.txt.

This information is already available and I chose not to repeat the concepts behind each variable but just to present the calculations made over it, as well as the units involved.
	
	
	
	
	

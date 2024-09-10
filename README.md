# exam-group7

#Authors: Elaheh Javadi Arjmand, Ane Helland, Sigurd Mydske, Stand Hiestand  
# Created: 09.09.2024, 14:20
# Last updated: 10.09.2024, 14:50 (Sigurd Mydske)

Exam for R course in UiB, autumn 2024.

First, open the script named: exam-group7.R install the packages if you don't have it already (You only need to do it once)

install.packages("tidyverse")

install.packages("here")

This script will read the dataset and allow you to explore it using "head", "tail" and "glimpse"-functions. 
It will then remove any duplicates and assign the new dataset to the object "dataset_nodup"
The script will then start to tidy up the data, by seperating some of the values into seperate columns. Lastly, it will edit the titles of some of the column titles. This script will then print a .txt-file to allow for independent runs of subsequent scripts later without the need to run all previous scripts before. 

The second script to run is the "tidy_exam"-script. This will join the original dataset with an additional dataset using the "inner_join-function" with the ID-value as the common key. 
It will check for missin data and reassign variable types. 
It also contains a version to use if value labels are required. This script also writes a new .txt-file.

The third script to run is the "Columns.r". This script will complete the required exam-tasks:
- Create a set of new columns:
        - a column showing gender as "Female" or "Male" instead of "0" or "1"
        - a column showing multiplication of "Mallampati" and "asa" values
        - a column cutting "ease" score into quartiles (4 equal parts); HINT: cut() function
        - a column checking whether the method listed in "which_method" was the same as in                      "Randomized" column
        - Set the order of columns as: `id, gender, age` and other columns
        - Arrange patient_id column of your dataset in order of increasing number or alphabetically.
        - Connect above steps with pipe.
Again, a new .txt-file is created, to be read by the next script.

The fourth script to run is the "Strtify"-script. This will complete the tasks:
    - Explore your data.
    - Explore and comment on the missing variables.
    - Stratify your data by a categorical column and report min, max, mean and sd of a numeric column.
    - Stratify your data by a categorical column and report min, max, mean and sd of a numeric column       for a defined set of observations - use pipe!
        - Only for persons with BMI <= 40
        - Only for females
        - Only for persons older than 45
        - Only for persons with Mallampati score of 2 or more



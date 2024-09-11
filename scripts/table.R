# Table ----
# Date:10.09.2024         
# Author: Ane Helland 
# Use two categorical columns in your dataset to create a table hint count function

library(tidyverse)
library(here)
myData_columns

?count

count(myData_columns, gender_characters) 
count(myData_columns, conformity_rand_int)
table(myData_columns$gender_characters, myData_columns$conformity_rand_int)
#Makes a matrix of gender (female/ male) vs "is randomization == intubation method" listed as true or false. 

myData_columns %>%
  group_by(gender_characters, conformity_rand_int) %>%
  count()
#Makes a table
#Here the output is listed in a table whereas on the first try above the output is really a matrix. 
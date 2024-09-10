#Use two categorical columns in your dataset to create a table (hint: ?count)

library(tidyverse)
library(here)
myData_columns

?count

count(myData_columns, gender_characters) 
count(myData_columns, conformity_rand_int)

table(myData_columns$gender_characters, myData_columns$conformity_rand_int)

#Makes a table of gender (female/ male) vs "is randomization == intubation method" listed as true or false. 

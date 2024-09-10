#Authors: SM and AMH, Date: 10.09.24, Time: 14.15
#This script will stratify some details from our modified datasets

library(tidyverse)
library(here)

read.delim(here("DATA", "dataset-exam-group7-columns.txt"))
myData_columns <- read.delim(here("DATA", "dataset-exam-group7-columns.txt"))
myData_columns

sum(is.na(myData_columns))
which(is.na(myData_columns), arr.ind=TRUE)
#Counts the numbers of NA's in a dataset and locates the positions of the "NA"-values



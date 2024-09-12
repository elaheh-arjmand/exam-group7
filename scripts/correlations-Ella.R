#----header----
#Authour: Elaheh Javadi Arjmand
#Date: 12.09.2024- Day 8 of R course

#According to the data, was there a difference of total intubation time between gender categories?
#loading libraries
library(here)
library(tidyverse)

#reading data
read.delim(here("data", "dataset-exam-group7-columns.txt"))
dataset_tidy <- read.delim(here("data", "dataset-exam-group7-columns.txt"))


#Using t-test for difference in means in gender groups
dataset_tidy %>%
  t.test(total_intubation_time~gender, data=.)
 #p-value= 0.0063, there is a difference in mean total intubation time between gender groups. 
#mean total intubation time for males= 50.22 and for females= 33.68


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

#stratify----
# Date:10.09.2024         
# Author: Elaheh Javadi Arjmand, Stand Hiestand
#Stratify your data by a categorical column and report min, max, mean and sd of a numeric column.
bmi_sum<- myData_columns %>%
  group_by(gender)%>%
  summarise(min(bmi, na.rm = T),
            max(bmi, na.rm = T),
            mean(bmi, na.rm = T),
            sd(bmi, na.rm = T))
view(bmi_sum)

#Stratify your data by a categorical column and report min, max, mean and sd of a numeric column for a defined set of observations - use pipe!
bmi_gender_over40<- myData_columns %>%
  filter(age > 40)%>%
  group_by(gender)%>%
  summarise(min(bmi, na.rm = T),
            max(bmi, na.rm = T),
            mean(bmi, na.rm = T),
            sd(bmi, na.rm = T))
 view(bmi_gender_over40)
 
#Only for persons with BMI <= 40
intubation_time_bmi <-
  myData_columns %>%
  filter(bmi<= 40) %>%
  summarise(min(total_intubation_time,na.rm = T),
            max(total_intubation_time,na.rm = T),
            mean(total_intubation_time,na.rm = T),
            sd(total_intubation_time,na.rm = T))
view(intubation_time_bmi)

#Only for females
intubation_time_females <-
  myData_columns %>%
  filter(gender == 0) %>%
  summarise(min(total_intubation_time,na.rm = T),
            max(total_intubation_time,na.rm = T),
            mean(total_intubation_time,na.rm = T),
            sd(total_intubation_time,na.rm = T))
view(intubation_time_females)

#Only for persons older than 45
intubation_time_age <-
  myData_columns %>%
  filter(age > 45) %>%
  summarise(min(total_intubation_time,na.rm = T),
            max(total_intubation_time,na.rm = T),
            mean(total_intubation_time,na.rm = T),
            sd(total_intubation_time,na.rm = T))
view(intubation_time_age)

#Only for persons with Mallampati score of 2 or more
intubation_time_mallampati <-
  myData_columns %>%
  filter(Mallampati >= 2) %>%
  summarise(min(total_intubation_time,na.rm = T),
            max(total_intubation_time,na.rm = T),
            mean(total_intubation_time,na.rm = T),
            sd(total_intubation_time,na.rm = T))
view(intubation_time_mallampati)


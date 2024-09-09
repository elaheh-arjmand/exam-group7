#----Script Header-------------------------####
# Date:09.09.2024         
# Author: Elaheh Javadi Arjmand, Ane Helland, Sigurd Mydske, Stand Hiestand     
# Filename: exam-group7    
# Description:  group work for RMED901 course
#               
#               
# Project: exam-group7
#-------------------------------------------###

library(tidyverse)
library(here)

#read data
read_delim(here("data", "exam_dataset.txt"))

#assign name to variable
dataset <- read_delim(here("data", "exam_dataset.txt"))

#view data
head(dataset)
tail(dataset)
glimpse(dataset)

#Removing duplicates ----
#possible functions to use:
?distinct
?duplicated

#Finding duplicates
duplicated(dataset)
#Result: Provides a value of FALSE or TRUE for all rows. For all rows after 297, this returns the value "TRUE" 
#All rows from 298-387 are duplicates...

#Removing duplicates be retaining only the first version of the duplicated row.
dataset_nodup <- distinct(dataset)
#Resulting in table of 297 x 14, seems correct.
#Naming the new dataset with no duplications as "dataset_noduplications"


#difficulties intubating needs to be separated into bleeding, ease & sore_throat
dataset_nodup %>% 
  pivot_wider(names_from = difficulties_intubating_feature, 
              values_from = difficulties_intubating_value)

summary(dataset_nodup$difficulties_intubating_value)
dataset_nodup$difficulties_intubating_value

dataset_nodup_sep <- dataset_nodup %>% 
  pivot_wider(names_from = difficulties_intubating_feature, 
              values_from = difficulties_intubating_value)
dataset_nodup_sep
view(dataset_nodup_sep)


#fixing column names, removing spases and putting everything in lowercase
glimpse(dataset_nodup_sep)
dataset<-
  dataset %>%
  rename(bmi= `BMI kg/m2`,
         randomization= Randomization,
         attempts= `# attempts`,
         failures= `# failures`)


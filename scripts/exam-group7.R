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
#Finding duplicates
duplicated(dataset)
#Result: Provides a value of FALSE or TRUE for all rows. For all rows after 297, this returns the value "TRUE" 
#All rows from 298-387 are duplicates...

#Removing duplicates be retaining only the first version of the duplicated row
dataset_nodup <- distinct(dataset)
#Resulting in table of 297 x 14, seems correct.
#Naming the new dataset with no duplications as "dataset_noduplications"


#difficulties intubating needs to be separated into bleeding, ease & sore_throat----
dataset_nodup %>% 
  pivot_wider(names_from = difficulties_intubating_feature, 
              values_from = difficulties_intubating_value)

summary(dataset_nodup$difficulties_intubating_value)
dataset_nodup$difficulties_intubating_value

dataset_nodup_sep <- dataset_nodup %>% 
  pivot_wider(names_from = difficulties_intubating_feature, 
              values_from = difficulties_intubating_value)
dataset_nodup_sep

#Author: SM, Date: 09.09.24, Time: 14.45----
#Separate the data in column "last_method_S_F" 
#One new column called "intubation method" and one with "intubation success"
dataset_nodup_sep<- dataset_nodup_sep %>% 
  separate(col = "last_method_S_F", 
           into = c("intibation method", "intubation success"), 
           sep = "_")

#fixing column names----
glimpse(dataset_nodup_sep)
dataset_nodup_sep<-
  dataset_nodup_sep %>%
  rename(bmi= `BMI kg/m2`,
         randomization= Randomization,
         attempts= `# attempts`,
         failures= `# failures`,
         intubation_method = `intibation method`,
         intubation_success = `intubation success` )
glimpse(dataset_nodup_sep)

#Saving
fileName <- paste0("dataset-exam-group7.txt") #creates an empty file
write_delim(dataset_nodup_sep, 
            file = here("DATA", fileName), delim="\t")

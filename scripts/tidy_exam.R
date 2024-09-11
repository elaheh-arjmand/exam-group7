#----Script Header-------------------------####
# Date:10.09.2024         
# Author: Elaheh Javadi Arjmand, Stand Hiestand     
# Filename: tidy_exam    
# Description:  
#Removing unnecessary columns from the dataframe: `month, year`			
#Reading and joining the additional dataset to your main dataset.			
#Making necessary changes in variable types.			
#               
#               
# Project: exam-group7
#-------------------------------------------###

#Removing unnecessary columns from the dataframe: `month, year`	
library(tidyverse)
library(here)

#read data
read_delim(here("data", "dataset-exam-group7.txt"))

#assigning name to the dataframe (so it appears in the environment)
dataset <- read_delim(here("data", "dataset-exam-group7.txt"))

#exploring
glimpse(dataset)

#we already removed the old columns when we used pivot_wider to create new colums 
#so no further columns will be removed

#Joining datasets-------------
#read additional data
read_delim(here("data", "exam_joindata.txt"))

#assigning additional data to a new dataframe
join_data <- read_delim(here("data", "exam_joindata.txt"))
glimpse(join_data)
#additional join_data has 109 rows, we have concluded that 10 rows are duplicates
#and we do not want to include them in the join, therefore we join with inner_join

#merging the two dataframes
joint_dataset<- dataset %>%
  inner_join(join_data, join_by("id"))

glimpse(joint_dataset)

#checking for missing
naniar::gg_miss_var(joint_dataset)
skimr::skim(joint_dataset)

#Reassigning variable types----------
#reassinging randomination to factor
#intubation_method to factor
#intubation_success to factor
#gender to factor
#view to factor
#Mallampati to factor 
joint_dataset <- 
  joint_dataset %>%
  mutate(Mallampati= as.factor(Mallampati),
         gender = as.factor(gender),
         randomization = as.factor(randomization), 
         intubation_method = as.factor(intubation_method),
         intubation_success = as.factor(intubation_success),
         view = as.factor(view))
glimpse(joint_dataset)

#in case we need value labels
#joint_dataset <- 
  #joint_dataset %>%
  #mutate(gender = if_else(gender==0, "female", "male"),
  #randomization = if_else(randomization==0, "Standard Macintosh #4", "AWS Pentax Video"), 
  #intubation_method = if_else(intubation_method==0, "Standard Macintosh #4", "AWS Pentax Video"),
  #intubation_success = if_else(intubation_success==0, "success", "failure"),
  #view = if_else(view==0, "not good", "good"))

#Saving
fileName <- paste0("dataset-exam-group7-joint.txt") #creates an empty file
write_delim(joint_dataset, 
            file = here("DATA", fileName), delim="\t")

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

#difficulties intubating needs to be separated into bleeding, ease & sore_throat
dataset %>% 
  pivot_wider(names_from = difficulties_intubating_feature, 
              values_from = difficulties_intubating_value)

summary(dataset$difficulties_intubating_value)
dataset$difficulties_intubating_value

test_separation <- dataset %>% 
  pivot_wider(names_from = difficulties_intubating_feature, 
              values_from = difficulties_intubating_value)
test_separation
view(test_separation)

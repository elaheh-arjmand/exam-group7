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

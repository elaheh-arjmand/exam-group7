library(tidyverse)
library(here)

read.delim(here("DATA", "dataset-exam-group7-2024-09-10.txt"))
myData <- read.delim(here("DATA", "dataset-exam-group7-2024-09-10.txt"))
myData

#Authors: AMH, SM, Date: 10.09.24, Time: 13.47
#Pipe to modify columns
myData_columns <- myData %>%
  mutate(gender_characters = if_else(gender == 0, "Female", "Male")) %>% #New column displaying Male and female instead of 0 and 1
  mutate(mallampati_times_asa = (myData$mallampati) * (myData$asa)) %>% #New column multiplying mallampati and asa
  mutate(ease_quartile = cut(ease, 4)) %>% #New column dividing the "ease"-column in quartiles
  mutate(conformity_rand_int = if_else((randomization == intubation_method), TRUE, FALSE)) %>% #New column to check conformity between method and randomization
  select(id, gender, age, everything()) %>% #Organize the columns in a specific order
  arrange(id) #Arrange the rows by increasing ID

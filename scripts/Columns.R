library(tidyverse)
library(here)

read.delim(here("DATA", "dataset-exam-group7-2024-09-10.txt"))
myData <- read.delim(here("DATA", "dataset-exam-group7-2024-09-10.txt"))
myData

myData_columns <- myData %>%
  mutate(gender_characters = if_else(gender == 0, "Female", "Male")) %>%
  mutate(mallampati_times_asa = (myData$mallampati) * (myData$asa)) %>%
  mutate(ease_quartile = cut(ease, 4)) %>%
  mutate(conformity_rand_int = if_else((randomization == intubation_method), TRUE, FALSE)) %>%
  select(id, gender, age, everything()) %>%
  arrange(id)

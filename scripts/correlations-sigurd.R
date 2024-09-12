#Author: Sigurd Mydske, Date 11.09.24, Time 13.20

#assigning name to the dataframe (so it appears in the environment)
dataset_tidy <- read_delim(here("data", "dataset-exam-group7-columns.txt"))

#load ggplot-library
library(ggplot2)

#Create an correlation matrix
install.packages("GGally")
library(GGally)

ggcorr(dataset_tidy)

dataset_tidy <- dataset_tidy %>%
  mutate(age_cat = as.factor(case_when(age < 30 ~ "20-30", 
                             age > 30 & age < 40 ~ "30-40",
                             age > 40 & age < 50 ~ "40-50",
                             age > 50 & age < 60 ~ "50-60",
                             age > 60 & age < 70 ~ "60-70",
                             age > 70 & age < 80 ~ "70-80"
                             )))
levels(dataset_tidy$age_cat)

dataset_tidy %>% count(age_cat)

fct_drop("NA")

#- Does number of failures change with age?
ggplot(data = dataset_tidy %>% filter(!is.na(age))) +
  aes(
    x = failures
  ) +
  geom_bar(
   size = 2,
)+
  facet_wrap(vars(age_cat)
)
#The plot may give the impression that there are a higher number of failures in older age groups

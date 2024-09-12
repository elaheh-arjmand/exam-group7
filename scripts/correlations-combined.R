# Combined script providing answers to the (nine) questions on correlations from day 7 and 8. 
# Authors: Ane Helland, Sigurd Mydske, Elaheh Javadi Arjmand, Stand Histand.


library(ggcorrplot)
library(GGally)
library(ggplot2)
library(here)
library(tidyverse)


#Question 1: Are there any correlated measurements?

ggcorr(myData_columns)
#provides a plot of correlation (positive and negative)
#answer: yes.

#Question 2: Does the age distribution depend on `gender`?
#probably not the right type of plot..?
ggplot(data = myData_columns) +
  aes(
    x = id,
    y = age
  ) +
  geom_point() +
  facet_wrap(facets = vars(gender)) +
  geom_smooth(method = "lm")


#Question 3: Does BMI depend on `age`?

ggplot(data = myData_columns) +
  aes(
    x = age,
    y = bmi
  ) +
  geom_point()

ggplot(myData_columns, aes(x = age, y = bmi)) +
  geom_point() +
  geom_smooth(method = "lm", col = "blue") +  # Adds a linear regression line
  labs(title = "BMI vs Age",
       x = "Age",
       y = "BMI") +
  theme_minimal()

#Question 4: Do age and BMI have a linear relationship?
  
  ggplot(myData_columns,
         aes(
           x=age, 
           y=bmi
         ))+
  geom_point() +
  geom_smooth(method = "lm")

#answer: weak, negative correlation. 

  
#Question 5: Does number of failures change with age?
  
#assigning name to the dataframe (so it appears in the environment)
dataset_tidy <- read_delim(here("data", "dataset-exam-group7-columns.txt"))
 
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
  
#Does number of failures change with age?
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
  
  
#Question 6: Does the randomzation depend on the gender?
  
  # Create a table for gender and randomization
  table_data <- table(dataset_tidy$gender, dataset_tidy$randomization)
  chi_test <- chisq.test(table_data)
  print(chi_test)
  
  #The p-value of 1 indicated no dependency between gender and randomization
  
  
#Question 7: Does the randomization depend on BMI?
  
  myData_columns %>% 
  t.test(bmi~randomization, data = .)

#p value 0.49, not significant. Randomization does not depend on bmi.


#Question 8: Is there an association between BMI and total intubation time?

  #regression (plotting)
  myData_columns %>% 
    ggplot(aes(x = bmi, y = total_intubation_time)) +
    geom_point()
  
  myData_columns %>% 
    ggplot(aes(x = bmi, y = total_intubation_time)) +
    geom_point() + 
    geom_smooth(method = "lm")
  #line of best fit, there appears to be a negative association between bmi and 
  #total intubation time
  
  #creating an object for the plot with line of best fit
  bmi_intub_time_plot <- 
    myData_columns %>% 
    ggplot(aes(x = bmi, y = total_intubation_time)) +
    geom_point() + 
    geom_smooth(method = "lm")
  
  bmi_intub_time_plot
  
  #regression -
  myData_columns %>% 
    lm(total_intubation_time~bmi, data = .) %>% 
    broom::tidy()
  #indicates there is a statistically significant negative association between
  #increasing bmi and intubation time (as bmi increases intubation time decreases)
  
  bmi_intub <-
    myData_columns %>% 
    lm(total_intubation_time~bmi, data = .) 
  
  bmi_intub
  
#Question 9: According to the data, was there a difference of total intubation time between gender categories?

#reading data
  read.delim(here("data", "dataset-exam-group7-columns.txt"))
  dataset_tidy <- read.delim(here("data", "dataset-exam-group7-columns.txt"))
  
  
#Using t-test for difference in means in gender groups
  dataset_tidy %>%
    t.test(total_intubation_time~gender, data=.)
  #p-value= 0.0063, there is a difference in mean total intubation time between gender groups. 
  #mean total intubation time for males= 50.22 and for females= 33.68
  
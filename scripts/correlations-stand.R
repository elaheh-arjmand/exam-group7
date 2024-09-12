
 
# Are there any correlated measurements? Yes :)
install.packages("GGally")
library(here)
library(tidyverse)
library(GGally)
read.delim(here("DATA", "dataset-exam-group7-columns.txt"))
myData_columns <- read.delim(here("DATA", "dataset-exam-group7-columns.txt"))
myData_columns

ggcorr(myData_columns)

# Compute a correlation matrix
data(myData_columns)
corr <- round(cor(mtcars), 1)
head(corr[, 1:6])


#  - Does BMI depend on `age`? 
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


#  - Do age and BMI have a linear relationship?
ggplot(data = myData_columns) +
  aes(
    x = age,
    y = bmi
  ) +
  geom_point() +
  geom_smooth(method = "lm")
  
#  - Does the age distribution depend on `gender`?
#probably not the right type of plot...
ggplot(data = myData_columns) +
  aes(
    x = id,
    y = age
  ) +
  geom_point() +
  facet_wrap(facets = vars(gender)) +
  geom_smooth(method = "lm")

  
#  - Does number of failures change with age?
ggplot(myData_columns,
  aes(x = age, y = failures)) +
  geom_point()

view(myData_columns)

# - Is there an association between BMI and total intubation time? 
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



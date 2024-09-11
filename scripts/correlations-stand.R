
 
# Are there any correlated measurements? Yes :)
install.packages("GGally")
library(GGally)
ggcorr(myData_columns)

read.delim(here("DATA", "dataset-exam-group7-columns.txt"))
myData_columns <- read.delim(here("DATA", "dataset-exam-group7-columns.txt"))
myData_columns

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


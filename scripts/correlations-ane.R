#Create plots to help you answer this question: Do age and BMI have a linear relationship? 
#Author Ane Helland

library(ggplot2)


#just trying some stuff:
ggplot(myData_columns,
  aes(x=age, y=attempts))+
  geom_point(aes(col = attempts))

ggplot(myData_columns,
      aes(x=age, y=failures)) +
        geom_point(aes(col=failures))
#plotting age vs attempts and age vs failures. 


#Correlation-package:
install.packages("ggcorrplot")  
install.packages("GGally")
library(ggcorrplot)
library(GGally)

ggcorr(myData_columns)
#provides a plot of correlation (positive and negative)

#Do age and BMI have a linear relationship?

ggplot(myData_columns,
        aes(
          x=age, 
          y=bmi
          ))+
  geom_point() +
  geom_smooth(method = "lm")

#answer: weak, negative correlation. 

#Does the randomization depend on BMI?

myData_columns$bmi
myData_columns$randomization

#bmi is a continous variable, randomization is 0 or 1. 


myData_columns %>% 
  t.test(bmi~randomization, data = .)
#p value 0.49, not significant. Randomization does not depend on bmi. 

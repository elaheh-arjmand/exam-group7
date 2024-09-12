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

#plotting them next to each other
library(patchwork)
myplot_age_attempts + myplot_age_failures



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

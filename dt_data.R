# Decision Tree Regression 
# it is the first non-continuous regression model 
# divides the set into different splits and takes the avaerage of that split to predict the value 

dt_data <- read.csv("Position_Salaries.csv")

dt_data <- dt_data[2:3]

library(ggplot2)
#fitting the decision tree  to the data 

#install.packages('rpart')
library(rpart)

regressor = rpart(formula = Salary ~. , data= dt_data , control = rpart.control(minsplit=1))

#predict 

y_predict = predict(regressor, data.frame(Level=6.5))

# Visualize with high resolution 
x_grid = seq(min(dt_data$Level), max(dt_data$Level),0.1)

ggplot()+ geom_point(aes( x=dt_data$Level , y = dt_data$Salary), color= "blue")+
         geom_line(aes(x=x_grid , y = predict(regressor, newdata = data.frame(Level= x_grid))),color="red")


#??rpart()

# plot decision tree

plot(regressor)
text(regressor)

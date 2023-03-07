dataset = read.csv('Salary_Data.csv')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)
regressor = lm (formula = Salary ~  YearsExperience,
               data = training_set)
y-pred = predict(regressor, newdata = testing_set)
library(ggplot2)
ggplot()+
geom_point (aes(x = training_set$YearsExperience, y = training_set$Salary),
            colour = "red") +
geom_line(aes(x = training_set$YearsExperience,
              y = predict(regressor, newdata = training_set)),
             colour = "blue") +
ggtitle("Sueldo x años de experiencia Kaori Momose")
xlab("Experiencia")
ylab("Sueldo S")

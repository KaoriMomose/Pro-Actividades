#Ana Kaori Momose Amador

dataset = read.csv('Data.csv')
dataset = dataset[, 2:3]

library(caTools)
set.seed(123)

split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
training_set = subset(dataset, split == FALSE)

dataset = read.csv('Data.csv', stringsAsFactors = F)
str(dataset)
dataset$Country = factor(dataset$Country,
                         levels = c("France","Spain","Germany"),
                         labels = c(1,2,3))
str(dataset)

dataset = read.csv('Data.csv')

dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x)mean(x, na.rm = TRUE)),
                     dataset$Age)
dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN = function(x)mean(x, na.rm = TRUE)),
                        dataset$Salary)


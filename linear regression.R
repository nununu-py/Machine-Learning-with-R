
mydata <- read.csv("D:\\Data Set\\DS Dasar Dataset\\Salary_Data.csv")

library(caTools)

set.seed(123)

split_data <- sample.split(mydata$Salary, SplitRatio = 0.7)

training_set <- subset(mydata, split_data == TRUE)
test_set <- subset(mydata, split_data == FALSE)

str(training_set)
str(test_set)

#model
regressor <- lm(
  formula = Salary ~ YearsExperience,
  data = training_set
)

y_pred <- predict(regressor, newdata = test_set)

result <- cbind(test_set, y_pred)

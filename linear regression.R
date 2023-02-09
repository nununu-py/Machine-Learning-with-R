dataframe <- read.csv("E:\\Data Science\\R\\it box\\data\\Salary_Data.csv")

dataframe$User.ID <- NULL
dataframe$Purchased <- NULL

library(ggplot2)
ggplot(data = dataframe, aes(YearsExperience, Salary)) + geom_point()

library(caTools)

set.seed(123)

split_data <- sample.split(dataframe$YearsExperience, SplitRatio = 0.7)

train_data <- subset(dataframe, split_data == TRUE)
test_data <- subset(dataframe, split_data == FALSE)

str(train_data)
str(test_data)

# create model linear regression
regressor <- lm(
  formula = Salary ~ YearsExperience,
  data = train_data
)

y_pred <- predict(regressor, newdata = test_data)

result <- cbind(test_data, y_pred)

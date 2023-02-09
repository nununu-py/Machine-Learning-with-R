dataframe <- read.csv("E:\\Data Science\\R\\it box\\data\\Social_Network_Ads.csv")

head(dataframe)

dataframe$User.ID <- NULL

# feature scaling
dataframe[, c('Age', 'EstimatedSalary')] <- scale(dataframe[, c('Age', 'EstimatedSalary')])

library(caTools)

set.seed(123)

split_data <- sample.split(Y = dataframe$Purchased, SplitRatio = 0.7) 
train_data <- subset(x = dataframe, split_data == TRUE)
test_data <- subset(x = dataframe, split_data == FALSE)

# logistic regression model
classifier <- glm(formula = Purchased ~ .,
                  family ="binomial",
                  data = train_data) 

# . means all columns in data frame except Purchased

# test
prob_predict <- predict(classifier, 
                        type = "response",
                        newdata = test_data[-3])

prob_predict

y_pred <- ifelse(test = prob_predict >= 0.5, yes = 1, no = 0)
y_pred

result <- cbind(test_data, y_pred)

summary(as.factor(result$Purchased))
summary(as.factor(result$y_pred))

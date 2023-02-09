df <- read.csv("E:\\Data Science\\R\\it box\\data\\Social_Network_Ads.csv")

head(df)

df$User.ID <- NULL

library(ggplot2)

ggplot(data = df, aes(Age)) + geom_boxplot()
ggplot(data = df, aes(EstimatedSalary)) + geom_boxplot()

# feature scaling
df[, 1:2] <- scale(df[, 1:2]) 

library(caTools)

set.seed(123)

split_data <- sample.split(Y= df$Purchased, SplitRatio = 0.7)

# train and test data
train_set <- subset(df, split_data == TRUE)
test_set <- subset(df, split_data == FALSE)

#  create support vector machine model
library(e1071)

classifier <- svm(formula = Purchased ~ .,
                  data = train_set,
                  type = "C-classification",
                  kernel = "linear")

y_pred <- predict(classifier, newdata = test_set[-3])

y_pred

result <- cbind(test_set, y_pred)

summary(as.factor(result$Purchased))
summary(as.factor(result$y_pred))

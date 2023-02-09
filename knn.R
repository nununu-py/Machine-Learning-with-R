dataframe <- read.csv("E:\\Data Science\\R\\it box\\data\\Social_Network_Ads.csv")

head(dataframe)

dataframe$User.ID <- NULL

# feature scaling
dataframe[, 1:2] <- scale(dataframe[, 1:2])

library(caTools)

set.seed(42)

split_data <- sample.split(Y = dataframe$Purchased, SplitRatio = 0.7)
train_data <- subset(dataframe, split_data == TRUE)
test_data <- subset(dataframe, split_data == FALSE)

# knn model
library(class)

y_pred <- knn(train = train_data[, -3],
              test = test_data[, -3],
              cl = train_data[, 3],
              k = 5)

# cl = data yang akan digunakan sebagai pembelajaran

result <- cbind(test_data, y_pred)

summary(as.factor(result$Purchased))
summary(as.factor(result$y_pred))


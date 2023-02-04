
df <- read.csv("D:\\Data Set\\DS Dasar Dataset\\Social_Network_Ads.csv")

head(df)

df$User.ID <- NULL

# feature scaling

df[, 1:2] <- scale(df[, 1:2])

head(df)

# subseting data

library(caTools)

set.seed(123)

split_data <- sample.split(Y = df$Purchased, SplitRatio = 0.7)

train_data <- subset(df, split_data == TRUE)
test_data <- subset(df, split_data == FALSE)

# membuat model

library(class)

y_pred <- knn(train = train_data[,-3],
              test = test_data[,-3],
              cl = train_data[,3],
              k = 5) # cl = data yang akan digunakan sebagai pembelajaran

summary(as.factor(y_pred))

result <- cbind(test_data, y_pred)



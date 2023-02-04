
df <- read.csv("D:\\Data Set\\DS Dasar Dataset\\Social_Network_Ads.csv")

head(df)

df$User.ID <- NULL

# feature scaling

df[, 1:2] <- scale(df[, 1:2]) # melakukan saling dengan rumus standarisasi

# split dataset

library(caTools)

set.seed(123)

split_data <- sample.split(Y= df$Purchased, SplitRatio = 0.7)

# membuat training set dan test test

train_set <- subset(df, split_data == TRUE)
test_set <- subset(df, split_data == FALSE)

# membuat model

library(e1071)

classifier <- svm(formula = Purchased ~ . ,
                  data = train_set,
                  type = "C-classification",
                  kernel = "linear")

y_pred <- predict(classifier, newdata = test_set[-3])

result <- cbind(test_set, y_pred)









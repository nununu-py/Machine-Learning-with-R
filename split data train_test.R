
df <- read.csv("D:\\Data Set\\DS Dasar Dataset\\Social_Network_Ads.csv")

df$User.ID <- NULL

library(caTools)

set.seed(123)

split_data <- sample.split(df$Purchased, SplitRatio = 0.7)

train_data <- subset(df, split_data == TRUE)
test_data <- subset(df, split_data == FALSE)

summary(as.factor(train_data$Purchased))
summary(as.factor(test_data$Purchased))

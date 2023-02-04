
df <- read.csv("D:\\Data Set\\DS Dasar Dataset\\Social_Network_Ads.csv")

head(df)

df$User.ID <- NULL

# untuk logistic regression diperlukan feature scaling

df[, 1:2] <- scale(df[, 1:2])

library(caTools)

set.seed(123)

split_data <- sample.split(Y = df$Purchased, SplitRatio = 0.7) # Y adalah target yang akan di prediksi

train_data <- subset(x = df, split_data == TRUE)
test_data <- subset(x =df, split_data == FALSE)

# train logistic regression
# model
classifier <- glm(formula = Purchased ~ .,
                  family ="binomial",
                  data = train_data) # . memiliki arti semua column kecuali kolom yang akan diprediksi

# predict

prob_predict <- predict(classifier, 
                        type = "response",
                        newdata = test_data[-3])


y_pred <- ifelse(prob_predict >= 0.5, 1, 0)


result <- cbind(test_data, y_pred)

summary(as.factor(result$Purchased))
summary(as.factor(result$y_pred))


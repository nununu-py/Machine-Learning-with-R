df <- read.csv("E:\\Data Science\\R\\it box\\data\\Social_Network_Ads.csv")

df$User.ID <- NULL

df$EstimatedSalary <- ifelse(df$EstimatedSalary > 100000, 
                             yes = 100000,
                             no = df$EstimatedSalary)

library(caTools)

set.seed(123)

split_data <- sample.split(df$Purchased, SplitRatio = 0.7)

train_data <- subset(df, split_data == TRUE)
test_data <- subset(df, split_data == FALSE)

summary(as.factor(train_data$Purchased))
summary(as.factor(test_data$Purchased))

library(ggplot2)

train_data_dist <- ggplot(data = train_data, aes(EstimatedSalary)) + geom_boxplot()
test_data_dist <- ggplot(data = test_data, aes(EstimatedSalary)) + geom_boxplot()

train_data_dist
test_data_dist

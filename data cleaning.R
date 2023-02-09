dataframe <- read.csv("E:\\Data Science\\R\\it box\\data\\Social_network_ads - na.csv")

# check NA value from data frame
sum(is.na(dataframe$Age))
sum(is.na(dataframe$EstimatedSalary))

# subset data frame / drop NA values / replace NA values
# 1
# dataframe$EstimatedSalary[is.na(dataframe$EstimatedSalary)] <- 0
# dataframe$Age[is.na(dataframe$Age)] <- 0

# mean(dataframe$Age)
# mean(dataframe$EstimatedSalary)

# 2
# dataframe$Age[is.na(mydata$Age)] <- round(mean(mydata$Age, na.rm = TRUE), 0)
# dataframe[, 3][is.na(dataframe[, 3])] <- round(mean(mydata[, 3], na.rm = TRUE), 0)

# 3
filter_df <- subset(dataframe, is.na(dataframe$Age) == FALSE & is.na(dataframe$EstimatedSalary) == FALSE)

# check estimated salary data distribution
library(ggplot2)

box_plot <- ggplot(data=filter_df, aes(x = EstimatedSalary)) + geom_boxplot()
box_plot

filter_df$EstimatedSalary <- ifelse(test = filter_df$EstimatedSalary > 100000,
                  yes = 100000,
                  no = filter_df$EstimatedSalary)

box_plot <- ggplot(data = filter_df, aes(x = EstimatedSalary)) + geom_boxplot()
box_plot

histogram <- ggplot(data = filter_df, aes(x = EstimatedSalary)) + geom_histogram()
histogram

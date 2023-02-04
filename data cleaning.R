
mydata <- read.csv("D:\\R program\\Data Set\\DS Dasar Dataset\\Social_network_ads - na.csv")

# check na value from a dataset column
is.na(mydata$Age)

# subeseting
data_filter <- subset(mydata, is.na(mydata$Age) == FALSE & is.na(mydata$EstimatedSalary) == FALSE)

#subset(mydata, is.na(mydata$Age) == FALSE & is.na(mydata$EstimatedSalary) == FALSE, select = c(Gender, Age))

# change data in a column value using condition
data_filter$EstimatedSalary <- ifelse(test = data_filter$EstimatedSalary > 100000,
                  yes = 100000,
                  no = data_filter$EstimatedSalary)

# another way to change a na value in a column field
# i am using dataframe 1 "mydata

is.data.frame(mydata) # mydata is dataframe
is.vector(mydata$Age) # but when it accessed/called by a column its going to be a vector

# mydata$EstimatedSalary[is.na(mydata$EstimatedSalary),] <- 0

# the na value will be replace to numeric value from average age
# fyi [] it's not only for subseting but also for accessing data

# mydata$Age[is.na(mydata$Age)] <- round(mean(mydata$Age, na.rm = TRUE), 0)

# this is another way which i found from my knowledge about subseting data
# mydata[,3][is.na(mydata[,3])] <- round(mean(mydata[,3], na.rm = TRUE), 0)


# feature scaling/penyekalaan data






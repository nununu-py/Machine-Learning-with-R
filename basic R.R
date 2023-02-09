var1 <- 1:10
summary(var1)

var2 <- c(1,2,3,4,9:13)
var2[1:3]

var3 <- rep(1:3, each = 3)
var3 <- as.factor(var3)

summary(var3)
levels(var3)

var4 <- c("nana", "nini", "nunu")
summary(var4)
levels(var4)

is.vector(var1)
is.vector(var2)

matrix()

dataFrame <- read.csv("E:\\Data Science\\R\\it box\\data\\Salary_Data.csv")

is.numeric(dataFrame$Salary)
is.vector(dataFrame$Salary)

is.data.frame(dataFrame[, 1, drop = FALSE])

dataFrame[c(1:10), 2]

dataFrame[1:2]
dataFrame[seq(1,1,1)]

dataFrame[,1][dataFrame$Salary > 100000]

















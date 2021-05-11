glassdata <- read.table(file = "glass.data", sep = ",", header = FALSE)
colnames(glassdata) <- c('Id', 'RI', 'Na', 'Mg', 'Al', 'Si', 'K', 'Ca', 'Ba', 'Fe', 'Class')
dims <- dim(glassdata)
n <- dims[1]
m <- dims[2]

glassdata <- glassdata[-1]

n_train <- 150

round(prop.table(table(glassdata[10])) * 100, digits = 1)

set.seed(12345)
glassdata_mixed <- glassdata[order(runif(n)),]
train_data <- glassdata_mixed[1:n_train,]

train_data_labels <- train_data[, 10]
train_data_labels <- factor(train_data_labels)
round(prop.table(table(train_data[10])) * 100, digits = 1)

test_data <- glassdata_mixed[(n_train + 1):n,]
test_data_labels <- test_data[, 10]

train_data <- train_data[-10]
test_data <- test_data[-10]
library(e1071)
my_classifier <- naiveBayes(train_data, train_data_labels)

data_test_pred <- predict(my_classifier, test_data)

library("gmodels")

CrossTable(x = test_data_labels, y = data_test_pred, prop.chisq=TRUE)

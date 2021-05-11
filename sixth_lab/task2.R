glassdata <- read.table(file = "glass.data", sep = ",", header = FALSE)
colnames(glassdata) <- c('Id', 'RI', 'Na', 'Mg', 'Al', 'Si', 'K', 'Ca', 'Ba', 'Fe', 'Type')
dims <- dim(glassdata)
n <- dims[1]
m <- dims[2]
glassdata <- glassdata[-1]
n_train <- 150
round(prop.table(table(glassdata[10])) * 100, digits = 1)
set.seed(1234567)
glassdata_mixed <- glassdata[order(runif(n)),]
train_data <- glassdata_mixed[1:n_train,]
train_data_labels <- train_data[, 10]
train_data_labels <- factor(train_data_labels, levels = c(1, 2, 3, 5, 6, 7), labels = c("1", "2", "3", "5", "6", "7"))
round(prop.table(table(train_data_labels)) * 100, digits = 1)
test_data <- glassdata_mixed[(n_train + 1):n,]
test_data_labels <- test_data[, 10]
library(rpart)
my_tree <- rpart(Type ~ RI + Na + Mg + Al + Si + K + Ca + Ba + Fe, method = "class", data = train_data)
plot(my_tree)
text(my_tree, cex = 1.2, all = FALSE, use.n = FALSE)
test_data <- test_data[-10]
glass_pred <- predict(my_tree, test_data, type="class")
library("gmodels")
CrossTable(x = test_data_labels, y = glass_pred, prop.chisq=FALSE)


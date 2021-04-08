glasses <- read.csv("glass.data", header = FALSE)
colnames(glasses) <- c('Id', 'RI', 'Na', 'Mg', 'Al', 'Si', 'K', 'Ca', 'Ba', 'Fe', 'Type')
glasses$Type <- factor(glasses$Type, levels = c(1, 2, 3, 4, 5, 6, 7), labels = c(1, 2, 3, 4, 5, 6, 7))
round(prop.table(table(glasses$Type))*100, digits = 1)
# Id field not needed
glasses <- glasses[-1]
summary(glasses[c('RI', 'Na', 'Mg')])
set.seed(42)
rows <- sample(nrow(glasses))
glasses <- glasses[rows, ]
normalize <- function(x) {return ((x - min(x)) / (max(x) - min(x)))}
glasses_n <- as.data.frame(lapply(glasses[1:9], normalize))
glasses_train <- glasses_n[1:199, ]
glasses_test <- glasses_n[200:214, ]
glasses_train_labels <- glasses[1:199, 10]
glasses_test_labels <- glasses[200:214, 10]
library('class')
glasses_test_pred <- knn(train = glasses_train, test = glasses_test,cl = glasses_train_labels, k=21)
library('gmodels')
CrossTable(x = glasses_test_labels, y = glasses_test_pred, prop.chisq=FALSE)

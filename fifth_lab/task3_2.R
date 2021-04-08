library('e1071')
DGlass <- read.table(file = "glass.data", sep = ",",
                     header = FALSE)
colnames(DGlass) <- c('Id', 'RI', 'Na', 'Mg', 'Al', 'Si', 'K', 'Ca', 'Ba', 'Fe', 'Class')
DGlass <- DGlass[-1]
DGlass$F <- as.factor(ifelse(DGlass$Class == 2, 2, 1))
svm.all <- svm(formula = F ~ ., data = DGlass[, -10],
               cross = 10, kernel = "linear")
table(fact = DGlass$F, prediction = predict(svm.all))
Acc = mean(predict(svm.all) == DGlass$F)
paste("Accuracy=", round(100 * Acc, 2), "%", sep = "")

CVsvm <- function(x, y) {
  n <- nrow(x); Err_S <- 0
  for (i in 1:n) {
    svm.temp <- svm(x = x[-i,], y = y[-i], kernel = "linear")
    if (predict(svm.temp, newdata = x[i,]) != y[i])
      Err_S <- Err_S + 1 }
  Err_S / n }

Acc <- 1 - CVsvm(DGlass[, 1:9], DGlass$F)
paste("Accuracy=", round(100 * Acc, 2), "%", sep = "")

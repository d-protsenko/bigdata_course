str(iris)
table(iris$Species)
round(prop.table(table(iris$Species)) * 100, digits = 1)
plot(iris$Sepal.Length, iris$Sepal.Width, col=iris$Species, pch=19)
legend("topright", legend=levels(iris$Species), bty="n", pch=19, col=palette())
normMinMax = function(x) {
  return((x-min(x))/max(x)-min(x))
}
iris_norm <- as.data.frame(lapply(iris[1:4], normMinMax))
set.seed(1234)
indexes = sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))
iris_train = iris[indexes==1, 1:4]
iris_test = iris[indexes==2, 1:4]
iris_train_labels = iris[indexes==1, 5]
iris_test_labels = iris[indexes==2, 5]
library("class")
iris_mdl = knn(train=iris_train, test=iris_test, cl=iris_train_labels, k=3)
library("gmodels")
CrossTable(x=iris_test_labels, y=iris_mdl, prop.chisq = FALSE)
CM = table(iris_test_labels, iris_mdl)
accuracy = (sum(diag(CM)))/sum(CM)
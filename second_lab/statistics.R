# setwd('./second_lab')
M <- read.csv("./turkiye.csv")

ptm <- proc.time()

for (i in 1:dim(M)[2])
{
  # Берем I-ый столбец
  X <- M[, i]
  # Берем его длину
  n <- length(X)
  # Зачем-то смотрим его min\max
  min(X)
  max(X)
  # Записываем сумму строки
  S <- sum(X)
  # Получаем декартово произведение (?)
  X2 <- X %*% X
  # Записываем деление суммы столбца на кол-во элементов
  MX <- S / n
  # делим на длину
  X2 / n
  # узнаем variance по X
  VX <- var(X)
  # VX умножаем на длину X
  VX * n
  # Берем корень
  SVX <- sqrt(VX)
  # Делим на сумму разделенную на кол-во элементов
  SVX / MX
}

p <- proc.time() - ptm
# по итогу у нас остается последний столбец в переменной X (?)
# относительно значений в нем выясняем какие значения составляют квантили
quantile(X, probs <- c(0.25, 0.5, 0.75))
# Узнаем корреляцию первых двух признаков (Sepal.Length и Sepal.Width) для первых 50 записей у датасета iris
cor(iris[1:50, 1:2])[1, 2]
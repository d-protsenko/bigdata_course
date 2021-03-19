# setwd('./third_lab')
# Прочитаем содержимое файла в переменную A
A <- read.table("abalone.data", header=FALSE, sep=",")
A
# Сохраним данные по интересующим нас признакам в переменных
# Второй столбец - длина моллюска
dlina <- A[, 2]
# Третий столбец - диаметр раковины
diam <- A[, 3]
# Построим облако точек
plot(dlina, diam,col="blue",type="p",pch=16,
xlab="dlina",ylab="diam",main="Зависимость между длиной моллюска и
диаметром раковины")


myregress <- lm(formula = diam ~ dlina)
myregress

# Построим график уравнения однофакторной линейной регрессии (с
# найденными коэффициентами)
abline(myregress,col="red",lwd="3",add=TRUE)


# Положим Intercept = 0
myregress1 <- lm(formula = diam ~ -1 + dlina)
myregress1

# Построим прямую "исправленной" регрессии:
abline(myregress1,col="green",lwd="3",add=TRUE)
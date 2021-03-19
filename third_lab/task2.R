# setwd('./third_lab')

x <- scan("./X_2.txt", sep=" ")
y <- scan("./Y_2.txt", sep=" ")
# Построим облако точек
plot(x, y, col="blue",type="p",pch=16,
xlab="x",ylab="y",main="Зависимость между X и Y")


myregress <- lm(formula = diam ~ x)
myregress

# Построим график уравнения однофакторной линейной регрессии (с
# найденными коэффициентами)
abline(myregress,col="red",lwd="3",add=TRUE)
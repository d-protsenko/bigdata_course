# setwd('./third_lab')

dlina <- scan("./X_2.txt", sep=" ")
diam <- scan("./Y_2.txt", sep=" ")
# Построим облако точек
plot(dlina, diam, col="blue",type="p",pch=16,
xlab="dlina",ylab="diam",main="Зависимость между X и Y")


myregress <- lm(formula = diam ~ dlina)
myregress

# Построим график уравнения однофакторной линейной регрессии (с
# найденными коэффициентами)
abline(myregress,col="red",lwd="3",add=TRUE)
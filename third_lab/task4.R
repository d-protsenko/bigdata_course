fish_set <- read.csv('./Fish.csv')

height <- fish_set[, 6]
width <- fish_set[, 7]
plot(height, width, col="blue",type="p",pch=16,
xlab="height",ylab="width",main="Зависимость между height и width")

myregress <- lm(formula = width ~ height)
myregress

abline(myregress,col="red",lwd="3",add=TRUE)



#############

newheights <- c(10.4, 9.3, 11.2, 16.5, 13.3, 12.4, 3.3)
newheights
newidths <- predict(myregress, data.frame(height = newheights), level = 0.9, interval = "confidence")

newys <- newidths[, 1]
newys

points(newheights, newys, col = "green", type = "p", pch = 16, add = TRUE)

cor.test(height, width)

# Включите в отчёт построенный график,
# запишите численно коэффициенты регрессии
# Coefficients:
# (Intercept)       height
#      1.6199       0.3118
# коэффициент корреляции 0.792881
# значение критерия Стьюдента 16.303
# расчётные значения прогнозируемого признака (newys)
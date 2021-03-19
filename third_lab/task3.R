# Primer2
A <- read.table("abalone.data", header = FALSE, sep = ",")
# Второй столбец - длина моллюска
dlina <- A[, 2]
# Третий столбец - диаметр раковины
diam <- A[, 3]
# Построим облако точек
plot(dlina, diam, col = "blue", type = "p", pch = 16,
     xlab = "dlina", ylab = "diam", main = "Зависимость между X и Y")

myregress <- lm(formula = diam ~ dlina)
myregress

abline(myregress, col = "red", lwd = "3", add = TRUE)

summary(myregress)
r <- cor(dlina, diam)
r

n <- length(dlina)
# Вычислим и выведем значение T-критерия
t <- r / sqrt(1 - r^2) * sqrt(n - 2)
t

cor.test(dlina, diam)

1 - pt(t, n - 2)

# Primer3

newdlinas <- c(0.35, 0.22, 0.81, 0.64, 0.73, 0.12, 0.47)
newdlinas
newdiams <- predict(myregress, data.frame(dlina = newdlinas), level = 0.9, interval = "confidence")

newys <- newdiams[, 1]
newys

points(newdlinas, newys, col = "green", type = "p", pch = 16, add = TRUE)
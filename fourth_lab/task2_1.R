N = 20 # Число наблюдений (квартир)
M = 6 # Число факторов
Data = matrix(1:(N * (M + 1)), ncol = (M + 1))
X = matrix(1:(N * M), ncol = M)
Y = matrix(1:N, ncol = 1)
T = matrix(1:(M + 1) * (M + 1), ncol = (M + 1))
Teta = matrix(1:(M + 1), ncol = 1)
Data = read.csv("myflats.txt", sep = '\t')
colnames(Data)[1] <- 'totsquare'
X = Data[, 1:M]
Y = Data[, (M + 1)]
odin = vector(length = N, mode = 'numeric')
odin = rep(1, N)
X1 = matrix(1:(N * (M + 1)), ncol = (M + 1))
X1[, 1] = odin
for (i in 1:M) X1[, i + 1] = X[, i]
T1 = t(X1)
T = T1 %*% X1
library(MASS)
obr = ginv(T)
Teta = obr %*% T1 %*% Y
Teta = Teta[, 1]
print(Teta)
# ================================================================
# Введём данные нашей квартиры (на первое место сразу поставим
# единицу)
myx = c(1, 65.7, 46.2, 1, 9, 1.5, 500)
myx
myX = matrix(myx, ncol = M + 1, byrow = TRUE)
tmyX = t(myX)
# Оценим стоимость нашей квартиры
myprice = Teta %*% tmyX
print(myprice)
N = 159 # Число наблюдений (квартир)
M = 5 # Число факторов
Data = matrix(1:(N * (M + 1)), ncol = (M + 1))
X = matrix(1:(N * M), ncol = M)
Y = matrix(1:N, ncol = 1)
T = matrix(1:(M + 1) * (M + 1), ncol = (M + 1))
Teta = matrix(1:(M + 1), ncol = 1)
Data = read.csv("Fish.csv")[, 2:7]
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
myx = c(1, 242, 23.2, 25.4, 30, 11.52)
myx
myX = matrix(myx, ncol = M + 1, byrow = TRUE)
tmyX = t(myX)
# Оценим ширину
mywidth = Teta %*% tmyX
print(mywidth)
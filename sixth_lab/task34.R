dataclients <- scan("Clients.txt")

dataclients
M <- 1

A <- matrix(dataclients, ncol = M + 1, byrow = TRUE)
A

salary <- A[, 1]
n <- length(salary)
n

trust <- A[, 2]

salary
trust

plot(salary, trust, type = "n", main = "Зависимость между зарплатой и платёжеспособностью")

n <- length(salary)
n

for (i in 1:n)
{
  zvet <- ifelse(trust[i] == 1, "blue", "red") # цвет точки
  points(salary[i], trust[i], type = "p", pch = 16, col = zvet, add = "TRUE")
}

colnames(A) <- c("Salary", "Trust")
A

B <- as.data.frame(A)
B
mymodel <- glm(formula = Trust ~ Salary, family = binomial, data = B)

Teta <- coef(mymodel)
Teta

fexp <- function(x)
{
  vspom <- exp(Teta[1] + Teta[2] * x);
  return(vspom / (1 + vspom))
}

curve(fexp(x), -40, 50, col = "Orange", lwd = 3, add = TRUE)

newSalaries <- c(10, 13, 15, 16, 21)
newy <- fexp(newSalaries)

points(newSalaries, newy, col = "DarkGreen", type = "p", pch = 16, add = TRUE)

nnew <- length(newSalaries)
for (i in 1:nnew)
{
  segments(newSalaries[i], 0, newSalaries[i], newy[i], col = "gray", add = "TRUE")
  segments(newSalaries[i], newy[i], 0, newy[i], col = "gray", add = "TRUE")
}
solutions <- matrix(1:(nnew * 2), ncol = 2)
solutions[, 1] <- newSalaries
solutions[, 2] <- newy
t <- as.data.frame(solutions)

colnames(t) <- c("Зарплата", "Кредитоспособность")
t
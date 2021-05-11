dataclients <- scan("Clients2.txt")

dataclients
M <- 2

A <- matrix(dataclients, ncol = M + 1, byrow = TRUE)
A

salary <- A[, 1]
age <- A[, 2]
trust <- A[, 3]
n <- length(salary)
plot(salary + age, trust, type = "n", main = "Зависимость между зарплатой + возрастом и платёжеспособностью")
for (i in 1:n)
{
  zvet <- ifelse(trust[i] == 1, "blue", "red") # цвет точки
  points(salary[i] + age[i], trust[i], type = "p", pch = 16, col = zvet, add = "TRUE")
}

colnames(A) <- c("Salary", "Age", "Trust")
B <- as.data.frame(A)
mymodel <- glm(formula = Trust ~ Salary + Age, family = binomial(logit), data = B)
summary(mymodel)
Teta <- coef(mymodel)
fexp <- function(x)
{
  vspom <- exp(Teta[1] + (Teta[2]+Teta[3]) * x);
  return(vspom / (1 + vspom))
}
curve(fexp(x), -40, 50, col = "Orange", lwd = 3, add = TRUE)
newSalaryPlusAge <- c(25, 26, 27, 28, 29)
newy <- fexp(newSalaryPlusAge)
points(newSalaryPlusAge, newy, col = "DarkGreen", type = "p", pch = 16, add = TRUE)
nnew <- length(newSalaryPlusAge)
for (i in 1:nnew)
{
  segments(newSalaryPlusAge[i], 0, newSalaryPlusAge[i], newy[i], col = "gray", add = "TRUE")
  segments(newSalaryPlusAge[i], newy[i], 0, newy[i], col = "gray", add = "TRUE")
}
solutions <- matrix(1:(nnew * 2), ncol = 2)
solutions[, 1] <- newSalaryPlusAge
solutions[, 2] <- newy
t <- as.data.frame(solutions)
colnames(t) <- c("Зарплата+Возраст", "Кредитоспособность")

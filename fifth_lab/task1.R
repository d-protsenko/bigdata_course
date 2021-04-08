x = append(scan("./balance1.txt", sep=" "), scan("./balance2.txt", sep=" "))
y = append(scan("./salary1.txt", sep=" "), scan("./salary2.txt", sep=" "))
plot(x, y, col = "blue", type = "p", pch = 16,
     xlab = "balance", ylab = "salary", main = "Зависимость между Salary и Balance")

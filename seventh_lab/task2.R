library(arules)
library(datasets)
cheki <- read.transactions("Pokupki.csv", sep=",", encoding = 'UTF8')
cheki 

itemFrequencyPlot(cheki, topN=20, type="absolute")
image(cheki[1:18],axes="TRUE")
myrules <- apriori(data=cheki,
parameter=list(support=0.001,confidence=0.9,
minlen=1))
inspect(myrules[1:5])
summary(myrules)
myrules<-sort(myrules, by="lift")
inspect(myrules[1:5])

milkrules<-subset(myrules, items %in% "milk")
# Отсортируем список правил, включающих молоко, по убыванию лифта и
# распечатаем первые 5 правил:
inspect(sort(milkrules, by="lift")[1:5])

dairyrules<-subset(myrules, items %in% c("milk","candy"))
dairyrules<-subset(myrules, lhs %in% "candy")
write(dairyrules, file = "dairy_rules.txt", sep = ",", quote =
TRUE, row.names = FALSE)

dairy_rules_df <- as(dairyrules, "data.frame")
dairy_rules_df
str(dairy_rules_df)
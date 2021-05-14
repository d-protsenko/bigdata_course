teens <- read.csv("snsdata.txt")
n <- 30000
str(teens)
summary(teens)
table(teens$gender, useNA = "ifany")
summary(teens$age)
teens$age <- ifelse(teens$age >= 13 & teens$age <= 20, teens$age, NA)
mean(teens$age)
mean(teens$age, na.rm = TRUE)
aggregate(data = teens, age ~ gradyear, mean, na.rm = TRUE)
ave_age <- ave(teens$age, teens$gradyear, FUN =
function(x) mean(x, na.rm = TRUE))
teens$age <- ifelse(is.na(teens$age), ave_age, teens$age)
interests <- teens[1:n,5:40]
interests_z <- as.data.frame(lapply(interests, scale))

summary(interests_z )

teen_clusters <- kmeans(interests_z, 5)
teen_clusters
teen_clusters$size
teen_clusters$centers
teens$cluster <- teen_clusters$cluster

teens[1:20, c("cluster", "gender", "age", "friends")]
aggregate(data = teens, age ~ cluster, mean)

teens$female <- ifelse(teens$gender == "F", 1, 0)
teens$no_gender <- ifelse(is.na(teens$gender), 1, 0)
aggregate(data = teens, female ~ cluster, mean)
aggregate(data = teens, friends ~ cluster, mean)

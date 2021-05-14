customers <- read.csv("Mall_Customers.csv")
n <- 200
str(customers)
summary(customers)
table(customers$Gender, useNA = "ifany")
summary(customers$Age)

interests <- customers[1:n, 4:5]
interests_z <- as.data.frame(lapply(interests, scale))

summary(interests_z )

customer_clusters <- kmeans(interests_z, 2)
customer_clusters
customer_clusters$size
customer_clusters$centers
customers$cluster <- customer_clusters$cluster

customers[1:20, c("cluster", "Gender", "Age")]
aggregate(data = customers, Age ~ cluster, mean)

customers$female <- ifelse(customers$Gender == "Female", 1, 0)
aggregate(data = customers, female ~ cluster, mean)

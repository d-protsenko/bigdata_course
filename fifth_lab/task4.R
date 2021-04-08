fish_set <- read.csv('Fish.csv')
colnames(fish_set) <- c("Species","Weight", "Length1", "Length2", "Length3", "Height", "Width")
fish_set$Species <- factor(fish_set$Species, levels = c("Bream", "Roach", "Whitefish", "Parkki", "Perch", "Pike", "Smelt"),
                           labels = c(1, 2, 3, 4, 5, 6, 7))
round(prop.table(table(fish_set$Species))*100, digits = 1)
summary(fish_set[c('Weight', 'Height', 'Width')])
set.seed(42)
rows <- sample(nrow(fish_set))
fish_set <- fish_set[rows, ]
normalize <- function(x) {return ((x - min(x)) / (max(x) - min(x)))}
fish_set_n <- as.data.frame(lapply(fish_set[2:7], normalize))
fish_set_train <- fish_set_n[1:140, ]
fish_set_test <- fish_set_n[141:159, ]
fish_set_train_labels <- fish_set[1:140, 1]
fish_set_test_labels <- fish_set[141:159, 1]
library('class')
fish_set_test_pred <- knn(train = fish_set_train, test = fish_set_test,cl = fish_set_train_labels, k=21)
library('gmodels')
CrossTable(x = fish_set_test_labels, y = fish_set_test_pred, prop.chisq=FALSE)

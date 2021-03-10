library('caret')
names(caret::getModelInfo())

x <- matrix(rnorm(50*5), ncol=5)
y <- factor(rep(c("A", "B"), 25))

caret::featurePlot(x, y)

library('FSelector')


iris$Petal.Length <- as.factor(iris$Petal.Length)
FSelector::random.forest.importance(Petal.Length ~ ., iris)


# ------------------------
setwd('./second_lab')
library('missForest')
read_file <- read.csv('./bank-full.csv',header=TRUE,sep=';',stringsAsFactors = F) #read csv into a dataframe

convert <- c(2:5, 7:9,11,16:17)
read_file[,convert] <- data.frame(apply(read_file[convert], 2, as.factor))
str(read_file)

# Generate 5% missing values at random
bank.mis <- missForest::prodNA(read_file, noNA = 0.05)

library('Boruta')
library('Amelia')
amelia_bank <- amelia(bank.mis, m=3, parallel = "multicore",noms=c('job','marital','education','default','housing','loan','contact','month','poutcome','y'))
set.seed(111)
boruta.bank_train <- Boruta(y~., data = amelia_bank$imputations[[1]], doTrace = 2)
print(boruta.bank_train)
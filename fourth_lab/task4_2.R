fish_set <- read.csv('Fish.csv')
colnames(fish_set) <- c("Species","Weight", "Length1", "Length2", "Length3", "Height", "Width") # присваиваем удобочитаемые имена
myregress <- lm(Width ~ Weight + Length1 + Length2 + Length3 + Height, data=fish_set)
summary.lm(myregress)

# predict using LM
myfish=c(242,23.2,25.4,30,11.52)
myfish=data.frame(t(myfish))
colnames(myfish)<-c("Weight", "Length1", "Length2", "Length3", "Height")
myfish
newwidth = predict(myregress, myfish)
newwidth

# CORRELATION
# использовал среднее геометрическое (СГ)
gm_mean = function(x, na.rm=TRUE){
  exp(sum(log(x[x > 0]), na.rm=na.rm) / length(x)) }

fish_set.gm = apply(fish_set[,2:7], 2, gm_mean) # получаем значение СГ для всех атрибутов
fish_set.t = fish_set[,2:7]/fish_set.gm # получаем относительные значения
apply(fish_set.t, 2, shapiro.test) # проверяем нормальность распределения
cor.m = cor(fish_set.t, method = "spearman") # строим корреляционную матрицу


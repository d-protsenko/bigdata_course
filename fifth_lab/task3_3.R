DGlass <- read.table(file = "glass.data", sep = ",",
                     header = FALSE)
colnames(DGlass) <- c('Id', 'RI', 'Na', 'Mg', 'Al', 'Si', 'K', 'Ca', 'Ba', 'Fe', 'Class')
DGlass <- DGlass[-1]
print(t(apply(DGlass[, -10], 2, function (x) {
c(min = min(x), max = max(x),
 mean = mean(x), std = sd(x),
 cor = cor(x, DGlass$Class))
})), 3)
library(ggplot2)
library(vegan)
Y <- as.data.frame(DGlass[,1:9])
mod.pca <- rda(Y ~ 1)
summary(mod.pca)
F <- as.factor(ifelse(DGlass$Class == 2, 2, 1))
pca.scores <- as.data.frame(summary(mod.pca)$sites[,1:2])
pca.scores <- cbind(pca.scores, F)
l <- lapply(unique(pca.scores$F), function(c)
 { f <- subset(pca.scores, F == c); f[chull(f), ]})
hull <- do.call(rbind, l)
axX <- paste("PC1 (",
 as.integer(100*mod.pca$CA$eig[1]/sum(mod.pca$CA$eig)),"%)")
axY <- paste("PC2 (",
 as.integer(100*mod.pca$CA$eig[2]/sum(mod.pca$CA$eig)),"%)")
ggplot() +
 geom_polygon(data=hull,aes(x=PC1,y=PC2, fill=F),
 alpha=0.4, linetype=0) +
 geom_point(data=pca.scores,aes(x=PC1,y=PC2,shape=F,
 colour=F),size=3) +
 scale_colour_manual( values = c('purple', 'blue'))+
 xlab(axX) + ylab(axY) + coord_equal() + theme_bw()
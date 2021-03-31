myData = read.csv("myflats.txt", sep = '\t')
colnames(myData)[1] <- 'totsquare'
myData
mymodel = lm(price ~ -1+ totsquare +
livesquare + floor + height + distcenter +
distmetro, data = myData)
summary(mymodel)
myflat=c(46,38,10,10,11,1.5)
myflat=data.frame(t(myflat))
colnames(myflat)<-c("totsquare","livesquare","floor","height","distcenter","distmetro")
myflat
newprice = predict(mymodel, myflat)
newprice
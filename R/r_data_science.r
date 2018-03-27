iris
data_raw = iris
data_raw = iris
View(data_raw)
View(data_raw)
plot(data_raw)
featurePlot
install.packages("caret")
featurePlot
library(caret)
featurePlot
featurePlot(data_raw)
head(data_raw)
head(data_raw[ 1,])
head(data_raw[ 1,5])
head(data_raw[ 1:5,])
1:5
1:10
seq(1:10)
seq(1:10,2)
seq(1:10,2)
seq(1,10,2)
data_raw[,1:4]
head(data_raw[,1:4])
featurePlot(data_raw[,1:4], data_raw$Species)
featurePlot(data_raw[,1:4], data_raw$Species, "ellipse")
install.packages("ellipse")
featurePlot(data_raw[,1:4], data_raw$Species, "ellipse")
?createDataPartition
trainRowNumbers = createDataPartition(iris$Species,p = 0.8,list= FALSE)
trainData = data_raw[ trainRowNumbers, ]
testData = data_raw[ -trainRowNumbers, ]
model = train(Species ~., data = trainData, method = 'rf')
install.packages("e1071")
model = train(Species ~., data = trainData, method = 'rf')
View(model)
model
predicted = predict(model, testData)
predicted
testDataSpecies
testData$Species
predicted == testData$Species
sum[predicted == testData$Species]
sum(predicted == testData$Species)
sum(predicted == testData$Species)/30 * 100
save.image("C:/Users/hwan/Desktop/r.RData")
savehistory("~/rrrrrr.Rhistory")

class_pack = c("caret",
               "skimr",
               "RANN",
               "randomForest",
               "fastAdaboost",
               "gbm",
               "xgboost",
               "caretEnsemble",
               "C50",
               "earth",
               "ada",
               "adaboost")
install.packages(class_pack)

library(caret) # total packages for data analysis
library(skimr) # Descriptive statistics
library(RANN) # Predicting missing values
library(caretEnsemble)

url_address = "https://www.dropbox.com/s/4wpkhme7476zdt3/dataset.csv?dl=1"
dataset <- read.csv(url_address)

#trainROWNumbers에 dataset의 80% 인덱스만 저장
trainRowNumbers = createDataPartition(dataset$class,p = 0.8,list= FALSE) 

#index의 data 저장, -는 나머지 20%
#trainData와 testData는 완전히 관계가 없어야 한다.
trainData = dataset[trainRowNumbers, ]
testData = dataset[ -trainRowNumbers, ]

x = trainData[, 1:20]
y = trainData$class

#밑에서 안쓰는데 왜 쓰는지 모르겠음.
skimmed = skim_to_wide(trainData)
skimmed[,c(10:16)]
#

#이 Dataset은 NA가 모두 제거된 데이터!
anyNA(trainData)

#NA값을 채워주는 방법인데, 방법들 중 하나의 method가 "knnImpute"
preProcess_missingdata_model = preProcess(trainData , method = "knnImpute")
trainData_impute = predict(preProcess_missingdata_model, newdata = trainData)

#NA가 제거된 데이터에서 NA가 있는지 확인
anyNA(trainData_impute)

#one-hot encoding
#각각의 feature들마다 1과0의 list로 분류
dummies_model = dummyVars(class~., data = trainData_impute)
trainData_mat = predict(dummies_model, newdata = trainData_impute)
# Warning message:
# In model.frame.default(Terms, newdata, na.action = na.action, xlev = object$lvls) :
# 변수 'Purchase'는 요인이 아닙니다.

#matrix값을 R에서 인식할 수 있는, vector
trainData_dummy = data.frame(trainData_mat)

#분산은 유지한 상태로, 데이터의 범위를 다르게!
#데이터간 비율을 유지한 채, 시작과 끝값을 고정
preProcess_range_model = preProcess(trainData_dummy, method = "range")
trainData_pre = predict(preProcess_range_model, newdata = trainData_dummy)

#1:10 -> 1:61로 변경 dummies에서 variables이 61
apply(trainData_pre[, 1:61], 2, FUN = function(x) { c("min" = min(x), "max" = max(x)) })

#변수 'class'는 요인이 아닙니다. -> 날라간 부분 복
trainData_pre$class = y

#rf method로 learning
model_nnet = train(class ~., data = trainData_pre, method = "nnet")
model_nnet
plot(model_nnet)

#train할때, 가장 영향력 큰 변수가 무엇인지 보기 위한 것.
varimp_nnet = varImp(model_nnet)
plot(varimp_nnet)

testData2 = predict(preProcess_missingdata_model, testData)
testData3 = predict(dummies_model, testData2)
#Warning message:
#  In model.frame.default(Terms, newdata, na.action = na.action, xlev = object$lvls) :
#  변수 'class'는 요인이 아닙니다

testData3 = data.frame(testData3)
testData4 = predict(preProcess_range_model, testData3)


# method : repeatedcv
# number : 10선.
fitControl <- trainControl(method = 'repeatedcv', number = 9, savePredictions = 'final', classProbs = T, summaryFunction = twoClassSummary)

#method : earth, nnet, ada  // caret 
model_ada = train(class ~., data = trainData_pre, method = 'adaboost', metric = 'ROC', tuneLength = 5, trControl = fitControl)



predicted_ada = predict(model_ada, testData4)

#결과출력
# positive 파라미터 없앰.
confusionMatrix(reference = testData$class, data = predicted_ada,mode = 'everything')

model_ada



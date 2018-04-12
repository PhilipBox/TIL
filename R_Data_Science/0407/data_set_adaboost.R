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

#trainROWNumbers�� dataset�� 80% �ε����� ����
trainRowNumbers = createDataPartition(dataset$class,p = 0.8,list= FALSE) 

#index�� data ����, -�� ������ 20%
#trainData�� testData�� ������ ���谡 ����� �Ѵ�.
trainData = dataset[trainRowNumbers, ]
testData = dataset[ -trainRowNumbers, ]

x = trainData[, 1:20]
y = trainData$class

#�ؿ��� �Ⱦ��µ� �� ������ �𸣰���.
skimmed = skim_to_wide(trainData)
skimmed[,c(10:16)]
#

#�� Dataset�� NA�� ��� ���ŵ� ������!
anyNA(trainData)

#NA���� ä���ִ� ����ε�, ����� �� �ϳ��� method�� "knnImpute"
preProcess_missingdata_model = preProcess(trainData , method = "knnImpute")
trainData_impute = predict(preProcess_missingdata_model, newdata = trainData)

#NA�� ���ŵ� �����Ϳ��� NA�� �ִ��� Ȯ��
anyNA(trainData_impute)

#one-hot encoding
#������ feature�鸶�� 1��0�� list�� �з�
dummies_model = dummyVars(class~., data = trainData_impute)
trainData_mat = predict(dummies_model, newdata = trainData_impute)
# Warning message:
# In model.frame.default(Terms, newdata, na.action = na.action, xlev = object$lvls) :
# ���� 'Purchase'�� ������ �ƴմϴ�.

#matrix���� R���� �ν��� �� �ִ�, vector
trainData_dummy = data.frame(trainData_mat)

#�л��� ������ ���·�, �������� ������ �ٸ���!
#�����Ͱ� ������ ������ ä, ���۰� ������ ����
preProcess_range_model = preProcess(trainData_dummy, method = "range")
trainData_pre = predict(preProcess_range_model, newdata = trainData_dummy)

#1:10 -> 1:61�� ���� dummies���� variables�� 61
apply(trainData_pre[, 1:61], 2, FUN = function(x) { c("min" = min(x), "max" = max(x)) })

#���� 'class'�� ������ �ƴմϴ�. -> ���� �κ� ��
trainData_pre$class = y

#rf method�� learning
model_nnet = train(class ~., data = trainData_pre, method = "nnet")
model_nnet
plot(model_nnet)

#train�Ҷ�, ���� ����� ū ������ �������� ���� ���� ��.
varimp_nnet = varImp(model_nnet)
plot(varimp_nnet)

testData2 = predict(preProcess_missingdata_model, testData)
testData3 = predict(dummies_model, testData2)
#Warning message:
#  In model.frame.default(Terms, newdata, na.action = na.action, xlev = object$lvls) :
#  ���� 'class'�� ������ �ƴմϴ�

testData3 = data.frame(testData3)
testData4 = predict(preProcess_range_model, testData3)


# method : repeatedcv
# number : 10��.
fitControl <- trainControl(method = 'repeatedcv', number = 9, savePredictions = 'final', classProbs = T, summaryFunction = twoClassSummary)

#method : earth, nnet, ada  // caret 
model_ada = train(class ~., data = trainData_pre, method = 'adaboost', metric = 'ROC', tuneLength = 5, trControl = fitControl)



predicted_ada = predict(model_ada, testData4)

#������
# positive �Ķ���� ����.
confusionMatrix(reference = testData$class, data = predicted_ada,mode = 'everything')

model_ada


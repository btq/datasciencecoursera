setcwd = ('D:/GitHub/datasciencecoursera/pracML/quiz2/')

#Question 2
library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(975)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[inTrain, ]
testing = mixtures[-inTrain, ]
names <- colnames(concrete)
names <- names[-length(names)]
featurePlot(x = training[, names], y = training$CompressiveStrength, plot = "pairs")
index <- seq_along(1:nrow(training))
ggplot(data = training, aes(x = index, y = CompressiveStrength)) + geom_point() + theme_bw()

#We see 4 clear steps, use cut2 to categorize the output
cutCS <- cut2(training$CompressiveStrength, g = 4)
summary(cutCS)
ggplot(data = training, aes(y = index, x = cutCS)) + geom_boxplot() + geom_jitter(col = "blue") + 
  theme_bw()

featurePlot(x = training[, names], y = cutCS, plot = "box")


#Question 3
library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(975)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[inTrain, ]
testing = mixtures[-inTrain, ]
ggplot(data = training, aes(x = Superplasticizer)) + geom_histogram() + theme_bw()


#Question 4
ILdat = training[,grep("^IL",names(training))]
names(ILdat)
preProcess(ILdat,method="pca",thresh=.9)

#Question 5
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis, predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[inTrain, ]
testing = adData[-inTrain, ]
set.seed(3433)
## grep the predictors starting with 'IL'
IL_str <- grep("^IL", colnames(training), value = TRUE)
## make a subset of these predictors
predictors_IL <- predictors[, IL_str]
df <- data.frame(diagnosis, predictors_IL)
inTrain = createDataPartition(df$diagnosis, p = 3/4)[[1]]
training = df[inTrain, ]
testing = df[-inTrain, ]

## train the data using the first method
modelFit <- train(diagnosis ~ ., method = "glm", data = training)
predictions <- predict(modelFit, newdata = testing)
## get the confustion matrix for the first method
C1 <- confusionMatrix(predictions, testing$diagnosis)
print(C1)
A1 <- C1$overall[1]

## do similar steps with the caret package
modelFit <- train(training$diagnosis ~ ., method = "glm", preProcess = "pca", 
                  data = training, trControl = trainControl(preProcOptions = list(thresh = 0.8)))
C2 <- confusionMatrix(testing$diagnosis, predict(modelFit, testing))
print(C2)
A2 <- C2$overall[1]

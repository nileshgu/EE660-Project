# This is a demo of H2O's Random Forest (classification) function
# It imports a data set, parses it, and prints a summary
# Then, it runs RF with 50 trees, maximum depth of 100, using the iris class as the response
# Note: This demo runs H2O on localhost:54321
library(h2o)
h2o.init()

train.hex = h2o.uploadFile(path = system.file("extdata", "trainData.csv", package="h2o"), destination_frame = "train.hex")
summary(train.hex)

test.hex = h2o.uploadFile(path = system.file("extdata", "testData.csv", package="h2o"), destination_frame = "test.hex")
summary(test.hex)
print(iris.rf)

iris.rf_50 = h2o.randomForest(y = 78, x = c(1:77), training_frame = train.hex, nfolds = 2, ntrees = 50, max_depth = 100,mtries=-1)
save.image("iris.rf");
iris.rf_100 = h2o.randomForest(y = 78, x = c(1:77), training_frame = train.hex, nfolds = 2, ntrees = 100, max_depth = 100,mtries=-1)
save.image("iris.rf");
iris.rf_250 = h2o.randomForest(y = 78, x = c(1:77), training_frame = train.hex, nfolds = 2, ntrees = 250, max_depth = 100,mtries=-1)
save.image("iris.rf");
iris.rf_500 = h2o.randomForest(y = 78, x = c(1:77), training_frame = train.hex, nfolds = 2, ntrees = 500, max_depth = 100,mtries=-1)
save.image("iris.rf");

iris.rf_tree25 = h2o.randomForest(y = 78, x = c(1:77), training_frame = train.hex[1:10000,], nfolds = 2, ntrees = 250, max_depth = 25,mtries=-1)
iris.rf_tree50  = h2o.randomForest(y = 78, x = c(1:77), training_frame = train.hex[1:10000,], nfolds = 2, ntrees = 250, max_depth = 50,mtries=-1)
iris.rf_tree100  = h2o.randomForest(y = 78, x = c(1:77), training_frame = train.hex[1:10000,], nfolds = 2, ntrees = 250, max_depth = 100,mtries=-1)
iris.rf_tree200  = h2o.randomForest(y = 78, x = c(1:77), training_frame = train.hex[1:10000,], nfolds = 2, ntrees = 250, max_depth = 200,mtries=-1)
iris.rf_tree400  = h2o.randomForest(y = 78, x = c(1:77), training_frame = train.hex[1:10000,], nfolds = 2, ntrees = 250, max_depth = 400,mtries=-1)



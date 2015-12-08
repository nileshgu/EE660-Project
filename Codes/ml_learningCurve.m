
%% load data
clear;clc;close all;
load('../Data/TwoFoldData.mat');
X_test=X_test(1:2000,:);
y_test=y_test(1:2000);

%% fit
for i=50:100:9000
    
X_trainnew=X_train(1:i,:);
y_trainnew=y_train(1:i);
model = logregFit(X_trainnew,y_trainnew);
predictFn = @(model, X)logregPredict(model, X);
lossFn = @(yhat, ytest)zeroOneLossFn(yhat, ytest);

err_train(i) = sum(zeroOneLossFn(logregPredict(model,X_trainnew),y_trainnew))/length(y_trainnew);
err_test(i) = sum(zeroOneLossFn(logregPredict(model,X_test),y_test))/length(y_test);


end
plot(err_train,'-.r*')
hold on
plot(err_test,'--mo')

% load data
clear;clc;close all;
load('../Data/TwoFoldData.mat');

%%
% % learning algorithm
% X_preTrain = X_preTrain(:,1:70);
% X_preTest = X_preTest(:,1:70);
% X_test = X_test(:,1:70);
%% logistic regression
% tic;
% model = logregFit(X_train, y_train);
% [yhat, p] = logregPredict(model, X_train);
% [yhat_test, p_out] = logregPredict(model, X_test);
% errorRate = mean(yhat ~= y_train);
% fprintf('Error rate using raw features: %2.f%%\n', 100*errorRate);
% errorRate_out = mean(yhat_test ~= y_test);
% fprintf('Error rate using raw features: %2.f%%\n', 100*errorRate_out);

%% fit
tic;
fitFn = @(X_train,y_train,lambda)logregFit(X_train,y_train,'lambda',lambda,'regType','L2');
predictFn = @(model, X)logregPredict(model, X);
lossFn = @(yhat, ytest)zeroOneLossFn(yhat, ytest);
params = logspace(-2,1,10);
Nfolds = 3;

% standardize
[model, bestParam, mu, se] = ...
    fitCv(params, fitFn, predictFn, lossFn, X_train, y_train,  Nfolds);
err_train = sum(zeroOneLossFn(logregPredict(model,X_train),y_train))/length(y_train)
err_test = sum(zeroOneLossFn(logregPredict(model,X_test),y_test))/length(y_test)
bestParam

toc;

%% plot cross validation
figure;
semilogx(params,mu,'o-');
xlabel('\lambda');
ylabel('mean loss');

%% evaluate the output
lossEvalFcn(p,y_train)
lossEvalFcn(p_out,y_test)

% evaluate the overall data
[yhat_out, p_out] = logregPredict(model, X_test);
errorRate_out = mean(yhat_out ~= y_test);
lossEvalFcn(p_out,y_test)

% plot the error rates
plot_logreg;
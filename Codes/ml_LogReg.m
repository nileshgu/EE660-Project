
% load data
clear;clc;close all;
load('../Data/TwoFoldData.mat');

%%
% % learning algorithm
% X_preTrain = X_preTrain(:,1:70);
% X_preTest = X_preTest(:,1:70);
% X_test = X_test(:,1:70);
%% logistic regression
tic;
model = logregFit(X_train, y_train);
[yhat, p] = logregPredict(model, X_train);
[yhat_test, p_out] = logregPredict(model, X_test);
errorRate = mean(yhat ~= y_train);
fprintf('Error rate using raw features: %2.f%%\n', 100*errorRate);
errorRate_out = mean(yhat_test ~= y_test);
fprintf('Error rate using raw features: %2.f%%\n', 100*errorRate_out);

toc;

%% evaluate the output
lossEvalFcn(p,y_train)
lossEvalFcn(p_out,y_test)

% evaluate the overall data
[yhat_out, p_out] = logregPredict(model, X_test);
errorRate_out = mean(yhat_out ~= y_test);
lossEvalFcn(p_out,y_test)

% plot the error rates
plot_logreg;
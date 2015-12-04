% The main m file
clc; clear all; close all;

load('../Data/TwoFoldData.mat');

% learning algorithm

%% performance evaluation 
tic;
model = svmFit(X_train, y_train, 'kernel', 'rbf', 'kernelParam', [0.1, 0.5, 1, 5], 'C',logspace(-1,2,4)); % Eout going up, Ein going down
yhat_test  = svmPredict(model, X_test);
yhat  = svmPredict(model, X_train);
time_costed = toc;
save('../Data/svmModelFinalRandom');

%% yield the output and calculate the error
% 


error = mean(yhat_test ~= y_test)
inerror = mean(yhat ~= y_train)
% The main m file
clc; clear all; close all;
load('../Data/twoFoldData.mat'); 



%% performance evaluation 

% 
% model = svmFit(XTr, yTr), 
% yhatnew  = svmPredict(model, Xt);
% yhat  = svmPredict(model, XTr);
% 
% 
% %% yield the output and calculate the error
% 
% error = mean(yhatnew ~= yt);
% inerror = mean(yhat ~= yTr); %error =0.5610,inerror =0.3582


%% random assignment

a=unique(yTr);
b=datasample(a,14445);
errorRandom = mean(b ~= yt); %errorRandom =0.9735


%% evaluate the output in Kaggle's formula
lossEvalFcn(b,yt);
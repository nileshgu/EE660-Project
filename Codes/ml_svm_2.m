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

%% extend the yhat to probs matrix y_probs
y_probs=convert_yhat_to_yprobs(yhatnew);
% evaluate the probs
lossEvalFcn(y_probs,yt);

%% random assignment

a=unique(yTr);
b=datasample(a,14445);
errorRandom = mean(b ~= yt); %errorRandom =0.9735


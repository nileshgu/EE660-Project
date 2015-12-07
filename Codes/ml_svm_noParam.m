clc;
clear all;
close all;
load('../Data/svmModelNoParamRandom.mat');
fprintf('random with no params in SVM');
error = mean(yhat_test ~= y_test)
inerror = mean(yhat ~= y_train)
run('ml_class_wise_error.m');




load('../Data/svmModelNoParamProportional.mat');
fprintf('proportional with no params in SVM');
error = mean(yhat_test ~= y_test)
inerror = mean(yhat ~= y_train)
run('ml_class_wise_error.m');

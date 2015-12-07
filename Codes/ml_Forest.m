% load data
clear;clc;close all;
load('../Data/TwoFoldData.mat');

%% run forrest fit

tic;
N=size(X_train,1);
idx = randperm(N,floor(N*0.1));
forest = fitForest(X_train(idx,:),y_train(idx,:),'randomFeatures',9,'bagSize',1/3,'ntrees',50);
toc;
save('forest_50tree_10N.mat')
yhat_test = predictForest(forest,X_test);
errs_test = mean(y_test ~= yhat_test);
yhat_train = predictForest(forest,X_train);
errs_train = mean(Ytrain_ ~= yhat_train);

model = forest;
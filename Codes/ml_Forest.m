% load data
clear;clc;close all;
load('../Data/FourFoldData.mat');

%% run forrest fit
addpath decisionTrees;

[nexamples,nfeatures] = size(X_preTrain);
ntrees = 100;
randomFeatures = 2;
bagSize = 1/3;

tic;
N = size(X_preTrain,1);
nitr = 1;
nntree = 30;
errs_test = zeros(nitr,nntree);
errs_train = zeros(nitr,nntree);
for ntree = 30:1:nntree
	ntree
    idx_train = randperm(N);idx_train = idx_train(1:floor(N*0.7));
    Xtrain_ = X_train(idx_train,:);
    Ytrain_ = y_train(idx_train,:);
	for itr = 1:nitr
		forest = fitForest(Xtrain_,Ytrain_,'randomFeatures',9,'bagSize',1/3,'ntrees',ntree);
		yhat_test = predictForest(forest,X_test);
		errs_test(itr,ntree) = mean(y_test ~= yhat_test);
		yhat_train = predictForest(forest,Xtrain_);
		errs_train(itr,ntree) = mean(Ytrain_ ~= yhat_train);
	end
end
disp('finished');
%%
std_vs_ntree = std(errs_test,1);
mean_vs_ntree_test = mean(errs_test,1);
mean_vs_ntree_train = mean(errs_train,1);
toc;
model = forest;
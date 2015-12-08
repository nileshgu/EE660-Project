
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

pp = {}; fnames = {}; titles = {};
lambda = 1e-2;
rbfScale = 1;
polydeg  = 2;
protoTypes = [1 1; 1 5; 5 1; 5 5];
%protoTypes = [1 1; 5 5];
protoTypesStnd = standardizeCols(protoTypes);
kernels = {@(X1, X2)kernelRbfSigma(X1, X2, rbfScale)
           @(X1, X2)kernelPoly(X1, X2, polydeg)};
fnames  = {'logregXorRbfProto', 'logregXorRbfAll', 'logregXorPolyKernel'};
titles  = {'rbf prototypes', 'rbf all', 'poly kernel'};
for i=1:numel(kernels)
  pp{i} = preprocessorCreate('kernelFn', kernels{i}, 'standardizeX', true, 'addOnes', true);
end

for i=1:numel(pp)
    model = logregFit(X_train(1:1000,:), y_train(1:1000,:), 'lambda', lambda,'regType','L1', 'preproc', pp{i});
    yhat = logregPredict(model, X);
    errorRate = mean(yhat ~= y);
    fprintf('Error rate using %s features: %2.f%%\n', titles{i}, 100*errorRate);
    predictFcn = @(Xtest)logregPredict(model, Xtest);
    plotDecisionBoundary(X, y, predictFcn);
    if  i==1
       hold on; 
       plot(protoTypes(:, 1), protoTypes(:, 2), '*k', 'linewidth', 2, 'markersize', 10)
    end
    title(titles{i});
    printPmtkFigure(fnames{i})
end

% tic;
% fitFn = @(X_train,y_train,lambda)logregFit(X_train,y_train,'lambda',lambda,'regType','L2');
% predictFn = @(model, X)logregPredict(model, X);
% lossFn = @(yhat, ytest)zeroOneLossFn(yhat, ytest);
% params = logspace(-2,1,10);
% Nfolds = 3;
% 
% % standardize
% [model, bestParam, mu, se] = ...
%     fitCv(params, fitFn, predictFn, lossFn, X_train, y_train,  Nfolds);
% err_train = sum(zeroOneLossFn(logregPredict(model,X_train),y_train))/length(y_train)
% err_test = sum(zeroOneLossFn(logregPredict(model,X_test),y_test))/length(y_test)
% bestParam
% 
% toc;
% 
% %% plot cross validation
% figure;
% semilogx(params,mu,'o-');
% xlabel('\lambda');
% ylabel('mean loss');
% 
% %% evaluate the output
% lossEvalFcn(p,y_train)
% lossEvalFcn(p_out,y_test)
% 
% % evaluate the overall data
% [yhat_out, p_out] = logregPredict(model, X_test);
% errorRate_out = mean(yhat_out ~= y_test);
% lossEvalFcn(p_out,y_test)
% 
% % plot the error rates
% plot_logreg;
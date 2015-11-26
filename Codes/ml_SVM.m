% The main m file

%% data process
load('../data/FeatureDataFromDepartAndDate.mat');

%% learning algorithm
% TODO: adaboost here
% split the data into three sets
X = X(randperm(end),:); %Shuffling the data
[m,n]=size(X);
%idx1 = floor(m/3); %random classification
idx1 =7000;

% idx2 = floor(2*m/3);
X_preTrain = X(1:idx1,:);y_preTrain = y(1:idx1);
X_preTest = X(idx1+1:idx1+2000,:);y_preTest = y(idx1+1:idx1+2000,:);

% X_train = X(idx1+1:idx2,:);y_train = y(idx1+1:idx2);
% X_test = X(idx2+1:end,:);y_test = y(idx2+1:end);

% \pmtk3-master\pmtksupportCopy\boostingDemo

%% performance evaluation 

%model = svmFit(X_preTrain, y_preTrain);
%model = svmFit(X_preTrain, y_preTrain, 'kernel', 'rbf','kernelParam',[0.1, 0.5, 1, 5], 'C', logspace(-1,1,10));
model = svmFit(X_preTrain, y_preTrain, 'kernel', 'rbf', 'kernelParam', [0.1, 0.5, 1, 5], 'C', 0.9); % Eout going up, Ein going down
save svmModelpreSTrain.mat model;
yhat  = svmPredict(model, X_preTest);
yhatnew  = svmPredict(model, X_preTrain);

%% yield the output and calculate the error

errorRateGen = mean(yhat ~= y_preTest) 
errorRateGennew = mean(yhatnew ~= y_preTrain)
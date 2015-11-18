% The main m file

%% data process
load('../data/FeatureDataFromDepart.mat');;

%% learning algorithm
% TODO: adaboost here
% split the data into three sets
[m,n]=size(X);
idx1 = floor(m/3);
idx2 = floor(2*m/3);
X_preTrain = X(1:idx1,:);y_preTrain = y(1:idx1,:);
X_train = X(idx1+1:idx2,:);y_train = X(idx1+1:idx2,:);
X_test = X(idx2+1:end,:);y_test = X(idx2+1:end,:);

% \pmtk3-master\pmtksupportCopy\boostingDemo

%% performance evaluation 

%% yield the output
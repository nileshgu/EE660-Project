%% data process
load('../data/FeatureDataFromDepartAndDate.mat');

%% split the data into three sets
% this will be only execute once;
[m,n]=size(X);
ii = randperm(m);
idx1 = 70000;
X_train = X(ii(1:idx1),:);y_train = y(ii(1:idx1),:);
X_test = X(ii(idx1+1:end),:);y_test = y(ii(idx1+1:end),:);

%% save
% save('../data/FourFoldData.mat');
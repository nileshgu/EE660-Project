%% data process
load('../data/FeatureDataFromDepartAndDate.mat');

%% split the data into three sets
% this will be only execute once;
[m,n]=size(X);
ii = randperm(m);
idx1 = 10000;
idx2 = idx1+5000;
idx3 = idx2+60000;
X_preTrain = X(ii(1:idx1),:);y_preTrain = y(ii(1:idx1),:);
X_preTest = X(ii(idx1+1:idx2),:);y_preTest = y(ii(idx1+1:idx2),:);
X_train = X(ii(idx2+1:idx3),:);y_train = y(ii(idx2+1:idx3),:);
X_test = X(ii(idx3+1:end),:);y_test = y(ii(idx3+1:end),:);

%% save
save('../data/FourFoldData.mat');
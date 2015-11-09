
% use random forrest 

%% split the data into three sets
[m,n]=size(X);
idx1 = floor(m/3);
idx2 = floor(2*m/3);
X_preTrain = X(1:idx1,:);y_preTrain = y(1:idx1,:);
X_train = X(idx1+1:idx2,:);y_train = X(idx1+1:idx2,:);
X_test = X(idx2+1:end,:);y_test = X(idx2+1:end,:);

%% run forrest fit
addpath decisionTrees;

[nexamples,nfeatures] = size(X_preTrain);
ntrees = 100;
randomFeatures = 2;
bagSize = 1/3;

tic;
for t = 1:ntrees

    perm = randperm(nexamples);
    ndx = perm(1:floor(bagSize*nexamples));
    Xtrain = X_preTrain(ndx,:);
    ytrain = y_preTrain(ndx,:);
    forest(t) = dtfit(Xtrain,ytrain,'randomFeatures',randomFeatures);

end
toc;
model = forest;
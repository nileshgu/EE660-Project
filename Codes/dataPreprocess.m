%% this file is for prepocessing the data

% read from excel
data = xlsread('train.csv');    % the missing data is filled with NAN

%% split the data into preTrain, Train, and Test
[m,n]=size(data);
idx = randperm(m);
data_PreTrain = data(idx(1:m*0.25),:);
data_Train = data(idx(m*0.25+1:m*0.75),:);
data_Data = data(idx(m*0.75+1:end),:);
save('rawData_preTrain.mat','data_PreTrain');

%% TODO: handle missing data
% assign a value for each NAN in "dataTrain" matrix

%% TODO: feature extraction
% e.g. calculate the average and std
% or directly use the matlab TS function

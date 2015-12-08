
% TODO: feature extraction
% e.g. calculate the average and std
% or directly use the matlab TS function

% load raw data
%load('../data/RawData.mat');
load('../data/testData.mat');

%% 
idx_type = 1;
idx_visit = 2;
idx_date= 3;
idx_upc = 4;
idx_scanNo = 5;
idx_depart = 6;
idx_inNo = 7;
NDepart = 70;

% only department
RawData = data;
[M,N] = size(RawData);
X = zeros(M,NDepart);
y = zeros(M,1);
visitNo = 0;
ii_visit=0;   % index for visit

for ii = 1:M
    if (RawData(ii,idx_visit) ~= visitNo)
        % add a new visit
        visitNo = RawData(ii,idx_visit);
        ii_visit = ii_visit+1;
        X(ii_visit,:) = zeros(1,NDepart);
        y(ii_visit) = RawData(ii,idx_type);
    end
    X(ii_visit,RawData(ii,idx_depart)) = X(ii_visit,RawData(ii,idx_depart)) + 1;
end
X(ii_visit+1:end,:)=[];
y(ii_visit+1:end,:)=[];


%% add time features

idx_type = 1;
idx_visit = 2;
idx_date= 3;
idx_upc = 4;
idx_scanNo = 5;
idx_depart = 6;
idx_inNo = 7;
NFeature = 77;

% only department
RawData = data;
[M,N] = size(RawData);
X = zeros(M,NFeature);
y = zeros(M,1);
visitNo = 0;
ii_visit=0;   % index for visit

for ii = 1:M
    if (RawData(ii,idx_visit) ~= visitNo)
        % add a new visit
        visitNo = RawData(ii,idx_visit);
        ii_visit = ii_visit+1;
        X(ii_visit,:) = zeros(1,NFeature);
        X(ii_visit,NDepart+RawData(ii,idx_date)) = 1;
        y(ii_visit) = RawData(ii,idx_type);
    end
    X(ii_visit,RawData(ii,idx_depart)) = X(ii_visit,RawData(ii,idx_depart)) + 1;
end
X(ii_visit+1:end,:)=[];
y(ii_visit+1:end,:)=[];
%save('../data/FeatureDataFromDepartAndDate.mat','X','y');
save('../data/test-1FeatureDataFromDepart.mat','X');


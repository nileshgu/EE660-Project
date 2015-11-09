
% TODO: feature extraction
% e.g. calculate the average and std
% or directly use the matlab TS function

% load raw data
load('../data/RawData.mat');

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
X_d = zeros(M,NDepart);
Y_d = zeros(M,1);
visitNo = 0;
ii_visit=0;   % index for visit

for ii = 1:M
    if (RawData(ii,idx_visit) ~= visitNo)
        % add a new visit
        visitNo = RawData(ii,idx_visit);
        ii_visit = ii_visit+1;
        X_d(ii_visit,:) = zeros(1,NDepart);
        Y_d(ii_visit) = RawData(ii,idx_type);
    end
    X_d(ii_visit,RawData(ii,idx_depart)) = X_d(ii_visit,RawData(ii,idx_depart)) + 1;
end

save('../data/FeatureDataFromDepart.mat','X_d','Y_d');
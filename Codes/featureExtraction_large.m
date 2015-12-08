
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
class_line=unique(data(:,end));
y = zeros(M,1);
visitNo = 0;
ii_visit=0;   % index for visit

I = zeros(M*100,1);
J = zeros(M*100,1);
S = zeros(M*100,1);

idx_i = 0;
for ii = 1:M
    idx_i = idx_i + 1;
    if (RawData(ii,idx_visit) ~= visitNo)
        % add a new visit
        visitNo = RawData(ii,idx_visit);
        ii_visit = ii_visit+1;
        X(ii_visit,:) = zeros(1,NDepart);
        y(ii_visit) = RawData(ii,idx_type);
    end
    idx_class = find(class_line == RawData(ii,idx_inNo),1);
    I(idx_i) = ii_visit;
    J(idx_i) = idx_class;
    S(idx_i) = 1;
end
I(idx_i+1:end,:)=[];
J(idx_i+1:end,:)=[];
S(idx_i+1:end,:)=[];
X=sparse(I,J,S,ii_visit,length(class_line));
y(ii_visit+1:end,:)=[];
save('../data/FeatureDataFromLine.mat','X','y');

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
save('../data/FeatureDataFromDepartAndDate.mat','X','y');


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


%% decomposit the department into X folds
[cc,ia,ic]=unique(data(:,end));
line_depart= [ cc data(ia,idx_depart)];
[ccc,iaa, icc]=unique(line_depart(:,2));

no_fold = 5;
line_feature = [];
featureID = 0;
for ii = 1:length(ccc)
    tmp = find(line_depart(:,2)==ccc(ii));
    n_lines = floor(length(tmp)/no_fold);
    tmp_idx = 1:n_lines:length(tmp);
    for jj = tmp_idx(1:end-1);
        featureID = featureID + 1;
        line_feature(end,:)=[line_depart(tmp(jj:jj+n_lines-1),1) featureID*ones(n_lines,1)];
    end
    line_feature(end,:)=[line_depart(tmp(tmp_idx(end-1)+1:end),1) featureID*ones(length(tmp(tmp_idx(end-1)+1:end)),1)];
end


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


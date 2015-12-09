%% 
% load raw data
load('../data/testData.mat');
%% decomposit the department into X folds
idx_type = 1;
idx_visit = 2;
idx_date= 3;
idx_upc = 4;
idx_scanNo = 5;
idx_depart = 6;
idx_inNo = 7;
NDepart = 70;

[cc,ia,ic]=unique(data(:,end));
line_depart= [ cc data(ia,idx_depart)];
[ccc,iaa, icc]=unique(line_depart(:,2));

no_fold = 5;
line_feature = [];
featureID = 0;
count = 0;
for ii = 1:length(ccc)
    tmp = find(line_depart(:,2)==ccc(ii));
    count = count + length(tmp);
    n_lines = floor(length(tmp)/no_fold);
    if (n_lines == 0);
        featureID = featureID + 1;
        line_feature=[line_feature;[line_depart(tmp,1) featureID*ones(length(tmp),1)]];
        continue;
    end
    
    tmp_idx = 1:n_lines:length(tmp);
    for jj = tmp_idx(1:end-1);
        featureID = featureID + 1;
        line_feature= [line_feature;[line_depart(tmp(jj:jj+n_lines-1),1) featureID*ones(n_lines,1)]];
    end
    jj1 = jj+n_lines;
    if (jj1 <= length(tmp))
        featureID = featureID + 1;
        line_feature=[line_feature;[line_depart(tmp(jj1:end),1) featureID*ones(length(tmp(jj1:end)),1)]];
    end
end

%% 

% only department
RawData = data;
[M,N] = size(RawData);
y = zeros(M,1);
visitNo = 0;
ii_visit=0;   % index for visit

I = zeros(M*100,1);
J = zeros(M*100,1);
S = zeros(M*100,1);
X=zeros(1e6,featureID+NDepart);
y=zeros(1e6,1);
idx_i = 0;
for ii = 1:M
    idx_i = idx_i + 1;
    if (RawData(ii,idx_visit) ~= visitNo)
        % add a new visit
        visitNo = RawData(ii,idx_visit);
        ii_visit = ii_visit+1;
%         X(ii_visit,:) = zeros(1,NDepart);
        y(ii_visit) = RawData(ii,idx_type);
    end
    idx_line = find(line_feature(:,1) == RawData(ii,idx_inNo),1);
    X(ii_visit,line_feature(idx_line,2)) = X(ii_visit,line_feature(idx_line,2)) + 1;
    X(ii_visit,featureID+RawData(ii,idx_depart)) = X(ii_visit,featureID+RawData(ii,idx_depart)) + 1;
%     I(idx_i) = ii_visit;
%     J(idx_i) = line_feature(idx_line,2);
%     S(idx_i) = 1;
end
% I(idx_i+1:end,:)=[];
% J(idx_i+1:end,:)=[];
% S(idx_i+1:end,:)=[];
% X=sparse(I,J,S,ii_visit,featureID);
% X=full(X);
X(ii_visit+1:end,:)=[];
y(ii_visit+1:end,:)=[];
idx_random = randperm(size(X,1),size(X,1));
X=X(idx_random,:);
y=y(idx_random);

save('../data/FeatureDataFromDepartDecompose_3.mat');
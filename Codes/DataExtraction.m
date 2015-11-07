%% this file is for prepocessing the data

% read from excel
[num,txt,raw] = xlsread('train-new.csv');
[m,n]=size(num);
for i=1:m

    if (strcmp(raw{i,3},'Monday'))
    raw{i,3}=1;
    end


    if (strcmp(raw{i,3},'Tuesday'))
    raw{i,3}=2;
    end

    if (strcmp(raw{i,3},'Wednesday'))
    raw{i,3}=3;
    end

    if (strcmp(raw{i,3},'Thursday'))
    raw{i,3}=4;
    end

    if (strcmp(raw{i,3},'Friday'))
    raw{i,3}=5;
    end

    if (strcmp(raw{i,3},'Saturday'))
    raw{i,3}=6;
    end

    if (strcmp(raw{i,3},'Sunday'))
    raw{i,3}=7;
    end
       
end

C=raw{1:m,1:3};

data=cell2mat(C);


        
    




%% TODO: feature extraction
% e.g. calculate the average and std
% or directly use the matlab TS function

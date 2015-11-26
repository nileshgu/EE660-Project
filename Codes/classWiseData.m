
%% load raw data
load('../data/FeatureDataFromDepartAndDate.mat');

%%
[p,q]=size(X);
answer=unique(y);
firstRow=zeros(1,q);
[M,N]=size(answer);


%%


for i=1:M
    a=zeros(1,q);
    for j=1:p
        if(y(j)==(answer(i)))
            
        a=[a;X(j,:)];
        
        end 
    end
    a(1,:)=[];
     assignin('base', sprintf('X%d', i), a);
end

for i=1:38
answer=strcat('X',int2str(i));
save('../data/ClassWiseData.mat','answer');
end





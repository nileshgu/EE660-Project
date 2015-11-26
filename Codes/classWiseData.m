
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


save('../data/ClassWiseData.mat','X1','X2','X3','X4','X5','X6','X7','X8','X9','X10','X11','X12','X13','X14','X15','X16','X17','X18','X19','X20','X21','X22','X23','X24','X25','X26','X27','X28','X29','X30','X31','X32','X33','X34','X35','X36','X37','X38');






clc;
close all;
clear all;

%% load raw data
load('../data/FeatureDataFromDepartAndDate.mat');
[p,q]=size(X);
load('../data/ClassWiseData.mat');
[p1,q1]=size(X1);

Xtrain=zeros(1,q1+1);
ypreTrain=zeros(1,1);

noTraining=70000;


 for i=1:38
     
     char=strcat('X',int2str(i));
     char1=strcat('y',int2str(i));
     answer=eval(char);
     answer11=eval(char1);
     answer1=[answer, answer11];
     [m,n]=size(answer1);
     idx(i)=(m/p);
     idz=idx(i)*noTraining;
     idz=floor(idz);
     random1=randperm(m,idz);
     new = answer1(random1(1:idz),:);
     [m1,n1]=size(new);
     
     Xtrain=[Xtrain;new];
 
     
end
 
 %%
 %X9 is very less, lesser than 40

 Xtrain(1,:)=[];

[row1, col1]=size(Xtrain);

X=[X,y];
XTest = setxor(X,Xtrain,'rows');
[row11,col11]=size(XTest);


XTest = XTest(randperm(row11),:);

Xtrain = Xtrain(randperm(row1),:);

XTr=Xtrain(:,(1:77));
yTr=Xtrain(:,78);


Xt=XTest(:,(1:77));
yt=XTest(:,78);

save('../Data/twoFoldData.mat','XTr','yTr','Xt','yt')%,'Xtest','ytest');






%save('../Data/shuffleData.mat','Xp','yp','Xtest','ytest')%,'Xtest','ytest');




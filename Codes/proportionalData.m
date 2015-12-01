clc;
close all;
clear all;

%% load raw data
load('../data/FeatureDataFromDepartAndDate.mat');
[p,q]=size(X);
load('../data/ClassWiseData.mat');
[p1,q1]=size(X1);
XpreTrain=zeros(1,q1+1);
Xpre=zeros(1,q1+1);
ypreTrain=zeros(1,1);
noData=9000;
noTraining=7000;


 for i=1:38
     
     char=strcat('X',int2str(i));
     char1=strcat('y',int2str(i));
     answer=eval(char);
     answer11=eval(char1);
     answer1=[answer, answer11];
     [m,n]=size(answer1);
     idx(i)=(m/p);
     idz=idx(i)*noData;
     idz=ceil(idz);
     random1=randperm(m,idz);
     new = answer1(random1(1:idz),:);
     [m1,n1]=size(new);
     idz1=idx(i)*noTraining;
     idz1=ceil(idz1);
     random1=randperm(m1,idz1);  
     new1 = new(random1(1:idz1),:);
     Xpre=[Xpre;new];
     XpreTrain=[XpreTrain;new1];
     
end
 
 %%
 %X9 is very less, lesser than 40
 XpreTrain(1,:)=[];
 Xpre(1,:)=[];
[row, col]=size(XpreTrain);


[row1, col1]=size(Xpre);


XpreTest = setxor(Xpre,XpreTrain,'rows');
[row11,col11]=size(XpreTest);


XpreTest = XpreTest(randperm(row11),:);
XpreTrain = XpreTrain(randperm(row),:);
Xpre = Xpre(randperm(row1),:);

XpreTr=XpreTrain(:,(1:77));
ypreTr=XpreTrain(:,78);


XpreTe=XpreTest(:,(1:77));
ypreTe=XpreTest(:,78);

save('../Data/proportionalData.mat','XpreTr','ypreTr','XpreTe','ypreTe')%,'Xtest','ytest');






%save('../Data/shuffleData.mat','Xp','yp','Xtest','ytest')%,'Xtest','ytest');




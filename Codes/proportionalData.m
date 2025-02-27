clc;
close all;
clear all;

%% load raw data
load('../data/FeatureDataFromDepartAndDate.mat');
[p,q]=size(X);
load('../data/ClassWiseData.mat');
[p1,q1]=size(X1);
X_train=zeros(1,q1+1);
y_train=zeros(1,1);
X_test = [];
noData=p;
noTraining=70000;
percentage = noTraining/noData;


 for i=1:38
     
     char=strcat('X',int2str(i));
     char1=strcat('y',int2str(i));
     answer=eval(char);
     answer11=eval(char1);
     answer1=[answer, answer11];
     [m,n]=size(answer1);
     no_type_i = floor(m*percentage);
     
     random1=randperm(m,no_type_i);
     new = answer1(random1,:);
     X_train = [X_train;new];  
     random_test = setxor(random1,1:m);     
     new_test = answer1(random_test,:);
     X_test = [X_test;new_test];
end
 
 %%
 %X9 is very less, lesser than 40
 X_train(1,:)=[];
 
 % shuffle
 X_train =  X_train(randperm(size(X_train,1)),:);
 
 y_train = X_train(:,end);
 X_train(:,end)=[];
 
 
 X_test =  X_test(randperm(size(X_test,1)),:);
 
 y_test = X_test(:,end);
 X_test(:,end)=[];
 
save('../Data/proportionalData.mat')%,'Xtest','ytest');





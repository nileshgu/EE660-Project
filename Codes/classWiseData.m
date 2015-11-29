clc;
close all;
clear all;

%% load raw data
load('../data/FeatureDataFromDepartAndDate.mat');

% X=[1 2 3;4 5 6;7 8 9;10 11 12; 13 14 15;16 17 18];
% y=[4;5;1;999;2;2];

%%
[p,q]=size(X);
% answer1=unique(y);
% firstRow=zeros(1,q);
% [M,N]=size(answer1);
% 
% 
% %%
% 
% 
% for i=1:M
%     a=zeros(1,q);
%     
%     for j=1:p
%         if(y(j)==(answer1(i)))
%         buf=y(j);   
%         a=[a;X(j,:)];
%         
%         end 
%     end
%     a(1,:)=[];
%     [r, s]=size(a);
%     
%     b=buf*ones(r,1);
%   
%      assignin('base', sprintf('X%d', i), a);
%      assignin('base', sprintf('y%d', i), b);
% end
% 
% 
% save('../data/ClassWiseData.mat','X1','X2','X3','X4','X5','X6','X7','X8','X9','X10','X11','X12','X13','X14','X15','X16','X17','X18','X19','X20','X21','X22','X23','X24','X25','X26','X27','X28','X29','X30','X31','X32','X33','X34','X35','X36','X37','X38','y1','y2','y3','y4','y5','y6','y7','y8','y9','y10','y11','y12','y13','y14','y15','y16','y17','y18','y19','y20','y21','y22','y23','y24','y25','y26','y27','y28','y29','y30','y31','y32','y33','y34','y35','y36','y37','y38');

load('../data/ClassWiseData.mat');
[p,q]=size(X1);
XpreTrain=zeros(1,q+1);
ypreTrain=zeros(1,1);
new=zeros(120,77);

 for i=1:38
     if(i ~=9)
     char=strcat('X',int2str(i));
     char1=strcat('y',int2str(i));
     answer=eval(char);
     answer11=eval(char1);
     answer1=[answer, answer11];
     [m,n]=size(answer1);
     random1=randperm(m,120);
     new = answer1(random1(1:120),:);
     [mnew,nnew]=size(new);
     XpreTrain=[XpreTrain;new];
     end
end
 
 %%
 %X9 is very less, lesser than 40

new1= X9((1:4),:);
new11=y9((1:4),:);
new=[new1, new11];
[mnew,nnew]=size(new);
XpreTrain=[XpreTrain;new];
XpreTrain(1,:)=[];

[row, col]=size(XpreTrain)
XpreTrain = XpreTrain(randperm(row),:);
Xp=XpreTrain((1:4000),(1:77));
yp=XpreTrain((1:4000),78);

Xtest=XpreTrain((4001:4444),(1:77));
ytest=XpreTrain((4001:4444),78);

% for i=1:38
%      if(i ~=9)
%      char=strcat('y',int2str(i));
%      answer1=eval(char);
% %      [m,n]=size(answer1);
% %      random1=randperm(m,40);
%      new11 = answer1((1:40),:);
%      [mnew,nnew]=size(new11);
%      ypreTrain=[ypreTrain;new11];
%      end
%      
% end
% [m,n]=size(y9);
% 
% new = y9((1:4),:);
% [mnew,nnew]=size(new);
% ypreTrain=[ypreTrain;new];
%      
%  
% XpreTrain(1,:)=[];
% ypreTrain(1,:)=[]; 
% 
% finalData=[XpreTrain,ypreTrain];
% [finalX, finalY]=size(finalData);
% finalData = finalData(randperm(finalX),:); %error here
% 
% X1=finalData(:,(1:77));
% y1=finalData(:,78);
% % Xtest=finalData((1001:1484),(1:77));
% % ytest=finalData((1001:1484),78);
save('../Data/shuffleData.mat','Xp','yp','Xtest','ytest')%,'Xtest','ytest');




% The main m file
clc; clear all; close all;

load('../Data/TwoFoldData.mat');

[row,col]=size(X_train);
nrow=(10/100)*row;
nrow=floor(nrow);
X_train=X_train(1:3000,:);
y_train=y_train(1:3000);
kernelParam=[0.001,0.05, 0.1, 0.5, 0.7, 1, 5, 10,50,100];
C=[0.001, 0.005 0.01, 0.05, 0.1, 0.5, 1, 2.5, 5, 10];
X_test=X_test(1:100,:);
y_test=y_test(1:100);
i=1;


% learning algorithm

%% performance evaluation 

        
[model, bestParam, mu, se] = svmFit(X_train, y_train, 'kernel', 'rbf','kernelParam', kernelParam, 'C',C);


 
%% yield the output and calculate the error
figure;
[CC,lambda]=meshgrid(log(C),log(kernelParam));
mesh(CC,lambda,reshape(mu,10,10));
xlabel('C');
ylabel('\lambda');
zlabel('mean error');

figure;
[CC,lambda]=meshgrid((C),(kernelParam));
mesh(CC,lambda,reshape(mu,10,10));
xlabel('C');
ylabel('\lambda');
zlabel('mean error');

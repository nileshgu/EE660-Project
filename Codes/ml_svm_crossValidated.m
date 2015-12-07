% The main m file
clc; clear all; close all;

load('../Data/TwoFoldData.mat');

[row,col]=size(X_train);
nrow=(10/100)*row;
nrow=floor(nrow);
X_train=X_train(1:1000,:);
y_train=y_train(1:1000);
kernelParam=[0.01 0.1 1 10];
C=[0.1 1 10 100];
X_test=X_test(1:100,:);
y_test=y_test(1:100);
i=1;


% learning algorithm

%% performance evaluation 

        
[model, bestParam, mu, se] = svmFit(X_train, y_train, 'kernel', 'rbf','kernelParam', [0.1, 0.5, 1, 5], 'C',logspace(-1,2,4));


%% yield the output and calculate the error
figure;
[CC lambda]=meshgrid(log(C),log(kernelParam));
mesh(CC,lambda,reshape(mu,length(CC),length(kernelParam)));
xlabel('C');
ylabel('\lambda');
zlabel('mean error');

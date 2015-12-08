% The main m file
clc; clear all; close all;

load('../Data/TwoFoldData.mat');

[row,col]=size(X_train);
nrow=(10/100)*row;
nrow=floor(nrow);
X_train=X_train(1:2000,:);
y_train=y_train(1:2000);
kernelParam=[0.1, 0.5, 1, 5];
C=logspace(-1,2,4);
X_test=X_test(1:100,:);
y_test=y_test(1:100);
i=1;


% learning algorithm

%% performance evaluation 

        
[model, bestParam, mu, se] = svmFit(X_train, y_train, 'kernel', 'rbf','kernelParam', kernelParam, 'C',C);


 %% 
 %Plot the SVM decision boundary and the +-1 margins
                % These are contours of the function values f:
                svmModel=model;
                plotContour(@(x)argout(2, @svmPredict, svmModel, x), ...
                    axis(), [0 0], '-k', 'linewidth', 1.5);

                [h,p,c] = plotContour(@(x)argout(2, @svmPredict, svmModel, x), ...
                    axis(), [-1 1], '--k', 'linewidth', 1);
                t = sprintf('C = %g',  Cvalues(i)); 
%%

%% yield the output and calculate the error
figure;
[CC,lambda]=meshgrid((C),log(kernelParam));
mesh(CC,lambda,reshape(mu,4,4));
xlabel('C');
ylabel('\lambda');
zlabel('mean error');

% evaluate the error for each class


load('../Data/svmModelFinalRandom.mat');

yhat_test =  svmPredict(model, X_test);

y_true = y_test;
classes = unique(y_true);
yhat = yhat_test;%classes(randi(38,length(y_test),1));
errorRates = zeros(1,length(classes));
for ii=1:length(classes)
    I = find(y_true == classes(ii));
    errs = y_true(I) ~= yhat(I);
    errorRates(ii) = sum(errs)/length(y_true(I));
end

load('../Data/svmModelNoParamProportional.mat');

yhat_test =  svmPredict(model, X_test);

y_true = y_test;
classes = unique(y_true);
yhat = yhat_test;%classes(randi(38,length(y_test),1));
errorRates_pro = zeros(1,length(classes));
for ii=1:length(classes)
    I = find(y_true == classes(ii));
    errs = y_true(I) ~= yhat(I);
    errorRates_pro(ii) = sum(errs)/length(y_true(I));
end


figure;
plot(1:38,errorRates,'bo-',1:38,errorRates_pro,'r*-');
legend('error rate w/ SVM model trained with randomly sampled data points','error rate w/ SVM model trained with proportionally sampled data points');
xlabel('class number');
ylabel('error rate');

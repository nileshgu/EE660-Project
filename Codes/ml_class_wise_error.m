% evaluate the error for each class


% [yhat_test, p_out] = logregPredict(model, X_test);
y_true = y_test;
classes = unique(y_true);
yhat = yhat_test;%classes(randi(38,length(y_test),1));
errorRates = zeros(1,length(classes));
for ii=1:length(classes)
    I = find(y_true == classes(ii));
    errs = y_true(I) ~= yhat(I);
    errorRates(ii) = sum(errs)/length(y_true(I));
end

yhat = classes(randi(38,length(y_test),1));
errorRates_rand = zeros(1,length(classes));
for ii=1:length(classes)
    I = find(y_true == classes(ii));
    errs = y_true(I) ~= yhat(I);
    errorRates_rand(ii) = sum(errs)/length(y_true(I));
end

figure;
plot(1:38,errorRates,'bo-',1:38,errorRates_rand,'r*-');
legend('error rate using SVM model','error rate using randomly assignment');
xlabel('class number');
ylabel('error rate');
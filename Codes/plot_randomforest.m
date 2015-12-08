errors=[ 10.11563  2.840454  2.182711  1.740675 1.584135];
mse=[ 0.4689388  0.4179256 0.4163719 0.4152518 0.4146796];
ntrees = [5 50 100 250 500];
figure;
plot(ntrees,mse,'o-');
xlabel('number of trees in random forest');
ylabel('mean loss error rate');

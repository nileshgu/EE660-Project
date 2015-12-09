errors=[ 10.11563  2.840454  2.182711  1.740675 1.584135];
mse=[ 0.4689388  0.4179256 0.4163719 0.4152518 0.4146796];
ntrees = [5 50 100 250 500];
figure;
semilogx(ntrees,mse,'o-');
xlabel('number of trees in random forest');
ylabel('mean loss error rate');
title('means loss vs. depth limitation of a tree (N_data = 70000,Max_depth = 100)');


% max depth
errors=[0.4847088 0.4595409 0.4602887  0.4597932  0.4607179];
depth=[25 50 100 200 400];
figure;
semilogx(depth,errors,'o-');
xlabel('depth limitation of a tree');
ylabel('mean loss error rate');
title('means loss vs. depth limitation of a tree (N_data = 10000,N_tree = 250)');
function err = lossEvalFcn(probs,y_true)
% evaluation of prediction
% y_true: the true class
% probs: a matrix, each row of which is the probability distribution
ySupport = [3,4,5,6,7,8,9,12,14,15,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,999];
[N,M]=size(probs);
assert(M==38);
assert(N==length(y_true));
probs = max(min(probs,1-1e-15),1e-15);
idx_mat = repmat(ySupport,N,1)-repmat(y_true,1,M);
idx_mat = idx_mat == 0;
err = -1/N*sum(sum(log(probs).*idx_mat));
fprintf('the evaluation value is : %f \n', err);

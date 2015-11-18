function err = lossEvalFcn(probs,y_true,ySupport)
% evaluation of prediction
[N,M]=size(probs);
probs = max(min(probs,1-1e-15),1e-15);
idx_mat = repmat(ySupport',N,1)-repmat(y_true,1,M);
idx_mat = idx_mat == 0;
err = -1/N*sum(sum(log(probs).*idx_mat));
fprintf('the evaluation value is : %f \n', err);

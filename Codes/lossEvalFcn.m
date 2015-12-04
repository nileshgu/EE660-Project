function err = lossEvalFcn(y_in,y_true)
% evaluation of prediction
% y_true: the true class
% probs: a matrix, each row of which is the probability distribution
ySupport = [3,4,5,6,7,8,9,12,14,15,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,999];
[N,M]=size(y_in);
if (M == 1) % which means the input probs is only a vector, 
            % and we need to convert it to a prob matrix
    y_in = convert_yhat_to_yprobs(y_in);
end
assert(N==length(y_true));
y_in = max(min(y_in,1-1e-15),1e-15);
idx_mat = repmat(ySupport,N,1)-repmat(y_true,1,length(ySupport));
idx_mat = idx_mat == 0;
err = -1/N*sum(sum(log(y_in).*idx_mat));
fprintf('the evaluation value is : %f \n', err);

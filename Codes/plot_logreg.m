% plot two sailent features
idx1 = 14;
idx2 = 21;
figure;
class3_index = find(y_train == 33);
class4_index = find(y_train == 37);
plot(X_train(class3_index,idx1),X_train(class3_index,idx2),'ro', X_train(class4_index,idx1),X_train(class4_index,idx2),'k*')

ml_class_wise_error;
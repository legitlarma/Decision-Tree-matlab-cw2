% Binary classifcation using SVM

%Split dataset into features and labels
load data_banknote_authentication.txt
X = data_banknote_authentication(:,1:4);
y = data_banknote_authentication(:,5);
% X = X{:,:};
% y = y{:,:};

y = double(y);
y(y==3) = 1;
y(y==2) = 0;

ctree = fitctree(X,y);
view(ctree,'mode','graph')
function [tree] = DecisionTreeLearning(features, labels)

% initialise struct
tree = struct("op", {}, "kids", {}, "prediction", {}, "attribute", {}, "threshold", {});
% check if the y values handed in are all the same
if checkPure(labels) == 1
    tree(1).prediction = labels(1);
else
data = [features, labels];

% select the attribute with the greatest information gain
bestFeat = findBestAttr(data); % this is a number relating to column
tree(1).attribute = bestFeat; %store the best feature
tree(1).op = getAttrName(bestFeat); %get the name of the attribute and enter it here

% find the split point of this feature
split = findSplit(data, bestFeat); % returns a matrix index of the sorted matrix
tree(1).threshold = attrThresh(features,bestFeat, split); %store the threshold we split at

% split the features and labels data set at the best split point
[L, R] = splitData(data, bestFeat, split);

% set the kids array to be two new sub trees
% leftBranch = DecisionTreeLearning(L(:,1:4), L(:, 5));
% rightBranch = DecisionTreeLearning(R(:,1:4), R(:, 5));
tree(1).kids = [DecisionTreeLearning(L(:,1:4),L(:, 5)), DecisionTreeLearning(R(:,1:4),R(:, 5))];
end
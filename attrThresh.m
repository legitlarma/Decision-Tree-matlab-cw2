function [z] = attrThresh(features, bestFeat, index)

sortedFeat = sortrows(features, bestFeat);
z = sortedFeat(index, bestFeat);


function [A,B] = splitData(XY,feature_num,thresh)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

XY_sorted= sortrows(XY,feature_num);
% split_index= find(XY_sorted(:,feature_num)==thresh);
split_index = thresh;
A= XY_sorted(1:split_index,:);
B= XY_sorted(split_index+1:end,:);
end

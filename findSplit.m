function [z, y] = findSplit(m, a)
% m = matrix of all data
% a = column of best attribute

% m2 is a matrix containing y and the chosen attribute
m2 = m(:, [a, end]);

% sort the matrix into ascending order based on x value
sortm = sortrows(m2);

% calculate the information gain at a split point between each value
% and store the current best split point
% if -1 is passed, we know something broke in this loop
bestInfoGain = -1;
splitPoint = -1;
largestPure = 0;

for i = 1:height(sortm)
    topM = sortm(1:i,:);
    bottomM = sortm((i+1):end,:);
% %   calculating the number of each y in parent
%     pEZero = sum(sortm(:,2) == 0)/height(sortm);
%     pEOne = sum(sortm(:,2) == 1)/height(sortm);
% %     Parent entropy
%     parentEntropy = -pEZero*log2(pEZero)-pEOne*log2(pEOne);
% %     calculating number of each y in children
    tEZero = sum(topM(:,2) == 0)/height(topM);
    tEOne = sum(topM(:,2) == 1)/height(topM);
%     zero case checking for log2(0) = undef
    if tEZero == 0
        tProb0 = 0;
    else
        tProb0=-tEZero*log2(tEZero);
    end
    if tEOne == 0
        tProb1 = 0;
    else
        tProb1=-tEOne*log2(tEOne);
    end

    topEntropy = tProb1+tProb0;

%     and the same for the bottom
    bEZero = sum(bottomM(:,2) == 0)/height(bottomM);
    bEOne = sum(bottomM(:,2) == 1)/height(bottomM);

    if bEZero == 0
        bProb0 = 0;
    else
        bProb0 = -bEZero*log2(bEZero);
    end
    if bEOne == 0;
        bProb1 = 0;
    else
        bProb1 = -(bEOne*log2(bEOne));
    end
    bottomEntropy = bProb0+bProb1;
%     calculating weighted entropy and information gain of this split
    weightEntropy = (height(topM)/height(sortm))*topEntropy+(height(bottomM)/height(sortm))*bottomEntropy;
    infoGain = 1-weightEntropy;

%     if information gain is greater than current best and no pures have
%     been found yet
    if infoGain > bestInfoGain
        if largestPure < 1
            bestInfoGain = infoGain;
            splitPoint = i;
        end
    end
% 
end
z = splitPoint;
y = bestInfoGain;
% splitpoint defines the number of matrix members going left (aka the
% number of matrix members in the top half)
% if bestInfoGain is 1, a matrix of only one y value has been found
end
function [z] = checkPure(m)
% take the y column
m2 = m(:,end);
% order the matrix
sortM = sortrows(m2);
% check if the first entry and last entry are the same
if sortM(end,:) == sortM(1,:)
    z = 1;
else
    z = 0;
end
% 1 returns when all y values of the given matrix are the same
% 0 returns when all y values of the given matrix are not the same

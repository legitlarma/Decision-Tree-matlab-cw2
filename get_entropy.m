function [entropy] = get_entropy(y,n)
    total = y+n;
    y = y/total;
    n = n/total;
    if y == 0; entropy = 0; return; end % no chance of positve outcome 
    if n == 0; entropy = 0; return; end % no chance of negative outcome waht is entropy?
    p = [y,n]; 
    entropy = -sum(p.*log2(p));
end
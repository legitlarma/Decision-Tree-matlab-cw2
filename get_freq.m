function [freq] = get_freq(x)
    a = tabulate(x);
    a(:,3) = [];
    freq = a';
end

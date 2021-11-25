
function [freq] = get_freq(x)
    binc = [min(x):1:max(x)];
    counts = hist(x,binc);
    freq = [binc; counts];
end

load Decision-Tree-matlab-cw2/data_banknote_authentication.txt

X = data_banknote_authentication(:,1:4);
y = data_banknote_authentication(:,5);


y = double(y);
y(y==3) = 1;
y(y==2) = 0;
z = X(:,1);
%max(z)

c = get_entropy(z);


function [freq] = get_freq(x)
    %disp(max(x))
    binc = [min(x):1:max(x)];
    counts = hist(x,binc);
    freq = [binc; counts];
end

function [probabilities] = get_prob(frequencies)
    sum_frequencies = sum(frequencies);
    arr = [];
    for i = 1:1:length(frequencies)
        probability = frequencies(i)/sum_frequencies;
        arr(end+1) = probability;
    end
    probabilities = arr;
end


function [entropy] = get_entropy(x)
    frequency = get_freq(x);
    frequency = frequency(2,:);
    probs = get_prob(frequency);
    entropy = -sum(probs.*log2(probs));
end

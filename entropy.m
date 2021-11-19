load Decision-Tree-matlab-cw2/data_banknote_authentication.txt

X = data_banknote_authentication(:,1:4);
y = data_banknote_authentication(:,5);

data = data_banknote_authentication;

y = double(y);
y(y==3) = 1;
y(y==2) = 0;
z = X(:,1);
%max(z)
frequencyi = get_freq(z);
frequency = frequencyi(2,:);
probs = get_prob(frequency);
c = get_entropy(probs);

%normalize data into categories kind of
z = round(data(:,1),1);




for i = 1:1:length(z)
    p = 0;
    n = 0;
    for j = 1:1:length(z)
        if z(i) == z(j)
            if y(j) == 1
                p = p + 1;
            else
                n = n + 1;
            end
        end
    end
end



function [freq] = get_freq(x)
    %disp(max(x))
    binc = [min(x):1:max(x)];
    counts = hist(x,binc);
    freq = [binc; counts];
end

function [probabilities] = get_prob(probability_frequencies)
    sum_frequencies = sum(probability_frequencies);
    arr = [];
    for i = 1:1:length(probability_frequencies)
        probability = probability_frequencies(i)/sum_frequencies;
        arr(end+1) = probability;
    end
    probabilities = arr;
end


function [entropy] = get_entropy(p)
    entropy = -sum(p.*log2(p));
end


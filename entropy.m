load Decision-Tree-matlab-cw2/data_banknote_authentication.txt

X = data_banknote_authentication(:,1:4);
y = data_banknote_authentication(:,5);


y = double(y);
y(y==3) = 1;
y(y==2) = 0;
z = X(:,1);
max(z)
c = get_entropy_one_attr(z);


function [freq] = get_freq(x)
    disp(max(x))
    binc = [min(x):0.1:max(x)];
    counts = hist(x,binc);
    freq = [binc; counts];
end


function [entropy] = get_entropy_one_attr(attribute)
    arr = [];
    freq = get_freq(attribute);
    arr_prob_i = [];
    for i = 1:1:length(freq(1,:))
        prob_i = freq(2,i)/length(attribute);
        v = prob_i*log2(prob_i);
        arr(end+1) = -v;
        arr_prob_i(end+1) = prob_i;
    end
    sum_prob_i = sum(arr_prob_i);
    disp(sum_prob_i)
    arr(find(isnan(arr)))=[];
    entropy = sum(arr);
end

function [entropy] = get_entropy_all_attr(attribute)
    
end

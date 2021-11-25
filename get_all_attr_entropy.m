function [all_attr_ents] = get_all_attr_entropy(data, feature_no)
    [rows, ~] = size(data);
    b = get_freq(data(:, feature_no));
    [~, b_col] = size(b);
    tot = 0;
    for i=1:1:b_col % columns of frequencies from feature 1
        p = 0;
        n = 0;
    
        for j=1:1:length(data(:,feature_no))
            if data(j,feature_no)==b(1,i)
                if data(j,5) == 1; p = p + 1; end
                if data(j,5) == 0; n = n + 1; end
            end
        end
        %here we have the postive(p) and negative(n) values for each category(b) in a
        %feature
        prob_p = p/rows; %gets the probability of p for all attributes
        tot = tot + prob_p *get_entropy(p,n);
    end
    all_attr_ents = tot;
end
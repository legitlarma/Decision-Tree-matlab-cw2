function [all_attr_ents] = get_all_attr_entropy(data, feature_no)
    [rows, column] = size(data);
    b = get_freq(data(:, feature_no));
    [~, b_col] = size(b);
    tot = 0;
    for i=1:1:b_col % columns of frequencies from feature 1
        p = sum(data(:,feature_no)==b(1,i) & data(:,column) == 1);
        n = sum(data(:,feature_no)==b(1,i) & data(:,column) == 0);
        %here we have the postive(p) and negative(n) values for each category(b) in a feature
        prob_p = p/rows; %gets the probability of p for all attributes
        tot = tot + prob_p *get_entropy(p,n);
    end
    all_attr_ents = tot;
end
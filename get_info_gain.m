function [info_gain] = get_info_gain(data, feature_number)
    remainder = get_all_attr_entropy(data, feature_number);
    total_entropy_of_labels = get_entropy(sum(data(:,5) == 1), sum(data(:,5) == 0));
    info_gain = total_entropy_of_labels - remainder;
end






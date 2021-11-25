
function [A, B] = load_classification_data()
    data_banknote_authentication = load("data_banknote_authentication.txt");
    data = data_banknote_authentication;
    
    %normalize data into categories by rounding all feature values
    [~, columns] = size(data);
    for i=1:1:columns
        z = round(data(:,i));
        data(:,i) = z;
    end
    data_new = data;
    A = data_new(:,1:(end-1));
    B = data_new(:, end);
end
function [z] = findBestAttr(data)
y = zeros(1, (width(data)-1));
for i = 1:(width(data)-1)
   entr = get_all_attr_entropy(data, i);
   y(i) = entr;
end
[~, I] = min(y);
z = I;
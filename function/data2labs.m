function labs = data2labs(data)

data = squeeze(data);

[row column] = size(data);

labs = zeros(1,column) + 1;

index = data(255,:) > data(1,:);
labs(index) = 255;

%{
for i = 1:column
    pos = find(max(data(:,i)) == data(:,i));
    labs(i) = pos(1);
end
%}

function re_im = createRectData_sub(line)

[row column] = size(line);

value = line(end,:);

len = sqrt(row);

re_im = zeros(len,len,column);

for i = 1:column
    subline = line(:,i);
    
    subimg = reshape(subline,len,len);

    re_im(:,:,i) = subimg - value(i);
end

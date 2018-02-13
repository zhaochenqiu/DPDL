function re_im = createData_plus(block_im,posr,posc,len)

line = block_im(posr - len:posr + len,posc - len:posc + len,:,:);

imsize = size(line);

radius = sqrt(imsize(1) * imsize(2) * imsize(4));

re_im = zeros(radius,radius,imsize(3));

% index = randperm(radius*radius);

for i = 1:imsize(3)
    temp = line(:,:,i,:);
%    temp = temp(index);

    re_im(:,:,i) = reshape(temp,[radius,radius]);
end


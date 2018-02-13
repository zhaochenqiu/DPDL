function re_imdb = getRPoTP(im_pa, im_ft, gt_pa, gt_ft, curindex, num, mode)

if nargin == 6
    mode = 'test';
end


[im_fs temp] = loadData_files(im_pa,im_ft);
[gt_fs temp] = loadData_files(gt_pa,gt_ft);



im = imread([im_pa '/' im_fs{1}]);

[row_im column_im byte_im] = size(im);



data = zeros(row_im,column_im,byte_im,num,'uint8');

count = 1;


labimg = double(imread([gt_pa '/' gt_fs{curindex}]));
curimg = double(imread([im_pa '/' im_fs{curindex}]));



index = round(linspace(1,curindex - 1,num));
% index = index(randperm(numel(index)));

for i = 1:max(size(index))
    fprintf(1, 'Reading file %d: %s\r', i, im_fs{index(i)});
    
    im = double(imread([im_pa '/' im_fs{index(i)}]));
%    im = im - curimg;
    
    data(:,:,:,count) = im;

    count = count + 1;
end

block_im = single(data);

len = 0;
block_im = padarray(block_im,[len,len],'symmetric');
curimg = padarray(curimg,[len,len],'symmetric');
labimg = padarray(labimg,[len,len],'symmetric');

clear data;



im = createData_test(block_im,round(row_im/2),round(column_im/2),len);

[row_t column_t byte_t] = size(im);
datarow = row_t;
datacolumn = column_t;
databyte = byte_t;


if strcmp(mode,'test') == 1
    templen = row_im*column_im;
    data = zeros(row_t,column_t,byte_t,row_im*column_im,'single');
    labs = zeros(1,row_im*column_im) + 1;
end

if strcmp(mode,'train') == 1
    templen = row_im*column_im;
    templen = round(templen/100 - 0.5)*100;

    data = zeros(row_t,column_t,byte_t,templen,'single');
    labs = zeros(1,templen) + 1;
end

count = 1;


[row_bl column_bl byte_bl frames_bl] = size(block_im);


[row_t column_t byte_t frames_t] = size(block_im);

for i = 1:frames_t
    block_im(:,:,:,i) = block_im(:,:,:,i) - curimg;
end


block_im = permute(block_im,[4 3 2 1]);

data = reshape(block_im,datarow,datacolumn,databyte,row_t*column_t);
labimg = labimg';
labs = reshape(labimg,1,row_t*column_t);


if strcmp(mode,'train') == 1
    index1 = labs == 0;
    labs(index1) = 1;
    index2 = labs == 255;
    tempindex = index1|index2;

    count = sum(tempindex);

    count = round(count/100 - 0.5)*100;

    data = data(:,:,:,tempindex);
    labs = labs(tempindex);


    data = data(:,:,:,1:count);
    labs = labs(1:count);

    index = single(randperm(count));
%    index = 1:count;

    data = data(:,:,:,index);
    labs = labs(index);
else
    index1 = labs == 0;
    labs(index1) = 1;

    index = single(randperm(row_im*column_im));
%    index = 1:row_im*column_im;

    data = data(:,:,:,index);
    labs = labs(index);
end


[row_t column_t byte_t frames_t] = size(data);

% meanvalue = mean(data,4);

for i = 1:frames_t
    tempindex = randperm(row_t*column_t);
    for j = 1:byte_t
        im = data(:,:,j,i);
        
        data(:,:,j,i) = reshape(im(tempindex),row_t,column_t);
        % - meanvalue(:,:,j);
    end
end

% data = sigmf(data,[1 0]);


line = 1:max(size(index));

matrix = [line' index'];
index = sortrows(matrix,2);
index = index(:,1);

templen = max(size(data));

re_imdb.images.data     = single(data);
re_imdb.images.labels   = single(labs);
re_imdb.images.imgsize  = [row_im column_im byte_im];
re_imdb.images.index    = index;
re_imdb.images.set      = zeros(1,templen,'single') + 1;
re_imdb.images.data_mean = mean(data,4);

re_imdb.meta.sets       = {'train' 'Val' 'test'};
re_imdb.meta.classes    = {'0' '1'};


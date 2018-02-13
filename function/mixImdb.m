function re_imdb = mixImdb(varargin )

num = 0;

imgsize_set = {};
index_set = {};


for i = 1:nargin
    imdb = varargin{i};

%    imgsize_set = {imgsize_set{:}, imdb.images.imgsize};
%    index_set = {index_set{:}, imdb.images.index};

    value = max(size(imdb.images.labels));

    num = num + value;
end

[row_im column_im byte_im frames_im] = size(imdb.images.data);

data = zeros(row_im,column_im,byte_im,num,'single');
labels = zeros(1,num,'single');

index = single(randperm(num));


count = 1;

for i = 1:nargin
    imdb = varargin{i};

    value = max(size(imdb.images.labels));

    left = count;
    right = count + value - 1;

    data(:,:,:,left:right) = imdb.images.data;
    labels(left:right) = imdb.images.labels;

    count = count + value;
end



re_imdb.images.data = data(:,:,:,index);


re_imdb.images.labels = labels(index);
%re_imdb.images.index_set = index_set;
%re_imdb.images.imgsize_set = imgsize_set;
re_imdb.images.index = index;

re_imdb.images.set      = zeros(1,num,'single') + 1;
re_imdb.images.data_mean = mean(data,4);

re_imdb.meta.sets       = {'train' 'Val' 'test'};
re_imdb.meta.classes    = {'0' '1'};


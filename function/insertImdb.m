function [re_fgimg re_trimg re_imdb] = mixImdb(varargin )

num = 0;

imgsize_set = {};
index_set = {};


for i = 1:nargin
    imdb = varargin{i};

    imgsize_set = {imgsize_set{:}, imdb.images.imgsize};
    index_set = {index_set{:}, imdb.images.index};

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


oldindex = index;


global g_net;
net = g_net;

batchsize = 1000;
data = data(:,:,:,index);
% data = imdb.images.data;
labs = labels;

detectlabs = abs(labs - labs);

len = max(size(labs));
num = round(len/batchsize - 0.5);

net = vl_simplenn_move(net, 'gpu') ;

for i = 1:num
    left = (i - 1)*batchsize + 1;
    right = i*batchsize;

    im = data(:,:,:,left:right);
    im = gpuArray(im);
    res = vl_simplenn_nosoft(net,im);

    resdata = gather(res(end - 1).x);
%    resdata = res(end - 1).x;

    reslb = data2labs(resdata);
    detectlabs(left:right) = reslb;
%    [i num]
end

im = data(:,:,:,right+1:end);
if min(size(im)) > 0
    im = gpuArray(im);
    res = vl_simplenn_nosoft(net,im);

    resdata = gather(res(end - 1).x);

    reslb = data2labs(resdata);
    detectlabs(right+1:end) = reslb;
end

re_imdb.images.labels = labs;

global g_labs g_detectlabs;
g_labs = labs;
g_detectlabs = detectlabs;

% 86400
line = 1:max(size(index));

matrix = [line' index'];
index = sortrows(matrix,2);
index = index(:,1);

finlabs = detectlabs(index);

finlabs = finlabs(1:86400);


trlabs = labs(1:86400);
imdb1 = varargin{1};
tempindex = imdb1.images.index;
trlabs = trlabs(tempindex);

finlabs = finlabs(tempindex);


re_fgimg = reshape(finlabs,360,240);
re_trimg = reshape(trlabs,360,240);

re_fgimg = re_fgimg';
re_trimg = re_trimg';

function [re_fgimg re_trimg]= getFgImg(net,imdb,batchsize)

if nargin == 2
    batchsize =4000;
end


data = imdb.images.data;
labs = imdb.images.labels;

detectlabs = abs(labs - labs);

len = max(size(labs));
num = round(len/batchsize - 0.5);

net = vl_simplenn_move(net, 'gpu') ;
opts.mode = 'test';
for i = 1:num
    left = (i - 1)*batchsize + 1;
    right = i*batchsize;

    im = data(:,:,:,left:right);
    im = gpuArray(im);

%    res = vl_simplenn_nosoft(net,im,[],[],opts);
    res = vl_simplenn_nosoft(net,im,[],[],opts);

    resdata = gather(res(end - 1).x);
%    resdata = res(end - 1).x;

    reslb = data2labs_plus(resdata);
    detectlabs(left:right) = reslb;
%    [i num]
end



im = data(:,:,:,right+1:end);
if min(size(im)) > 0
    im = gpuArray(im);
    res = vl_simplenn_nosoft(net,im);

    resdata = gather(res(end - 1).x);

    reslb = data2labs_plus(resdata);
    detectlabs(right+1:end) = reslb;
end

global g_labs g_detectlabs;
g_labs = labs;
g_detectlabs = detectlabs;



index = imdb.images.index;


row_img = imdb.images.imgsize(1);
column_img = imdb.images.imgsize(2);


labs = labs(index);
detectlabs = detectlabs(index);


resimg = reshape(detectlabs,column_img,row_img);
srcimg = reshape(labs,column_img,row_img);


index = resimg == 1;
resimg(index) = 0;

index = srcimg == 1;
srcimg(index) = 0;


re_fgimg = resimg';
re_trimg = srcimg';

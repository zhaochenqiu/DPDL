clear all
close all
clc


run('D:\tools\matconvnet-1.0-beta24_old\matlab\vl_setupnn');
addpath('D:\projects\MatLab\imageprocessing\common');

rng('default');



imdb    = load('imdb_9_9_3_1001_rand.mat');
net     = load('./data/mnist-bnorm/net-epoch-60.mat');
% net     = load('./data/mnist-bnorm/old/9_9/net-epoch-20.mat');

imdb    = imdb.imdb;
net     = net.net;

% net.meta.trainOpts.batchSize = 100 ;
% net.meta.trainOpts.batchSize = 100 ;

data = imdb.images.data;
labs = imdb.images.labels;
labindex = imdb.images.index;

detectlabs = abs(labs - labs);

im = data(:,:,:,1:100);
lb = labs(1:100);


res = vl_simplenn(net,im);


resimg = squeeze(res(end - 1).x);
reslb = data2labs(resimg);


[row column] = size(labs);

batchsize = 100;

num = column/batchsize;


for i = 1:num
    left = (i - 1)*batchsize + 1;
    right = i*batchsize;

    im = data(:,:,:,left:right);
    res = vl_simplenn(net,im);

    reslb = data2labs(res(end - 1).x);
    detectlabs(left:right) = reslb;
    [i num]
end


len = max(size(labs));

line = 1:1:len;
temp = [labindex line'];
temp = sortrows(temp,1);
tempindex = temp(:,2);

detectlabs = detectlabs(tempindex);
labs = labs(tempindex);

resimg = reshape(detectlabs,320,240);
srcimg = reshape(labs,320,240);


index = resimg == 255;
resimg(index) = 255;
index = ~index;
resimg(index) = 0;


index = srcimg == 1;
srcimg(index) = 0;


global g_displayMatrixImage;
g_displayMatrixImage = 1;


figure
displayMatrixImage(1,1,2,resimg,srcimg,abs(resimg - srcimg))

[TP FP FN TN] = evalution_entry(resimg,srcimg);

Re = TP/(TP + FN);
Pr = TP / (TP + FP);
Fm = (2*Pr*Re)/(Pr + Re);

[Re Pr Fm]


clear all
close all
clc


run('D:\tools\matconvnet-1.0-beta24_old\matlab\vl_setupnn');
addpath('D:\projects\MatLab\imageprocessing\common');
addpath('./function/');

rng('default');



% imdb    = load('imdb_9_9_3_1041_rand_busStation.mat');
% imdb    = load('imdb_9_9_3_1401_rand.mat')
% imdb    = load('imdb_9_9_3_981_rand_pedestrains.mat');
% imdb    = load('imdb_9_9_3_111_rand_highway2.mat');
% imdb    = load('./function/imdb_9_3_982_pets2006.mat');
% imdb    = load('./function/imdb_9_3_982_highway.mat');
% imdb    = load('./function/imdb_9_3_982_pets2006.mat');
% imdb    = load('./function/imdb_9_3_1482_highway.mat');
% imdb    = load('./function/imdb_9_3_982_pets2006.mat');


% imdb    = load('./function/imdb_9_3_982_highway.mat');
% imdb    = load('./function/imdb_9_3_1482_highway.mat');




% imdb = load('./function/imdb_9_3_982_highway.mat');
% imdb = load('./function/imdb_9_3_482_pedestrians.mat');
% imdb = load('./function/imdb_9_3_1482_office.mat');
% imdb = load('./function/imdb_9_3_582_pets2006.mat');




% imdb = load('./function/imdb_9_3_1482_highway.mat');
% imdb = load('./function/imdb_9_3_1482_pedestrians.mat');
% imdb = load('./function/imdb_9_3_482_office.mat');
% imdb = load('./function/imdb_9_3_982_pets2006.mat');




net     = load('./data/mnist-bnorm/net-epoch-164.mat');
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

num = round(column/batchsize);

net = vl_simplenn_move(net, 'gpu') ;


tic
for i = 1:num
    left = (i - 1)*batchsize + 1;
    right = i*batchsize;

    im = data(:,:,:,left:right);
    im = gpuArray(im);
    res = vl_simplenn_nosoft(net,im);

    resdata = gather(res(end - 1).x);

    reslb = data2labs(resdata);
    detectlabs(left:right) = reslb;
    [i num]
end
time = toc;
time

index = imdb.images.index;


row_img = imdb.images.imgsize(1);
column_img = imdb.images.imgsize(2);


labs = labs(index);
detectlabs = detectlabs(index);


resimg = reshape(detectlabs,column_img,row_img);
srcimg = reshape(labs,column_img,row_img);


index = resimg == 1;
resimg(index) = 0;
% index = ~index;
% resimg(index) = 255;


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


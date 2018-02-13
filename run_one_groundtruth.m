clear all
close all
clc


run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')

addpath('/data/projects/matrix/common/');
addpath('./function/')

addpath('./old/');

rng(0)


im_pa = '/data/dataset/dataset2014/dataset/baseline/highway/input/';
im_ft = 'jpg';


gt_pa = '/data/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_ft = 'png';



global g_gpuidx;
g_gpuidx = struct('gpus', [1]);

global g_epoch;
g_epoch = 40;

global g_batchSize;
g_batchSize = 1000;

global g_initNum;
g_initNum = 32;


global g_size_block;
g_size_block = 9;


train_frame = 1640;

net_pa = sprintf('../net_highway/net-epoch-%i.mat', g_epoch);

imdb = getRPoTP(im_pa, im_ft, gt_pa, gt_ft, train_frame, 81, 'train');

bgs_train(imdb,'../net_highway');

net = load(net_pa);
net = net.net;



[fn ffn] = loadFiles_plus(im_pa,im_ft);

maxnum = max(size(ffn));

global g_displayMatrixImage;
g_displayMatrixImage = 1;

figure
for i = 470:maxnum
    if i ~= train_frame
        imdb = getRPoTP(im_pa, im_ft, gt_pa, gt_ft, i, 81, 'test');

        im = double(imread(ffn{i}));

        [fgim gtim] = getFgImg(net, imdb);
        displayMatrixImage(i,1,3,im,fgim,gtim)
    end
end





% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name          : DPDL                                                                          %%
% Author        : Zhao, Chenqiu                                                                 %%
% Email         : zhaochenqiu@gmail.com                                                         %%
% Description   : The implementation of paper                                                   %%
%                    "BACKGROUND SUBTRACTION BASED ON DEEP PIXEL DISTRIBUTION LEARNING",        %%
%                    submitted to ICME 2018                                                     %%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

% the path of the matconvnet
run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')

addpath('./common/')
addpath('./function/')

addpath('./old/');

rng(0)



% the path of image sequence
% im_pa = '/data/dataset/dataset2014/dataset/baseline/highway/input/';
im_pa = './data/highway/input/';
im_ft = 'jpg';


% gt_pa = '/data/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_pa = './data/highway/groundtruth/';
gt_ft = 'png';



% the paramters of network, for more information, please check bgs_network_init.m
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



net_pa = sprintf('../net_highway/net-epoch-%i.mat', g_epoch);


num_trainframes = 40;
% num_trainframes = 20;

pos_fg = getFgPeakFrames(gt_pa, gt_ft, num_trainframes/2, 2);
pos_sq = getSqFrames(    gt_pa, gt_ft, num_trainframes/2);

imdb = getListRPoTP(im_pa, im_ft, gt_pa, gt_ft, [pos_fg; pos_sq], 81, 'train');

% training procedure
bgs_train(imdb,'../net_highway');

net = load(net_pa);
net = net.net;

[fn ffn] = loadFiles_plus(im_pa,im_ft);

maxnum = max(size(ffn));

global g_displayMatrixImage;
g_displayMatrixImage = 1;


full_list = [pos_fg ; pos_sq];

% testing procedure
figure
for i = 470:maxnum
    % separate the training frames and testing frames
    if sum(full_list == i) == 0
        imdb = getRPoTP(im_pa, im_ft, gt_pa, gt_ft, i, 81, 'test');

        im = double(imread(ffn{i}));

        [fgim gtim] = getFgImg(net, imdb);
        displayMatrixImage(i,1,3,im,fgim,gtim)
    end
end





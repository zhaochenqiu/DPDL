
clc
clear 
close all
pause(30600)

run('~/tools/matconvnet-1.0-beta24/matlab/vl_setupnn.m');
addpath('~/projects/imageprocessing/common');
addpath('./function/');
rng(0)

video_result = [];


frames_train_sq = 10;
frames_train_fg = 10;
frames_train_bk = 0;

len_block = 15;
rag_block = 0;
size_block = len_block^2;
frames_border = 10;
peak_border = 50;


global g_block g_epoch g_learningRate;
g_block = len_block;
g_epoch = 20;
g_learningRate = 0.001;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% D:\dataset\dataset\shadow\bungalows\input

videos = 'badWeather/wetSnow'

im_pa = ['~/dataset/dataset2014/' videos '/input'];
im_ft = 'jpg';

tr_pa =  ['~/dataset/dataset2014/' videos '/groundtruth'];
tr_ft = 'png';

sv_pa =  ['~/dataset/bgs_cnn/' videos '/'];



bgs_cnn_entry_self;

video_result = [video_result; Re Pr Fm];


video_result







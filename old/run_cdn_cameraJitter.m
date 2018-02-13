
run('~/tools/matconvnet-1.0-beta24/matlab/vl_setupnn.m');
addpath('~/projects/imageprocessing/common');
addpath('./function/');
rng(0)

video_result = [];


frames_train_sq = 20;
frames_train_fg = 20;
frames_train_bk = 0;

len_block = 9;
rag_block = 0;
size_block = len_block^2;
frames_border = 10;
peak_border = 2;


global g_block g_epoch g_learningRate;
g_block = len_block;
g_epoch = 40;
g_learningRate = 0.001;

global g_batchSize;
g_batchSize = 1000;


global g_gpuindex
g_gpuindex = 1;

global g_initnetwidth;
g_initnetwidth = 32;




videos =  'cameraJitter/badminton';
run_entry
videos =  'cameraJitter/boulevard';
run_entry
videos =  'cameraJitter/sidewalk';
run_entry
videos =  'cameraJitter/traffic';
run_entry








videos
video_result



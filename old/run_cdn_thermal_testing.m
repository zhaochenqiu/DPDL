
run('~/tools/matconvnet-1.0-beta24/matlab/vl_setupnn.m');
addpath('~/projects/imageprocessing/common');
addpath('./function/');
rng(0)

video_result = [];
video_names = {};

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






videos =  'thermal/corridor';
run_entry_testing_notrain
videos =  'thermal/diningRoom';
run_entry_testing_notrain
videos =  'thermal/lakeSide';
run_entry_testing_notrain
videos =  'thermal/library';
run_entry_testing_notrain
videos =  'thermal/park';
run_entry_testing_notrain




videos
video_result

txtWrite(video_result,'all_result.txt');

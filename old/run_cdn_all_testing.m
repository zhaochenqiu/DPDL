
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

% 这个代码只有测试部分，没有训练，所以没有网回报错
% 之前给你的结果（那个表格），就是frames_border = 10的结果，间隔了10帧
% 结果虽然又代表性，但不是真正的结果。所以现在要让frames_border - 1
% frames_border = 10;
frames_border = 1;
peak_border = 2;


global g_block g_epoch g_learningRate;
g_block = len_block;
g_epoch = 40;
g_learningRate = 0.001;

% ------------------------------------------------------------------------------------------------------------------------ 
% ------------------------------------------------------------------------------------------------------------------------  华丽的分割线
% ------------------------------------------------------------------------------------------------------------------------ 
% ------------------------------------------------------------------------------------------------------------------------ 


videos =  'baseline/highway';
run_entry_testing_notrain
videos =  'baseline/office';
run_entry_testing_notrain
videos =  'baseline/pedestrians';
run_entry_testing_notrain
videos =  'baseline/PETS2006';
run_entry_testing_notrain






% ------------------------------------------------------------------------------------------------------------------------ 
% ------------------------------------------------------------------------------------------------------------------------  华丽的分割线
% ------------------------------------------------------------------------------------------------------------------------ 
% ------------------------------------------------------------------------------------------------------------------------ 


video_names{:}
video_result

txtWrite(video_result,'all_result_baseline.txt');

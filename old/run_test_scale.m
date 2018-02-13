clear all
close all
clc


addpath('d:\projects\Matlab\imageprocessing\common');
addpath('./function/');

rng(0)

video_result = [];


frames_train = 10;
frames_train_fg = 16;
frames_train_bk = 4;



maxdis = 320;
len_block = 9;
rag_block = 0;
size_block = len_block^2;
frames_border = 100;
peak_border = 20;

%{
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

im_pa = 'D:\dataset\dataset\thermal\corridor\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\thermal\corridor\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\thermal\corridor\';

bgs_cnn_entry;


video_result = [video_result; Re Pr Fm];



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

im_pa = 'D:\dataset\dataset\thermal\diningRoom\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\thermal\diningRoom\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\thermal\diningRoom\';

bgs_cnn_entry;


video_result = [video_result; Re Pr Fm];



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

im_pa = 'D:\dataset\dataset\thermal\lakeSide\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\thermal\lakeSide\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\thermal\lakeSide\';

bgs_cnn_entry;


video_result = [video_result; Re Pr Fm];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

im_pa = 'D:\dataset\dataset\thermal\library\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\thermal\library\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\thermal\library\';

bgs_cnn_entry;


video_result = [video_result; Re Pr Fm];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

im_pa = 'D:\dataset\dataset\thermal\park\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\thermal\park\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\thermal\park\';

bgs_cnn_entry;


video_result = [video_result; Re Pr Fm];



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

im_pa = 'D:\dataset\dataset\dynamicBackground\fall\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\dynamicBackground\fall\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\dynamicBackground\fall\';

bgs_cnn_entry;


video_result = [video_result; Re Pr Fm];

%}



im_pa = 'D:\dataset\dataset\cameraJitter\boulevard\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\cameraJitter\boulevard\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\cameraJitter\boulevard\';

bgs_cnn_entry;


video_result = [video_result; Re Pr Fm];



video_result
load handel
sound(y,Fs)


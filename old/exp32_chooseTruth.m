

addpath('d:\projects\Matlab\imageprocessing\common');
addpath('./function/');

rng(0)

video_result = [];


frames_train = 5;
len_block = 9;
rag_block = 0;
size_block = len_block^2;
frames_border = 10;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

im_pa = 'D:\dataset\dataset\baseline\highway\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\highway\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\baseline\highway\';



bgs_cnn_entry;

video_result = [video_result; Re Pr Fm];



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im_pa = 'D:\dataset\dataset\baseline\office\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\office\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\baseline\office\';


bgs_cnn_entry;


video_result = [video_result; Re Pr Fm];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im_pa = 'D:\dataset\dataset\baseline\pedestrians\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\pedestrians\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\baseline\pedestrians\';


bgs_cnn_entry;


video_result = [video_result; Re Pr Fm];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im_pa = 'D:\dataset\dataset\baseline\PETS2006\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\PETS2006\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\baseline\PETS2006\';



bgs_cnn_entry;


video_result = [video_result; Re Pr Fm];

video_result
load handel
sound(y,Fs)








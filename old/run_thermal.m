

addpath('d:\projects\Matlab\imageprocessing\common');
addpath('./function/');

rng(0)

video_result = [];


frames_train = 2;
len_block = 9;
rag_block = 0;
size_block = len_block^2;
frames_border = 100;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% D:\dataset\dataset\shadow\bungalows\input

im_pa = 'D:\dataset\dataset\shadow\bungalows\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\shadow\bungalows\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\shadow\bungalows\';



bgs_cnn_entry_test;

video_result = [video_result; Re Pr Fm];


%{
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
im_pa = 'D:\dataset\dataset\park\library\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\park\library\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\park\library\';



bgs_cnn_entry;


video_result = [video_result; Re Pr Fm];


%}












video_result
load handel
sound(y,Fs)








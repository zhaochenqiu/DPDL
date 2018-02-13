

addpath('d:\projects\Matlab\imageprocessing\common');
addpath('./function/');

rng(0)

video_result = [];


frames_train = 2;
frames_train_fg = 2;
frames_train_bk = 2;

len_block = 9;
rag_block = 0;
size_block = len_block^2;
frames_border = 50;
peak_border = 200;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im_pa = 'D:\dataset\dataset\baseline\highway\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\highway\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\baseline\highway\';


bgs_cnn_entry_balance_train;
bgs_cnn_entry_balance_test;


video_result = [video_result; Re Pr Fm];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


im_pa = 'D:\dataset\dataset\dynamicBackground\canoe\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\dynamicBackground\canoe\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\dynamicBackground\canoe\';

bgs_cnn_entry_balance_train;
bgs_cnn_entry_balance_test;


video_result = [video_result; Re Pr Fm];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


im_pa = 'D:\dataset\dataset\dynamicBackground\fountain01\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\dynamicBackground\fountain01\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\dynamicBackground\fountain01\';

bgs_cnn_entry_balance_train;
bgs_cnn_entry_balance_test;


video_result = [video_result; Re Pr Fm];





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

im_pa = 'D:\dataset\dataset\cameraJitter\sidewalk\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\cameraJitter\sidewalk\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\cameraJitter\sidewalk\';

bgs_cnn_entry_balance_train;
bgs_cnn_entry_balance_test;


video_result = [video_result; Re Pr Fm];



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

im_pa = 'D:\dataset\dataset\cameraJitter\boulevard\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\cameraJitter\boulevard\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\cameraJitter\boulevard\';

bgs_cnn_entry_balance_train;
bgs_cnn_entry_balance_test;


video_result = [video_result; Re Pr Fm];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

im_pa = 'D:\dataset\dataset\shadow\bungalows\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\shadow\bungalows\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\shadow\bungalows\';

bgs_cnn_entry_balance_train;
bgs_cnn_entry_balance_test;


video_result = [video_result; Re Pr Fm];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

im_pa = 'D:\dataset\dataset\shadow\backdoor\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\shadow\backdoor\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\shadow\backdoor\';

bgs_cnn_entry_balance_train;
bgs_cnn_entry_balance_test;


video_result = [video_result; Re Pr Fm];



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

im_pa = 'D:\dataset\dataset\intermittentObjectMotion\parking\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\intermittentObjectMotion\parking\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\intermittentObjectMotion\parking\';

bgs_cnn_entry_balance_train;
bgs_cnn_entry_balance_test;


video_result = [video_result; Re Pr Fm];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

im_pa = 'D:\dataset\dataset\intermittentObjectMotion\tramstop\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\intermittentObjectMotion\tramstop\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\intermittentObjectMotion\tramstop\';

bgs_cnn_entry_balance_train;
bgs_cnn_entry_balance_test;


video_result = [video_result; Re Pr Fm];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

im_pa = 'D:\dataset\dataset\intermittentObjectMotion\winterDriveway\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\intermittentObjectMotion\winterDriveway\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\intermittentObjectMotion\winterDriveway\';

bgs_cnn_entry_balance_train;
bgs_cnn_entry_balance_test;


video_result = [video_result; Re Pr Fm];




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im_pa = 'D:\dataset\dataset\badWeather\snowFall\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\badWeather\snowFall\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\badWeather\snowFall\';


bgs_cnn_entry_balance_train;
bgs_cnn_entry_balance_test;


video_result = [video_result; Re Pr Fm];



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im_pa = 'D:\dataset\dataset\badWeather\wetSnow\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\badWeather\wetSnow\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\badWeather\wetSnow\';


bgs_cnn_entry_balance_train;
bgs_cnn_entry_balance_test;


video_result = [video_result; Re Pr Fm];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im_pa = 'D:\dataset\dataset\thermal\park\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\thermal\park\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\thermal\park\';


bgs_cnn_entry_balance_train;
bgs_cnn_entry_balance_test;


video_result = [video_result; Re Pr Fm];




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im_pa = 'D:\dataset\dataset\thermal\corridor\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\thermal\corridor\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\thermal\corridor\';


bgs_cnn_entry_balance_train;
bgs_cnn_entry_balance_test;


video_result = [video_result; Re Pr Fm];





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im_pa = 'D:\dataset\dataset\nightVideos\winterStreet\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\nightVideos\winterStreet\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\nightVideos\winterStreet\';


bgs_cnn_entry_balance_train;
bgs_cnn_entry_balance_test;


video_result = [video_result; Re Pr Fm];







video_result
load handel
sound(y,Fs)








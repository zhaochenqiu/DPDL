clear all
close all
clc


addpath('D:\projects\MatLab\imageprocessing\common');
addpath('./function/');

run('D:\tools\matconvnet-1.0-beta24\matlab\vl_setupnn')

rng('default');

%{
im_pa = 'D:\dataset\SBMIDataset\SBMIDataset\Board\input';
im_ft = 'png';

tr_pa = 'D:\dataset\SBMIDataset\SBMIDataset\Board\groundtruth';
tr_ft = 'png';

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[101,110],1);
save('./data/imdb_9_3_110_Board_test.mat','imdb','-v7.3');
clear imdb;


im_pa = 'D:\dataset\SBMIDataset\SBMIDataset\CAVIAR1\input';
im_ft = 'png';

tr_pa = 'D:\dataset\SBMIDataset\SBMIDataset\CAVIAR1\groundtruth';
tr_ft = 'png';

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[101,110],1);
save('./data/imdb_9_3_110_CAUIAR1_test.mat','imdb','-v7.3');
clear imdb;
%}

im_pa = 'D:\dataset\SBMIDataset\SBMIDataset\CAVIAR2\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\SBMIDataset\SBMIDataset\CAVIAR2\groundtruth';
tr_ft = 'png';

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[101,110],1);
save('./data/imdb_9_3_110_CAUIAR2_test.mat','imdb','-v7.3');
clear imdb;




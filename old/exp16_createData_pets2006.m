clear all
close all
clc


addpath('D:\projects\MatLab\imageprocessing\common');
addpath('./function/');

run('D:\tools\matconvnet-1.0-beta24\matlab\vl_setupnn')

rng('default');




%{
clear all;

im_pa = 'D:\dataset\dataset\baseline\PETS2006\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\PETS2006\groundtruth';
tr_ft = 'png';


index_left = 901;
index_right = 981;

tempfun;

save imdb_9_9_3_981_rand_pets2006.mat imdb;
%}

%{
clear all;

im_pa = 'D:\dataset\dataset\shadow\busStation\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\shadow\busStation\groundtruth';
tr_ft = 'png';


index_left = 901;
index_right = 981;

tempfun;

save imdb_9_9_3_981_rand_busStation.mat imdb;
%}


%{
clear all;

im_pa = 'D:\dataset\dataset\shadow\busStation\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\shadow\busStation\groundtruth';
tr_ft = 'png';


index_left = 961;
index_right = 1041;

tempfun;

save imdb_9_9_3_1041_rand_busStation.mat imdb;

%}


clear all;

im_pa = 'D:\dataset\dataset\shadow\busStation\input';
im_pa = 'D:\dataset\SBMIDataset\SBMIDataset\HighwayII\input';
im_ft = 'png';

tr_pa = 'D:\dataset\dataset\shadow\busStation\groundtruth';
tr_pa = 'D:\dataset\SBMIDataset\SBMIDataset\HighwayII\groundtruth';

tr_ft = 'png';


index_left = 31;
index_right = 111;

tempfun;

save imdb_9_9_3_111_rand_highway2.mat imdb;



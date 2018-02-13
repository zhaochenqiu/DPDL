clear all
close all
clc


addpath('D:\projects\MatLab\imageprocessing\common');
addpath('./function/');

run('D:\tools\matconvnet-1.0-beta24\matlab\vl_setupnn')

rng('default');


im_pa = 'D:\dataset\dataset\baseline\highway\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\highway\groundtruth';
tr_ft = 'png';


%{

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[501,510],1,'train');
save('./data/imdb_9_3_510_highway_train.mat','imdb','-v7.3');
clear imdb;


imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[701,710],1,'train');
save('./data/imdb_9_3_710_highway_train.mat','imdb','-v7.3');
clear imdb;



imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[901,910],1,'train');
save('./data/imdb_9_3_910_highway_train.mat','imdb','-v7.3');
clear imdb;



imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1101,1110],1,'train');
save('./data/imdb_9_3_1110_highway_train.mat','imdb','-v7.3');
clear imdb;


imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1301,1310],1,'train');
save('./data/imdb_9_3_1310_highway_train.mat','imdb','-v7.3');
clear imdb;


imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1601,1610],1,'train');
save('./data/imdb_9_3_1610_highway_train.mat','imdb','-v7.3');
clear imdb;
%}


%{

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[501,537],1,'train');
save('./data/imdb_18_3_537_highway_train.mat','imdb','-v7.3');
clear imdb;


imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[701,737],1,'train');
save('./data/imdb_18_3_737_highway_train.mat','imdb','-v7.3');
clear imdb;


imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[901,937],1,'train');
save('./data/imdb_18_3_937_highway_train.mat','imdb','-v7.3');
clear imdb;


imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1101,1137],1,'train');
save('./data/imdb_18_3_1137_highway_train.mat','imdb','-v7.3');
clear imdb;


imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1301,1337],1,'train');
save('./data/imdb_18_3_1337_highway_train.mat','imdb','-v7.3');
clear imdb;


imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1601,1637],1,'train');
save('./data/imdb_18_3_1637_highway_train.mat','imdb','-v7.3');
clear imdb;
%}


%{
imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[501,526],1,'train');
save('./data/imdb_15_3_526_highway_train.mat','imdb','-v7.3');
imdb1 = imdb;

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[701,726],1,'train');
save('./data/imdb_15_3_726_highway_train.mat','imdb','-v7.3');
imdb2 = imdb;

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[901,926],1,'train');
save('./data/imdb_15_3_926_highway_train.mat','imdb','-v7.3');
imdb3 = imdb;

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1101,1126],1,'train');
save('./data/imdb_15_3_1126_highway_train.mat','imdb','-v7.3');
imdb4 = imdb;

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1301,1326],1,'train');
save('./data/imdb_15_3_1326_highway_train.mat','imdb','-v7.3');
imdb5 = imdb;

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1601,1626],1,'train');
save('./data/imdb_15_3_1626_highway_train.mat','imdb','-v7.3');
imdb6 = imdb;


imdb = mixImdb(imdb1,imdb2,imdb3,imdb4,imdb5,imdb6);
save('./data/imdb_15_3_all_highway_train.mat','imdb');
%}

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[501,517],1,'train');
save('./data/imdb_12_3_517_highway_train.mat','imdb','-v7.3');
imdb1 = imdb;

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[701,717],1,'train');
save('./data/imdb_12_3_717_highway_train.mat','imdb','-v7.3');
imdb2 = imdb;

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[901,917],1,'train');
save('./data/imdb_12_3_917_highway_train.mat','imdb','-v7.3');
imdb3 = imdb;

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1101,1117],1,'train');
save('./data/imdb_12_3_1117_highway_train.mat','imdb','-v7.3');
imdb4 = imdb;

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1301,1317],1,'train');
save('./data/imdb_12_3_1317_highway_train.mat','imdb','-v7.3');
imdb5 = imdb;

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1601,1617],1,'train');
save('./data/imdb_12_3_1617_highway_train.mat','imdb','-v7.3');
imdb6 = imdb;


imdb = mixImdb(imdb1,imdb2,imdb3,imdb4,imdb5,imdb6);
save('./data/imdb_12_3_all_highway_train.mat','imdb');


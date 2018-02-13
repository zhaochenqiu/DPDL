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

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[901,910],1,'train');
save('./data/imdb_9_3_910_highway_train.mat','imdb','-v7.3');
clear imdb;


im_pa = 'D:\dataset\dataset\baseline\highway\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\highway\groundtruth';
tr_ft = 'png';

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1401,1410],1);
save('./data/imdb_9_3_1410_highway_test.mat','imdb','-v7.3');
clear imdb;





im_pa = 'D:\dataset\dataset\baseline\PETS2006\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\PETS2006\groundtruth';
tr_ft = 'png';

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[501,510],1,'train');
save('./data/imdb_9_3_510_pets2006_train.mat','imdb','-v7.3');
clear imdb;


im_pa = 'D:\dataset\dataset\baseline\PETS2006\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\PETS2006\groundtruth';
tr_ft = 'png';

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[901,910],1);
save('./data/imdb_9_3_910_pets2006_test.mat','imdb','-v7.3');
clear imdb;




im_pa = 'D:\dataset\dataset\baseline\pedestrians\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\pedestrians\groundtruth';
tr_ft = 'png';

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[401,410],1,'train');
save('./data/imdb_9_3_410_pedestrians_train.mat','imdb','-v7.3');
clear imdb;


im_pa = 'D:\dataset\dataset\baseline\pedestrians\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\pedestrians\groundtruth';
tr_ft = 'png';

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[901,910],1);
save('./data/imdb_9_3_910_pedestrians_test.mat','imdb','-v7.3');
clear imdb;






im_pa = 'D:\dataset\dataset\baseline\office\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\office\groundtruth';
tr_ft = 'png';

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1401,1410],1,'train');
save('./data/imdb_9_3_1410_office_train.mat','imdb','-v7.3');
clear imdb;


im_pa = 'D:\dataset\dataset\baseline\office\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\office\groundtruth';
tr_ft = 'png';

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[901,910],1);
save('./data/imdb_9_3_910_office_test.mat','imdb','-v7.3');
clear imdb;

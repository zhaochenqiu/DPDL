clear all
close all
clc


addpath('D:\projects\MatLab\imageprocessing\common');
addpath('./function/');

run('D:\tools\matconvnet-1.0-beta24\matlab\vl_setupnn')

rng('default');


%{
im_pa = 'D:\dataset\dataset\baseline\highway\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\highway\groundtruth';
tr_ft = 'png';

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[901,937],1,'train');
save('./data/imdb_27_3_982_highway_train.mat','imdb','-v7.3');
clear imdb;


im_pa = 'D:\dataset\dataset\baseline\highway\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\highway\groundtruth';
tr_ft = 'png';

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1401,1437],1);
save('./data/imdb_27_3_1482_highway_test.mat','imdb','-v7.3');
clear imdb;

%}




im_pa = 'D:\dataset\dataset\baseline\PETS2006\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\PETS2006\groundtruth';
tr_ft = 'png';

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[501,537],1,'train');
save('./data/imdb_18_3_582_pets2006_train.mat','imdb','-v7.3');
clear imdb;


im_pa = 'D:\dataset\dataset\baseline\PETS2006\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\PETS2006\groundtruth';
tr_ft = 'png';

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[901,937],1);
save('./data/imdb_18_3_982_pets2006_test.mat','imdb','-v7.3');
clear imdb;



%{

im_pa = 'D:\dataset\dataset\baseline\pedestrians\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\pedestrians\groundtruth';
tr_ft = 'png';

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[401,482],1,'train');
save('./data/imdb_27_3_482_pedestrians_train.mat','imdb','-v7.3');
clear imdb;


im_pa = 'D:\dataset\dataset\baseline\pedestrians\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\pedestrians\groundtruth';
tr_ft = 'png';

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[901,982],1);
save('./data/imdb_27_3_982_pedestrians_test.mat','imdb','-v7.3');
clear imdb;






im_pa = 'D:\dataset\dataset\baseline\office\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\office\groundtruth';
tr_ft = 'png';

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1401,1482],1,'train');
save('./data/imdb_27_3_1482_office_train.mat','imdb','-v7.3');
clear imdb;


im_pa = 'D:\dataset\dataset\baseline\office\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\office\groundtruth';
tr_ft = 'png';

imdb = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[901,982],1);
save('./data/imdb_27_3_982_office_test.mat','imdb','-v7.3');
clear imdb;
%}

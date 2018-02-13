clear all
close all
clc

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

tic
% imdb = getImdb_fast(im_pa,im_ft,tr_pa,tr_ft,800,81,0);
imdb = getImdb_test(im_pa,im_ft,tr_pa,tr_ft,800,81,0);

time1 = toc;


tic
net = load('./net/test/net-epoch-20.mat');
net = net.net;
time2 = toc;


tic
[fgimg trimg] = getFgImg(net,imdb);
time3 = toc;


[TP FP FN TN] = evalution_entry(fgimg,trimg);


Re = TP/(TP + FN);
Pr = TP / (TP + FP);
Fm = (2*Pr*Re)/(Pr + Re);
Fm
% 0.9210
% 0.9311

%     0.9311

[time1 time2 time3]

global g_displayMatrixImage;
g_displayMatrixImage = 1;

figure
displayMatrixImage(1,1,2,fgimg,trimg)





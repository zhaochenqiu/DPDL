clear all
close all
clc


addpath('D:\projects\MatLab\imageprocessing\common');
addpath('./function/');

run('D:\tools\matconvnet-1.0-beta24\matlab\vl_setupnn')

rng('default');


global g_displayMatrixImage;
g_displayMatrixImage = 1;



%net     = load('./data/mnist-bnorm/net-epoch-20.mat');
net     = load('./net/higway_9_9_nonei/net-epoch-20.mat');
net     = net.net;


result_set = [];
result_entry = [];

im_pa = 'D:\dataset\dataset\baseline\highway\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\highway\groundtruth';
tr_ft = 'png';


list = 418:1:1618;



for i = 1:max(size(list))

    pos = list(i);
    imdb    = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[pos + 1,pos + 82],0);
    [fgimg trimg] = getFgImg(net,imdb);

    [TP FP FN TN] = evalution_entry(fgimg,trimg);


    Re = TP/(TP + FN);
    Pr = TP / (TP + FP);
    Fm = (2*Pr*Re)/(Pr + Re);

    result_entry = [result_entry ; TP FP FN TN];
    result_set = [result_set ; Re Pr Fm];

    displayMatrixImage(pos,1,2,fgimg,trimg)

    clear imdb;
end

entry = sum(result_entry,1);
TP = entry(1);
FP = entry(2);
FN = entry(3);
TN = entry(4);


Re = TP/(TP + FN);
Pr = TP / (TP + FP);
Fm = (2*Pr*Re)/(Pr + Re);

[Re Pr Fm]






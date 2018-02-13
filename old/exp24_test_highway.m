clear all
close all
clc


addpath('D:\projects\MatLab\imageprocessing\common');
addpath('./function/');

run('D:\tools\matconvnet-1.0-beta24\matlab\vl_setupnn')

rng('default');


global g_displayMatrixImage;
g_displayMatrixImage = 1;



net     = load('./data/mnist-bnorm/net-epoch-10.mat');
net     = net.net;


result_set = [];


im_pa = 'D:\dataset\dataset\baseline\highway\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\highway\groundtruth';
tr_ft = 'png';


for i = 5:16
    tic
    imdb    = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[i*100 + 1,i * 100 + 10],1);
    [fgimg trimg] = getFgImg(net,imdb);
    time = toc;
    time

    [TP FP FN TN] = evalution_entry(fgimg,trimg);

    Re = TP/(TP + FN);
    Pr = TP / (TP + FP);
    Fm = (2*Pr*Re)/(Pr + Re);

    [Re Pr Fm]
    result_set = [result_set ; Re Pr Fm];

    displayMatrixImage(i*100 + 10,1,2,fgimg,trimg)

end



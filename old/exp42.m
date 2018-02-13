clear all
close all
clc


addpath('D:\projects\MatLab\imageprocessing\common');
addpath('./function/');

run('D:\tools\matconvnet-1.0-beta24\matlab\vl_setupnn')

rng('default');



mode = 'train';

im_pa = 'D:\dataset\dataset\baseline\highway\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\highway\groundtruth';
tr_ft = 'png';

im_pa = 'D:\dataset\dataset\shadow\bungalows\input';

tr_pa = 'D:\dataset\dataset\shadow\bungalows\groundtruth';




tic

imdb1 = getImdb_test(im_pa,im_ft,tr_pa,tr_ft, 600,81,0,mode);
imdb2 = getImdb_test(im_pa,im_ft,tr_pa,tr_ft, 360,81,0,mode);
% imdb3 = getImdb_test(im_pa,im_ft,tr_pa,tr_ft, 800,81,0,mode);
%imdb4 = getImdb_test(im_pa,im_ft,tr_pa,tr_ft, 1000,81,0,mode);
%imdb5 = getImdb_test(im_pa,im_ft,tr_pa,tr_ft, 300,81,0,mode);
%imdb4 = getImdb_test(im_pa,im_ft,tr_pa,tr_ft, 360,81,0,mode);



% imdb1 = getImdb(im_pa,im_ft,tr_pa,tr_ft, 800,81,0,mode);
% imdb2 = getImdb(im_pa,im_ft,tr_pa,tr_ft, 900,81,0,mode);
% imdb3 = getImdb(im_pa,im_ft,tr_pa,tr_ft,1000,81,0,mode);
% imdb4 = getImdb(im_pa,im_ft,tr_pa,tr_ft,1100,81,0,mode);




time = toc;

% imdb = mixImdb(imdb1,imdb2,imdb3,imdb4,imdb5);
imdb = mixImdb(imdb1,imdb2);

% save('./data/imdb_test_train.mat','imdb');
path_save = 'net/test_14'

cnn_bgs_experiments(imdb,path_save);

net     = load(['./' path_save '/' 'net-epoch-20.mat']);
net     = net.net;


% 
mode = 'test';
% imdb1 = getImdb_test(im_pa,im_ft,tr_pa,tr_ft, 400,81,0,mode);
% imdb2 = getImdb_test(im_pa,im_ft,tr_pa,tr_ft, 600,81,0,mode);
% imdb3 = getImdb_test(im_pa,im_ft,tr_pa,tr_ft, 800,81,0,mode);
%imdb4 = getImdb_test(im_pa,im_ft,tr_pa,tr_ft, 1000,81,0,mode);


% imdb1 = getImdb_sub(im_pa,im_ft,tr_pa,tr_ft, 360,81,0,mode);
% imdb2 = getImdb_sub(im_pa,im_ft,tr_pa,tr_ft, 600,81,0,mode);

imdb1 = getImdb_test(im_pa,im_ft,tr_pa,tr_ft, 360,81,0,mode);
imdb2 = getImdb_test(im_pa,im_ft,tr_pa,tr_ft, 600,81,0,mode);




% imdb5 = getImdb_test(im_pa,im_ft,tr_pa,tr_ft, 300,81,0,mode);


[fgimg1 trimg1] = getFgImg(net,imdb1);
[fgimg2 trimg2] = getFgImg(net,imdb2);
%[fgimg3 trimg3] = getFgImg(net,imdb3);
%[fgimg4 trimg4] = getFgImg(net,imdb4);
%[fgimg5 trimg5] = getFgImg(net,imdb5);

displayMatrixImage(1,2,2, fgimg1, fgimg2, ...
                          trimg1, trimg2);








input('pause in the')






displayMatrixImage(1,1,2,fgimg,trimg)





imdb1 = getImdb_test(im_pa,im_ft,tr_pa,tr_ft, 800,81,0);


% input('sdfsdf')

result_entry = [];
result_set = [];

list = 300:50:1700;

for i = 1:max(size(list))

    pos = list(i);
    imdb    = getImdb_test(im_pa,im_ft,tr_pa,tr_ft,pos,81,0);

    [fgimg trimg] = getFgImg(net,imdb);

    [TP FP FN TN] = evalution_entry(fgimg,trimg);


    Re = TP/(TP + FN);
    Pr = TP / (TP + FP);
    Fm = (2*Pr*Re)/(Pr + Re);

    result_entry = [result_entry ; TP FP FN TN];
    result_set = [result_set ; Re Pr Fm];

%    filename = im_fs{pos};
%    filename = changeFileFormat(filename,'png');

%    saveImage(fgimg, sv_pa, filename);

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

Fm
%     0.7827

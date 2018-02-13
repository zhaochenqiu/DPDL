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

tic

imdb1 = getImdb_test(im_pa,im_ft,tr_pa,tr_ft, 800,81,0,mode);
imdb2 = getImdb_test(im_pa,im_ft,tr_pa,tr_ft, 900,81,0,mode);
imdb3 = getImdb_test(im_pa,im_ft,tr_pa,tr_ft,1000,81,0,mode);
imdb4 = getImdb_test(im_pa,im_ft,tr_pa,tr_ft,1100,81,0,mode);


% imdb1 = getImdb(im_pa,im_ft,tr_pa,tr_ft, 800,81,0,mode);
% imdb2 = getImdb(im_pa,im_ft,tr_pa,tr_ft, 900,81,0,mode);
% imdb3 = getImdb(im_pa,im_ft,tr_pa,tr_ft,1000,81,0,mode);
% imdb4 = getImdb(im_pa,im_ft,tr_pa,tr_ft,1100,81,0,mode);




time = toc;

imdb = mixImdb(imdb1,imdb2,imdb3,imdb4);

% save('./data/imdb_test_train.mat','imdb');
path_save = 'net/test_5'

cnn_bgs_experiments(imdb,path_save);

net     = load(['./' path_save '/' 'net-epoch-60.mat']);
net     = net.net;


imdb1 = getImdb_test(im_pa,im_ft,tr_pa,tr_ft, 800,81,0);

[fgimg trimg] = getFgImg(net,imdb1);
displayMatrixImage(1,1,2,fgimg,trimg)


% input('sdfsdf')

result_entry = [];
result_set = [];

list = 550:10:1400;

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

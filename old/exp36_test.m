clear all
close all
clc


addpath('D:\projects\MatLab\imageprocessing\common');
addpath('./function/');

run('D:\tools\matconvnet-1.0-beta24_old\matlab\vl_setupnn')

rng('default');


global g_displayMatrixImage;
g_displayMatrixImage = 1;



im_pa = 'D:\dataset\dataset\shadow\peopleInShade\input';
im_pa = 'D:\dataset\dataset\thermal\park\input';
im_pa = 'D:\dataset\dataset\intermittentObjectMotion\winterDriveway\input';

im_pa = 'D:\dataset\dataset\cameraJitter\boulevard\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\shadow\peopleInShade\groundtruth';
tr_pa = 'D:\dataset\dataset\thermal\park\groundtruth';
tr_pa = 'D:\dataset\dataset\intermittentObjectMotion\winterDriveway\groundtruth';

tr_pa = 'D:\dataset\dataset\cameraJitter\boulevard\groundtruth';
tr_ft = 'png';



% net     = load('./net/park/net-epoch-20.mat');
% net     = load('./net/winterDriveway/net-epoch-10.mat');
% net     = load('./net/boulevard_10/net-epoch-5.mat');
% net     = load('./net/boulevard_test_10frames_9/net-epoch-20.mat');
net     = load('./net/boulevard_8_test/net-epoch-10.mat');
net     = net.net;


list = 790:100:2500;

maxdis = 300;
index = [790,900,950,1000,1160,1220,1262,1460,1500,1900,1980,2310];
len = 0;
num = 81;
mode = 'train';


result_set = [];
result_entry = [];

for i = 1:max(size(list))

    pos = list(i);
%    imdb    = getImdb(im_pa,im_ft,tr_pa,tr_ft,pos,81,0);
    imdb = getImdb_plus(im_pa,im_ft,tr_pa,tr_ft,maxdis,pos,num,len);

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

load handel
sound(y,Fs)

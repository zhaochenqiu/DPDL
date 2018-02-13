clear all
close all
clc


addpath('D:\projects\MatLab\imageprocessing\common');
addpath('./function/');

run('D:\tools\matconvnet-1.0-beta24_old\matlab\vl_setupnn')

rng('default');


global g_displayMatrixImage;
g_displayMatrixImage = 1;

%{

% net     = load('./net/bridgeEntry/net-epoch-5.mat');
net     = load('./net/bridgeEntry/net-epoch-20.mat');
net     = net.net;


result_set = [];
result_entry = [];

im_pa = 'D:\dataset\dataset\nightVideos\bridgeEntry\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\nightVideos\bridgeEntry\groundtruth';
tr_ft = 'png';


list = 1000:100:1700;

for i = 1:max(size(list))

    pos = list(i);
    imdb    = getImdb(im_pa,im_ft,tr_pa,tr_ft,pos,81,0);

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




% net     = load('./net/bridgeEntry/net-epoch-5.mat');
net     = load('./net/boulevard/net-epoch-8.mat');
net     = load('./net/boulevard/net-epoch-20.mat');
net     = net.net;


result_set = [];
result_entry = [];

im_pa = 'D:\dataset\dataset\nightVideos\bridgeEntry\input';
im_pa = 'D:\dataset\dataset\cameraJitter\boulevard\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\nightVideos\bridgeEntry\groundtruth';
tr_pa = 'D:\dataset\dataset\cameraJitter\boulevard\groundtruth';
tr_ft = 'png';


list = 800:100:2500;

for i = 1:max(size(list))

    pos = list(i);
    imdb    = getImdb(im_pa,im_ft,tr_pa,tr_ft,pos,9,1);

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




im_pa = 'D:\dataset\dataset\shadow\peopleInShade\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\shadow\peopleInShade\groundtruth';
tr_ft = 'png';


net     = load('./net/peopleInShade/net-epoch-20.mat');
net     = net.net;


list = 250:100:1150;


result_set = [];
result_entry = [];

for i = 1:max(size(list))

    pos = list(i);
    imdb    = getImdb(im_pa,im_ft,tr_pa,tr_ft,pos,81,0);

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



im_pa = 'D:\dataset\dataset\cameraJitter\boulevard\input';
im_pa = 'D:\dataset\dataset\shadow\peopleInShade\input';
im_pa = 'D:\dataset\dataset\thermal\park\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\cameraJitter\boulevard\groundtruth';
tr_pa = 'D:\dataset\dataset\shadow\peopleInShade\groundtruth';
tr_pa = 'D:\dataset\dataset\thermal\park\groundtruth';
tr_ft = 'png';



net     = load('./net/park/net-epoch-20.mat');
net     = net.net;


list = 250:100:600;


result_set = [];
result_entry = [];

for i = 1:max(size(list))

    pos = list(i);
    imdb    = getImdb(im_pa,im_ft,tr_pa,tr_ft,pos,81,0);

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


%}




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
net     = load('./net/boulevard_15/net-epoch-20.mat');
net     = net.net;


list = 790:10:2500;


result_set = [];
result_entry = [];

for i = 1:max(size(list))

    pos = list(i);
    imdb    = getImdb(im_pa,im_ft,tr_pa,tr_ft,pos,225,0);

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

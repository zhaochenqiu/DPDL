clear all
close all
clc


addpath('D:\projects\MatLab\imageprocessing\common');
addpath('./function/');

run('D:\tools\matconvnet-1.0-beta24\matlab\vl_setupnn')

rng('default');


global g_displayMatrixImage;
g_displayMatrixImage = 1;



net     = load('./data/mnist-bnorm/net-epoch-200.mat');
net     = net.net;

%{
result_set = [];


im_pa = 'D:\dataset\dataset\baseline\pets2006\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\pets2006\groundtruth';
tr_ft = 'png';


for i = 3:11
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

%}


%{
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

%}

%{

result_set = [];


im_pa = 'D:\dataset\dataset\baseline\office\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\office\groundtruth';
tr_ft = 'png';


for i = 6:20
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

%}


%{
result_set = [];
result_entry = [];

im_pa = 'D:\dataset\dataset\baseline\pedestrians\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\pedestrians\groundtruth';
tr_ft = 'png';


for i = 3:10
    tic
    imdb    = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[i*100 + 1,i * 100 + 10],1);
    [fgimg trimg] = getFgImg(net,imdb);
    time = toc;
    time

    [TP FP FN TN] = evalution_entry(fgimg,trimg);


    Re = TP/(TP + FN);
    Pr = TP / (TP + FP);
    Fm = (2*Pr*Re)/(Pr + Re);

    result_entry = [result_entry ; TP FP FN TN];
    result_set = [result_set ; Re Pr Fm];

    displayMatrixImage(i*100 + 10,1,2,fgimg,trimg)

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







result_set = [];
result_entry = [];

im_pa = 'D:\dataset\dataset\baseline\pets2006\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\pets2006\groundtruth';
tr_ft = 'png';


for i = 3:11
    tic
    imdb    = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[i*100 + 1,i * 100 + 10],1);
    [fgimg trimg] = getFgImg(net,imdb);
    time = toc;
    time

    [TP FP FN TN] = evalution_entry(fgimg,trimg);


    Re = TP/(TP + FN);
    Pr = TP / (TP + FP);
    Fm = (2*Pr*Re)/(Pr + Re);

    result_entry = [result_entry ; TP FP FN TN];
    result_set = [result_set ; Re Pr Fm];

    displayMatrixImage(i*100 + 10,1,2,fgimg,trimg)

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







result_set = [];
result_entry = [];

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

    result_entry = [result_entry ; TP FP FN TN];
    result_set = [result_set ; Re Pr Fm];

    displayMatrixImage(i*100 + 10,1,2,fgimg,trimg)

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






result_set = [];
result_entry = [];

im_pa = 'D:\dataset\dataset\baseline\office\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\office\groundtruth';
tr_ft = 'png';


for i = 6:20
    tic
    imdb    = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[i*100 + 1,i * 100 + 10],1);
    [fgimg trimg] = getFgImg(net,imdb);
    time = toc;
    time

    [TP FP FN TN] = evalution_entry(fgimg,trimg);


    Re = TP/(TP + FN);
    Pr = TP / (TP + FP);
    Fm = (2*Pr*Re)/(Pr + Re);

    result_entry = [result_entry ; TP FP FN TN];
    result_set = [result_set ; Re Pr Fm];

    displayMatrixImage(i*100 + 10,1,2,fgimg,trimg)

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



result_set = [];
result_entry = [];

im_pa = 'D:\dataset\dataset\baseline\highway\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\highway\groundtruth';
tr_ft = 'png';


for i = 10:32
    tic
    imdb    = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[i*50 + 41,i * 50 + 50],1);
    [fgimg trimg] = getFgImg(net,imdb);
    time = toc;
    time

    [TP FP FN TN] = evalution_entry(fgimg,trimg);


    Re = TP/(TP + FN);
    Pr = TP / (TP + FP);
    Fm = (2*Pr*Re)/(Pr + Re);

    result_entry = [result_entry ; TP FP FN TN];
    result_set = [result_set ; Re Pr Fm];

    displayMatrixImage(i*100 + 10,1,2,fgimg,trimg)

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






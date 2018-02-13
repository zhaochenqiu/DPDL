addpath('D:\projects\MatLab\imageprocessing\common');
addpath('./function/');
run('D:\tools\matconvnet-1.0-beta24\matlab\vl_setupnn')



im_pa = 'D:\dataset\dataset\dynamicBackground\boats\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\dynamicBackground\boats\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\dynamicBackground\boats\';

[im_fs temp] = loadData_files(im_pa,im_ft);
[tr_fs temp] = loadData_files(tr_pa,tr_ft);




% net     = load('D:\projects\MatLab\imageprocessing\bgs_cnn\net_isse\fountain01_9\net-epoch-20.mat');
% net     = load('./net/dynamicBackground/fountain01_9/net-epoch-60.mat');
% net     = load('./net/dynamicBackground/fountain01_9/net-epoch-20.mat');
% net     = load('./net_isse/bungalows_9/net-epoch-20.mat');
net     = load('./net/dynamicBackground/boats_9/net-epoch-20.mat');
net     = net.net;

global g_net;
g_net = net;



% trainimdb = load('./data/dynamicBackground_fountain01_9.mat');
% trainimdb = load('./data/dynamicBackground_fountain01_9.mat');
trainimdb = load('./data/dynamicBackground_boats_9.mat');
trainimdb = trainimdb.imdb;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[fgimdb bkimdb] = divideFgBkImdb(trainimdb);


tranvalue = sum(sum(sum(mean(trainimdb.images.data,4))));
result_entry = [];
result_set = [];
result_sub = [];


list = 1900:100:7900;
%tranvalue = 707;
% tranvalue = -174;

for i = 1:max(size(list))

    pos = list(i);
    imdb    = getImdb_test(im_pa,im_ft,tr_pa,tr_ft,pos,81,0);

    bkimdb
    [fgimg trimg re_imdb] = getFgImg_bal(net,imdb,fgimdb,bkimdb,tranvalue);
    value = sum(sum(sum(mean(re_imdb.images.data,4))));
    result_sub = [result_sub ; value - tranvalue];


    fgimg(fgimg == 1) = 0;
    trimg(trimg == 1) = 0;



    [TP FP FN TN] = evalution_entry(fgimg,trimg);


    Re = TP/(TP + FN);
    Pr = TP / (TP + FP);
    Fm = (2*Pr*Re)/(Pr + Re);

    result_entry = [result_entry ; TP FP FN TN];
    result_set = [result_set ; Re Pr Fm];

    filename = im_fs{pos};
    filename = changeFileFormat(filename,'png');

    saveImage(fgimg, sv_pa, filename);

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



load handel
sound(y,Fs)


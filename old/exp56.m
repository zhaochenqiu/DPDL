clear all
close all
clc

addpath('D:\projects\MatLab\imageprocessing\common');
addpath('./function/');
run('D:\tools\matconvnet-1.0-beta24\matlab\vl_setupnn')

rng(0);

im_pa = 'D:\dataset\dataset\shadow\backdoor\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\shadow\backdoor\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\shadow\backdoor\';




%{

im_pa = 'D:\dataset\dataset\baseline\highway\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\highway\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\baseline\highway\';

%}





pos = 1956;

size_block = 81;
rag_block = 0;
len_block = 9;

[im_fs temp] = loadData_files(im_pa,im_ft);
[tr_fs temp] = loadData_files(tr_pa,tr_ft);


imdb = getImdb_test(im_pa,im_ft,tr_pa,tr_ft,pos,size_block,rag_block,'train');
% imdb = equImdb(imdb);

trainimdb = imdb;



pos = strfind(im_pa,'\');
entry = im_pa(pos(end - 2):pos(end));

pos = strfind(entry,'\');
entry(pos) = '/';
entry = entry(1:end - 1);


pos = strfind(entry,'/');
oldentry = entry;
entry(pos(2)) = '_';


temp = ['./data' entry '_' num2str(len_block) '.mat'];
save(temp,'imdb');

path_imdb = temp;
path_save = ['net' oldentry '_' num2str(len_block)];

cnn_mnist_experiments(path_imdb,path_save);



net     = load([path_save '/' 'net-epoch-5.mat']);
net     = net.net;

pos = 1670;


pos = 1956;

size_block = 81;
rag_block = 0;
len_block = 9;

imdb    = getImdb_test(im_pa,im_ft,tr_pa,tr_ft,pos,size_block,rag_block);

[fgimg trimg] = getFgImg(net,imdb);


[TP FP FN TN] = evalution_entry(fgimg,trimg);


Re = TP/(TP + FN);
Pr = TP / (TP + FP);
Fm = (2*Pr*Re)/(Pr + Re);

Fm
global g_displayMatrixImage;
g_displayMatrixImage = 1;
figure

displayMatrixImage(pos,1,2,fgimg,trimg)



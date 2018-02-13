clear all
close all
clc

addpath('D:\projects\MatLab\imageprocessing\common');
addpath('./function/');
run('D:\tools\matconvnet-1.0-beta24\matlab\vl_setupnn')


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





pos = strfind(im_pa,'\');
entry = im_pa(pos(end - 2):pos(end));

pos = strfind(entry,'\');
entry(pos) = '/';
entry = entry(1:end - 1);


pos = strfind(entry,'/');
oldentry = entry;
entry(pos(2)) = '_';


temp = ['./data' entry '_' num2str(len_block) '.mat'];

path_imdb = temp;
path_save = ['net' oldentry '_' num2str(len_block)];


net     = load([path_save '/' 'net-epoch-20.mat']);
net     = net.net;

pos = 1956;

size_block = 81;
rag_block = 0;
len_block = 9;



global g_displayMatrixImage;
g_displayMatrixImage = 1;
figure

result_set = [];
result_entry = [];



list = 400:50:2000;

for i = 1:max(size(list))

    pos = list(i);
    imdb    = getImdb_test(im_pa,im_ft,tr_pa,tr_ft,pos,size_block,rag_block);

    [fgimg trimg] = getFgImg(net,imdb);


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





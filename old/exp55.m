addpath('D:\projects\MatLab\imageprocessing\common');
addpath('./function/');
run('D:\tools\matconvnet-1.0-beta24\matlab\vl_setupnn')



im_pa = 'D:\dataset\dataset\shadow\bungalows\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\shadow\bungalows\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\shadow\bungalows\';

[im_fs temp] = loadData_files(im_pa,im_ft);
[tr_fs temp] = loadData_files(tr_pa,tr_ft);


net     = load('./net_isse/bungalows_9/net-epoch-20.mat');
net     = net.net;

result_entry = [];
result_set = [];
result_sub = [];



list = 300:100:1700;
%tranvalue = 707;
% tranvalue = -174;

for i = 1:max(size(list))

    pos = list(i);
    imdb    = getImdb_test(im_pa,im_ft,tr_pa,tr_ft,pos,81,0);

    [fgimg trimg] = getFgImg(net,imdb,1000);


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





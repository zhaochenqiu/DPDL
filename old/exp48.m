addpath('D:\projects\MatLab\imageprocessing\common');
addpath('./function/');
run('D:\tools\matconvnet-1.0-beta24\matlab\vl_setupnn')



im_pa = 'D:\dataset\dataset\dynamicBackground\fountain01\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\dynamicBackground\fountain01\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\dynamicBackground\fountain01\';



net     = load('D:\projects\MatLab\imageprocessing\bgs_cnn\net_isse\fountain01_9\net-epoch-20.mat');
% net     = load('./net/dynamicBackground/fountain01_9/net-epoch-60.mat');
% net     = load('./net/dynamicBackground/fountain01_9/net-epoch-160.mat');
net     = net.net;

global g_net;
g_net = net;



trainimdb = load('./data/dynamicBackground_fountain01_9.mat');
trainimdb = trainimdb.imdb;


size_block = 81;
rag_block = 0;
peak_border = 50;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[im_fs temp] = loadData_files(im_pa,im_ft);                     %
[tr_fs temp] = loadData_files(tr_pa,tr_ft);

frames = max(size(tr_fs));

matrix = zeros(frames,2);

for i = 1:frames
    filename = tr_fs{i};

    im = double(imread([tr_pa '\' filename]));

    index_fg = im == 255;
    index_bk = im == 0;

    matrix(i,1) = sum(sum(index_fg));
    matrix(i,2) = sum(sum(index_bk));
end




fgcolor = [100 101 140];


color = [255 0 0
		180 180 180
		0 0 255
		240 70 240];


matrix_fg_bk = matrix;

hist = matrix(:,1);
hist = hist';
[row_hist column_hist] = size(hist);


mark = findPeak_plus(hist,peak_border);
[scale histimg_fg] = histogram2image_plus(hist,fgcolor,mark,color);

indexlist_fg = histimg_fg(end,:,1);

pos_fg = find(indexlist_fg == 255);

[row_t column_t] = size(pos_fg);

if column_t < 3
    disp('There is not enough foreground image for training');
end




hist = matrix(:,2);
hist = hist';
[row_hist column_hist] = size(hist);


mark = findPeak_plus(hist,peak_border);
[scale histimg_bk] = histogram2image_plus(hist,fgcolor,mark,color);

indexlist_bk = histimg_bk(end,:,1);

pos_bk = find(indexlist_bk == 255);

[row_t column_t] = size(pos_bk);

if column_t < 3
    disp('There is not enough background image for training');
end

temppos = max(size(pos_fg));
temppos = round(temppos/2 - 0.5);

imdb2 = getImdb(im_pa,im_ft,tr_pa,tr_ft,pos_fg(temppos),size_block,rag_block);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



templabs = imdb2.images.labels;
index = templabs == 255;

data = imdb2.images.data;
labs = imdb2.images.labels;
indx = imdb2.images.index;

data = data(:,:,:,index);
labs = labs(index);
indx = indx(index);

tempimdb = imdb2;
tempimdb.images.data    = data;
tempimdb.images.labels  = labs;
tempimdb.images.index   = indx;
tempimdb.images.data_mean = mean(data,4);

fgimdb = tempimdb;







templabs = imdb2.images.labels;
index = templabs == 1;

data = imdb2.images.data;
labs = imdb2.images.labels;
indx = imdb2.images.index;

data = data(:,:,:,index);
labs = labs(index);
indx = indx(index);

tempimdb = imdb2;
tempimdb.images.data    = data;
tempimdb.images.labels  = labs;
tempimdb.images.index   = indx;
tempimdb.images.data_mean = mean(data,4);

bkimdb = tempimdb;



tranvalue = sum(sum(sum(mean(trainimdb.images.data,4))));
result_entry = [];
result_set = [];
result_sub = [];


list = 1150:10:1180;

tranvalue = -174.3;
for i = 1:max(size(list))

    pos = list(i);
    imdb    = getImdb_test(im_pa,im_ft,tr_pa,tr_ft,pos,81,0);

%    [fgimg trimg] = getFgImg(net,imdb);


    [fgimg trimg re_imdb] = getFgImg_bal(imdb,fgimdb,bkimdb,tranvalue);
    value = sum(sum(sum(mean(re_imdb.images.data,4))));
    result_sub = [result_sub ; value - tranvalue];

%    [fgimg trimg re_imdb] = tempFunc(imdb,tempimdb,tempimdb,tempimdb,tempimdb,tempimdb);

    fgimg(fgimg == 1) = 0;
    trimg(trimg == 1) = 0;



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





load handel
sound(y,Fs)


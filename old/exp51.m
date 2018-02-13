
run('D:\tools\matconvnet-1.0-beta24\matlab\vl_setupnn');
addpath('d:\projects\Matlab\imageprocessing\common');
addpath('./function/');

rng(0)

video_result = [];


frames_train = 2;
frames_train_fg = 8;
frames_train_bk = 2;

len_block = 9;
rag_block = 0;
size_block = len_block^2;
frames_border = 100;
peak_border = 10;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% D:\dataset\dataset\shadow\bungalows\input

im_pa = 'D:\dataset\dataset\dynamicBackground\fountain01\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\dynamicBackground\fountain01\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\dynamicBackground\fountain01\';



[im_fs temp] = loadData_files(im_pa,im_ft);
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

imdb_fgset = {};
imdb_bkset = {};


[row_t column_t] = size(pos_fg);

index = linspace(1,max(size(pos_fg)),min([frames_train_fg max(size(pos_fg))]) + 2);
index = index(2:end - 1);
index = round(index - 0.5);
pos_fg = pos_fg(index);

len = max(size(pos_fg));

for i = 1:len
    imdb_fg = getImdb(im_pa,im_ft,tr_pa,tr_ft,pos_fg(i),size_block,rag_block,'train');

    imdb_fgset = {imdb_fgset{:}, imdb_fg};
end




[row_t column_t] = size(pos_bk);

index = linspace(1,max(size(pos_bk)),min([frames_train_bk max(size(pos_bk))]) + 2);
index = index(2:end - 1);
index = round(index - 0.5);
pos_bk = pos_bk(index);

len = max(size(pos_bk));

for i = 1:len
    imdb_bk = getImdb(im_pa,im_ft,tr_pa,tr_ft,pos_bk(i),size_block,rag_block,'train');

    imdb_bkset = {imdb_bkset{:}, imdb_bk};
end

imdb = mixImdb(imdb_fgset{:},imdb_bkset{:});



imdb2 = imdb;
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





imdb = balanceImdb(imdb,fgimdb,bkimdb);
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




net     = load([path_save '/' 'net-epoch-20.mat']);
net     = net.net;


tempmat = sum(matrix_fg_bk,2);

pos = find(tempmat ~= 0);


list = pos(1):frames_border:pos(end);


result_set = [];
result_entry = [];


global g_displayMatrixImage;
g_displayMatrixImage = 1;




% trainimdb = load('./data/dynamicBackground_fountain01_9.mat');
% trainimdb = trainimdb.imdb;


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


tempmat = sum(matrix_fg_bk,2);

pos = find(tempmat ~= 0);


list = pos(1):frames_border:pos(end);


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



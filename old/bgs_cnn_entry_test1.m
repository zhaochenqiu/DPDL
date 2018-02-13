

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
train_frames = [];



if frames_train_fg > 1
    [row_t column_t] = size(pos_fg);

    index = linspace(1,max(size(pos_fg)),min([frames_train_fg max(size(pos_fg))]));
    index = round(index - 0.5);
    pos_fg = pos_fg(index);

    pos_bk = 1956;
    len = max(size(pos_fg));

    train_frames = [train_frames pos_fg];

    for i = 1:len
        imdb_fg = getImdb_test(im_pa,im_ft,tr_pa,tr_ft,pos_fg(i),size_block,rag_block,'train');

        imdb_fgset = {imdb_fgset{:}, imdb_fg};
    end
end

if frames_train_bk > 1
    [row_t column_t] = size(pos_bk);

    index = linspace(1,max(size(pos_bk)),min([frames_train_bk max(size(pos_bk))]));
    index = round(index - 0.5);
    pos_bk = pos_bk(index);

    len = max(size(pos_bk));

    train_frames = [train_frames pos_bk];

    for i = 1:len
        imdb_bk = getImdb_test(im_pa,im_ft,tr_pa,tr_ft,pos_bk(i),size_block,rag_block,'train');

        imdb_bkset = {imdb_bkset{:}, imdb_bk};
    end
end


imdb = mixImdb(imdb_fgset{:},imdb_bkset{:});
imdb = equImdb(imdb);





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



list = train_frames;

result_set = [];
result_entry = [];


global g_displayMatrixImage;
g_displayMatrixImage = 1;
figure

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



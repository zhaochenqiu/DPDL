

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

matrix_fg_bk = matrix;


pos_fg = find(matrix(:,1) ~= 0);
index_fg = linspace(1,max(size(pos_fg)),len + 2);
index_fg = index_fg(2:end - 1);
index_fg = round(index_fg);

pos_bk = find(matrix(:,2) ~= 0);
index_bk = linspace(1,max(size(pos_bk)),len + 2);
index_bk = index_bk(2:end - 1);
index_bk = round(index_bk);

imdb_fg_set = {};
imdb_bk_set = {};

for i = 1:len
	imdb_fg = getImdb(im_pa,im_ft,tr_pa,tr_ft,pos_fg(index_fg(i)),size_block,rag_block,'train');
	imdb_bk = getImdb(im_pa,im_ft,tr_pa,tr_ft,pos_bk(index_bk(i)),size_block,rag_block,'train');

    imdb_fg_set = {imdb_fg_set{:}, imdb_fg};
	imdb_bk_set = {imdb_bk_set{:}, imdb_bk};
end 

imdb = mixImdb(imdb_fg_set{:},imdb_bk_set{:});

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


tempmat = sum(matrix_fg_bk,2);

pos = find(tempmat ~= 0);


list = pos(1):frames_border:pos(end);


result_set = [];
result_entry = [];


global g_displayMatrixImage;
g_displayMatrixImage = 1;


for i = 1:max(size(list))

    pos = list(i);
    imdb    = getImdb(im_pa,im_ft,tr_pa,tr_ft,pos,size_block,rag_block);

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



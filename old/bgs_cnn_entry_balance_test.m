

net     = load([path_save '/' 'net-epoch-20.mat']);
net     = net.net;


tempmat = sum(matrix_fg_bk,2);

pos = find(tempmat ~= 0);


list = pos(1):frames_border:pos(end);

result_set = [];
result_entry = [];


[fgimdb bkimdb] = divideFgBkImdb(trainimdb);
tranvalue = sum(sum(sum(mean(trainimdb.images.data,4))));
% tranvalue = 707;
% tranvalue = 0;
global g_displayMatrixImage;
g_displayMatrixImage = 1;


for i = 1:max(size(list))

    pos = list(i);
    imdb    = getImdb_test(im_pa,im_ft,tr_pa,tr_ft,pos,size_block,rag_block);

    [fgimg trimg re_imdb] = getFgImg_bal(net,imdb,fgimdb,bkimdb,tranvalue);
	

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




list = 940:10:1150;

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


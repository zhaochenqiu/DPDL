function [re_fgimg re_trimg re_imdb] = getFgImg_bal(net,imdb,imdb_fg,imdb_bk,trainvalue)


curvalue = sum(sum(sum(imdb.images.data_mean)));
curnum   = max(size(imdb.images.data));


fgvalue = sum(sum(sum(imdb_fg.images.data_mean)));
bkvalue = sum(sum(sum(imdb_bk.images.data_mean)));

fgnum = max(size(imdb_fg.images.data));
bknum = max(size(imdb_bk.images.data));


if fgvalue < bkvalue
    tempimdb = imdb_fg;
    imdb_fg = imdb_bk;
    imdb_bk = tempimdb;
end

fgvalue = sum(sum(sum(imdb_fg.images.data_mean)));
bkvalue = sum(sum(sum(imdb_bk.images.data_mean)));

fgnum = max(size(imdb_fg.images.data));
bknum = max(size(imdb_bk.images.data));

% imdb_bk = imdb_fg;

% fgvalue 手动调大了
if curvalue < trainvalue
    % add bkimdb

    tempvalue = (trainvalue*curnum - curvalue*curnum)/(fgvalue - trainvalue);

    rate = abs(tempvalue/fgnum);

    temp1 = round(rate - 0.5);
    temp2 = rate - temp1;

    allimdb = {};
    for i = 1:temp1
        allimdb = {allimdb{:}, imdb_fg};
    end

    temp2 = round(temp2*fgnum - 0.5);
    finimdb = imdb_fg;

    finimdb.images.data = finimdb.images.data(:,:,:,1:temp2);
    finimdb.images.labels = finimdb.images.labels(1:temp2);
    
    if temp2 < 1
        [re_fgimg re_trimg re_imdb] = tempFunc(net,imdb,allimdb{:});
    else
        [re_fgimg re_trimg re_imdb] = tempFunc(net,imdb,allimdb{:},finimdb);
    end


else
    % add fgimdb

    tempvalue = (trainvalue*curnum - curvalue*curnum)/(bkvalue - trainvalue);

    rate = abs(tempvalue/bknum);


    temp1 = round(rate - 0.5);
    temp2 = rate - temp1;

    allimdb = {};
    for i = 1:temp1
        allimdb = {allimdb{:}, imdb_bk};
    end

    temp2 = round(temp2*bknum - 0.5);
    finimdb = imdb_bk;

    finimdb.images.data = finimdb.images.data(:,:,:,1:temp2);
    finimdb.images.labels = finimdb.images.labels(1:temp2);
    
    if temp2 < 1
        [re_fgimg re_trimg re_imdb] = tempFunc(net,imdb,allimdb{:});
    else
        [re_fgimg re_trimg re_imdb] = tempFunc(net,imdb,allimdb{:},finimdb);
    end

end

re_fgimg(re_fgimg == 1) = 0;
re_trimg(re_trimg == 1) = 0;

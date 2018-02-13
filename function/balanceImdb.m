function re_imdb = balanceImdb(imdb,imdb_fg,imdb_bk)

data = imdb.images.data;
labs = imdb.images.labels;

meta = imdb.meta;

[row_t column_t byte_t frames_t] = size(data);

index_fg = labs == 255;
index_bk = labs == 1;

data_fg = data(:,:,:,index_fg);
data_bk = data(:,:,:,index_bk);

labs_fg = labs(index_fg);
labs_bk = labs(index_bk);


fgnum = sum(index_fg);
bknum = sum(index_bk);


len = max([fgnum bknum]);


rate_fg = len/fgnum;
rate_bk = len/bknum;




rate = rate_fg;
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
finimdb.images.imgsize = [ 0 0 0 ];

if temp2 < 1
    mixfgimdb = mixImdb(allimdb{:});
else
    mixfgimdb = mixImdb(allimdb{:},finimdb);
end






rate = rate_bk;
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
finimdb.images.imgsize = [0 0 0];

if temp2 < 1
    mixbkimdb = mixImdb(allimdb{:});
else
    mixbkimdb = mixImdb(allimdb{:},finimdb);
end


mixfgimdb.images.imgsize = [0 0 0];
mixbkimdb.images.imgsize = [0 0 0];

re_imdb = mixImdb(mixfgimdb,mixbkimdb);


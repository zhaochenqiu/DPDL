function re_imdb = counterImdb(imdb)

data    = imdb.images.data;
labs    = imdb.images.labels;
imgsize = imdb.images.imgsize;

[row_da column_da byte_da frames_da] = size(data);

fgidx = labs == 255;
bkidx = labs == 1;

fgnum = sum(fgidx);
bknum = sum(bkidx);


fgdata = data(:,:,:,fgidx);
fglabs = labs(fgidx);

bkdata = data(:,:,:,bkidx);
bklabs = labs(bkidx);


maxnum = max([fgnum bknum]);

if fgnum < maxnum
    exidx = round(rand(1,maxnum)*fgnum);
    exidx(exidx < 1) = 1;
    
    fgdata = fgdata(:,:,:,exidx);
    fglabs = fglabs(exidx);
end

if bknum < maxnum
    exidx = round(rand(1,maxnum)*bknum);
    exidx(exidx < 1) = 1;
    
    bkdata = bkdata(:,:,:,exidx);
    bklabs = bklabs(exidx);
end

data_imdb = zeros(row_da, column_da, byte_da, maxnum*2);
labs_imdb = zeros(1,maxnum*2);

data_imdb(:,:,:,1:maxnum) = fgdata;
labs_imdb(1:maxnum) = fglabs;

data_imdb(:,:,:,maxnum + 1:end) = bkdata;
labs_imdb(maxnum + 1:end) = bklabs;

[row_t column_t byte_t frames_t] = size(data_imdb);

for i = 1:frames_t
    ranidx = randperm(row_t*column_t);

    for j = 1:byte_t/2
        im = data_imdb(:,:,j,i);
        data_imdb(:,:,j,i) = reshape(im(ranidx), row_t, column_t);
    end


    ranidx = randperm(row_t*column_t);

    for j = byte_t/2+1:byte_t
        im = data_imdb(:,:,j,i);
        data_imdb(:,:,j,i) = reshape(im(ranidx), row_t, column_t);
    end
end



len = max(size(data_imdb));
ranidx = randperm(len);

data_imdb = data_imdb(:,:,:,ranidx);
labs_imdb = labs_imdb(ranidx);


line        = 1:max(size(ranidx));
matrix      = [line' ranidx'];
index       = sortrows(matrix,2);
recoveridx  = index(:,1);


re_imdb.images.data     = single(data_imdb);
re_imdb.images.labels   = single(labs_imdb);
re_imdb.images.imgsize  = imgsize;
re_imdb.images.index    = recoveridx;
re_imdb.images.set      = zeros( 1, max(size(data_imdb)), 'single') + 1;
re_imdb.images.data_mean = mean(data_imdb,4);

re_imdb.meta.sets       = {'train' 'Val' 'test'};
re_imdb.meta.classes    = {'0' '1'};

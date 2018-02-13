function re_imdb = equImdb(imdb)

[fgimdb bkimdb] = divideFgBkImdb(imdb);

[row column byte frames] = size(imdb.images.data);

numfg = max(size(fgimdb.images.data));
numbk = max(size(bkimdb.images.data));

num = abs(numbk - numfg);
len = min([numfg numbk]);


if numfg > len
    fgimdb.images.data = fgimdb.images.data(:,:,:,1:len);
    fgimdb.images.labels = fgimdb.images.labels(1:len);
    fgimdb.images.index = fgimdb.images.index(1:len);
    fgimdb.images.set = fgimdb.images.set(1:len);
    fgimdb.images.data_mean = mean(fgimdb.images.data,4);
end

if numbk > len
    bkimdb.images.data = bkimdb.images.data(:,:,:,1:len);
    bkimdb.images.labels = bkimdb.images.labels(1:len);
    bkimdb.images.index = bkimdb.images.index(1:len);
    bkimdb.images.set = bkimdb.images.set(1:len);
    bkimdb.images.data_mean = mean(bkimdb.images.data,4);
end

re_imdb = mixImdb(fgimdb,bkimdb);

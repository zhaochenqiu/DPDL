function re_imdb = equImdb(imdb)

[fgimdb bkimdb] = divideFgBkImdb(imdb);

[row column byte frames] = size(imdb.images.data);

numfg = max(size(fgimdb.images.data));
numbk = max(size(bkimdb.images.data));

num = abs(numbk - numfg);
len = max([numfg numbk]);

if numfg > numbk
    % add bk imdb
    bkimdb = extendImdb(bkimdb,len);
else
    % add fg imdb
    fgimdb = extendImdb(fgimdb,len);
end

re_imdb = mixImdb(fgimdb,bkimdb);

function [re_fgimdb re_bkimdb] = divideFgBkImdb(imdb)


templabs = imdb.images.labels;
index = templabs == 255;

data = imdb.images.data;
labs = imdb.images.labels;
indx = imdb.images.index;

data = data(:,:,:,index);
labs = labs(index);
indx = indx(index);

tempimdb = imdb;
tempimdb.images.data    = data;
tempimdb.images.labels  = labs;
tempimdb.images.index   = indx;
tempimdb.images.data_mean = mean(data,4);
tempimdb.images.imgsize = [ 0 0 0];

fgimdb = tempimdb;
re_fgimdb = fgimdb;






templabs = imdb.images.labels;
index = templabs == 1;

data = imdb.images.data;
labs = imdb.images.labels;
indx = imdb.images.index;

data = data(:,:,:,index);
labs = labs(index);
indx = indx(index);

tempimdb = imdb;
tempimdb.images.data    = data;
tempimdb.images.labels  = labs;
tempimdb.images.index   = indx;
tempimdb.images.data_mean = mean(data,4);
tempimdb.images.imgsize = [ 0 0 0];

bkimdb = tempimdb;
re_bkimdb = bkimdb;

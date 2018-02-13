function re_imdb = extendImdb(imdb,len)

[row_t column_t byte_t frames_t] = size(imdb.images.data);

rate = len/frames_t;

temp1 = round(rate - 0.5);
temp2 = rate - temp1;

imdb_set = {};
for i = 1:temp1
    imdb_set = {imdb_set{:}, imdb};
end

temp2 = round(temp2*frames_t - 0.5);
tempimdb = imdb;

tempimdb.images.data = tempimdb.images.data(:,:,:,1:temp2);
tempimdb.images.labels = tempimdb.images.labels(1:temp2);
tempimdb.images.imgsize = [-1 -1 -1];

judge = min(size(imdb_set));

if judge < 1
    re_imdb = mixImdb(tempimdb);
else
    re_imdb = mixImdb(tempimdb,imdb_set{:});
end


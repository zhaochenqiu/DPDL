imdb = load('imdb_9_3_582_pets2006.mat');
imdb = imdb.imdb;


index = imdb.images.index;

labs = imdb.images.labels;

labs = labs(index);


row_img = imdb.images.imgsize(1);
column_img = imdb.images.imgsize(2);

labs = reshape(labs,column_img,row_img);

len = max(size(labs));


data = imdb.images.data;
labels = imdb.images.labels;
index = imdb.images.index;
set = imdb.images.set;


imdb.images.data = data(:,:,:,1:end - 20);
imdb.images.labels = labels(1:end - 20);
imdb.images.index = index(1:end - 20);
imdb.images.set = set(1:end - 20);

save('imdb_9_3_582_pets2006_filter.mat','imdb','-v7.3');





imdb = load('imdb_9_3_982_pets2006.mat');
imdb = imdb.imdb;


index = imdb.images.index;

labs = imdb.images.labels;

labs = labs(index);


row_img = imdb.images.imgsize(1);
column_img = imdb.images.imgsize(2);

labs = reshape(labs,column_img,row_img);

len = max(size(labs));


data = imdb.images.data;
labels = imdb.images.labels;
index = imdb.images.index;
set = imdb.images.set;


imdb.images.data = data(:,:,:,1:end - 20);
imdb.images.labels = labels(1:end - 20);
imdb.images.index = index(1:end - 20);
imdb.images.set = set(1:end - 20);

save('imdb_9_3_982_pets2006_filter.mat','imdb','-v7.3');



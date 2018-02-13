clear all
close all
clc


addpath('D:\projects\MatLab\imageprocessing\common');
addpath('./function/');

run('D:\tools\matconvnet-1.0-beta24\matlab\vl_setupnn')

rng('default');




im_pa = 'D:\dataset\dataset\cameraJitter\boulevard\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\cameraJitter\boulevard\groundtruth';
tr_ft = 'png';


maxdis = 100;
index = [790,900,950,1000,1160,1220,1262,1460,1500,1900,1980,2310];
len = 0;
num = 81;
mode = 'train';


len_index = max(size(index));
imdb_set = {};

for i = 1:len_index
    imdb = getImdb_plus(im_pa,im_ft,tr_pa,tr_ft,maxdis,index(i),num,len,mode);
    imdb_set = {imdb_set{:}, imdb};
end

imdb = mixImdb(imdb_set{:});
save('./data/imdb_8_test_boulevard_train.mat','imdb');





clear all
close all
clc


addpath('D:\projects\MatLab\imageprocessing\common');
addpath('./function/');

run('D:\tools\matconvnet-1.0-beta24\matlab\vl_setupnn')

rng('default');

790
2500

im_pa = 'D:\dataset\dataset\cameraJitter\boulevard\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\cameraJitter\boulevard\groundtruth';
tr_ft = 'png';


num = 81;
curindex = 1900;
len = 0;

mode = 'train';


left = 790;
right = 2500;

line = left:1:right;
index = linspace(1,max(size(line)),10);


%imdb1 = getImdb(im_pa,im_ft,tr_pa,tr_ft,line(index(1)),num,len,mode);
%imdb2 = getImdb(im_pa,im_ft,tr_pa,tr_ft,line(index(2)),num,len,mode);
%imdb3 = getImdb(im_pa,im_ft,tr_pa,tr_ft,line(index(3)),num,len,mode);
%imdb4 = getImdb(im_pa,im_ft,tr_pa,tr_ft,line(index(4)),num,len,mode);
%imdb5 = getImdb(im_pa,im_ft,tr_pa,tr_ft,line(index(5)),num,len,mode);
%imdb6 = getImdb(im_pa,im_ft,tr_pa,tr_ft,line(index(6)),num,len,mode);
%imdb7 = getImdb(im_pa,im_ft,tr_pa,tr_ft,line(index(7)),num,len,mode);
%imdb8 = getImdb(im_pa,im_ft,tr_pa,tr_ft,line(index(8)),num,len,mode);
%imdb9 = getImdb(im_pa,im_ft,tr_pa,tr_ft,line(index(9)),num,len,mode);
%imdb10 = getImdb(im_pa,im_ft,tr_pa,tr_ft,line(index(10)),num,len,mode);
%

index = [790,900,950,1000,1160,1220,1262,1460,1500,1900,1980,2310];

imdb1 = getImdb(im_pa,im_ft,tr_pa,tr_ft,index(1),num,len,mode);
imdb2 = getImdb(im_pa,im_ft,tr_pa,tr_ft,index(2),num,len,mode);
imdb3 = getImdb(im_pa,im_ft,tr_pa,tr_ft,index(3),num,len,mode);
imdb4 = getImdb(im_pa,im_ft,tr_pa,tr_ft,index(4),num,len,mode);
imdb5 = getImdb(im_pa,im_ft,tr_pa,tr_ft,index(5),num,len,mode);
imdb6 = getImdb(im_pa,im_ft,tr_pa,tr_ft,index(6),num,len,mode);
imdb7 = getImdb(im_pa,im_ft,tr_pa,tr_ft,index(7),num,len,mode);
imdb8 = getImdb(im_pa,im_ft,tr_pa,tr_ft,index(8),num,len,mode);
imdb9 = getImdb(im_pa,im_ft,tr_pa,tr_ft,index(9),num,len,mode);
imdb10 = getImdb(im_pa,im_ft,tr_pa,tr_ft,index(10),num,len,mode);
imdb11 = getImdb(im_pa,im_ft,tr_pa,tr_ft,index(11),num,len,mode);
imdb12 = getImdb(im_pa,im_ft,tr_pa,tr_ft,index(12),num,len,mode);




imdb = mixImdb(imdb1,imdb2,imdb3,imdb4,imdb5,imdb6,imdb7,imdb8,imdb9,imdb10,imdb11,imdb12);

save('./data/imdb_9_test_10frames_boulevard_train.mat','imdb');

cnn_mnist_experiments;

clear all
close all
clc

imdb = load('./data/imdb_9_3_910_highway_train.mat');
imdb1 = imdb.imdb;

imdb = load('./data/imdb_9_3_410_pedestrians_train.mat');
imdb2 = imdb.imdb;

imdb = load('./data/imdb_9_3_1410_office_train.mat');
imdb3 = imdb.imdb;

imdb = load('./data/imdb_9_3_510_pets2006_train.mat');
imdb4 = imdb.imdb;


imdb = mixImdb(imdb1,imdb2,imdb3,imdb4);

save imdb_18_3_baseline.imdb;


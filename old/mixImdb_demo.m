clear all
close all
clc

imdb = load('./imdb_9_3_982_highway.mat');
imdb1 = imdb.imdb;

imdb = load('./imdb_9_3_482_pedestrians.mat');
imdb2 = imdb.imdb;

imdb = load('./imdb_9_3_1482_office.mat');
imdb3 = imdb.imdb;

imdb = load('./imdb_9_3_582_pets2006_filter.mat');
imdb4 = imdb.imdb;


imdb = mixImdb(imdb1,imdb2,imdb3,imdb4);

save imdb_9_9_3_allimdb.mat imdb;


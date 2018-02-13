clear all
close all
clc


addpath('D:\projects\MatLab\imageprocessing\common');
addpath('./function/');

run('D:\tools\matconvnet-1.0-beta24\matlab\vl_setupnn')

rng('default');


%{
im_pa = 'D:\dataset\dataset\baseline\highway\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\highway\groundtruth';
tr_ft = 'png';



imdb1 = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[501,510],1,'train');

imdb2 = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[701,710],1,'train');

imdb3 = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[901,910],1,'train');

imdb4 = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1101,1110],1,'train');

imdb5 = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1301,1310],1,'train');

imdb6 = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1601,1610],1,'train');


imdb = mixImdb(imdb1,imdb2,imdb3,imdb4,imdb5,imdb6);
save('./data/imdb_9_3_all_highway_train.mat','imdb');
%}


%{
imdb1 = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[501,537],1,'train');

imdb2 = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[701,737],1,'train');

imdb3 = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[901,937],1,'train');

imdb4 = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1101,1137],1,'train');

imdb5 = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1301,1337],1,'train');

imdb6 = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1601,1637],1,'train');


imdb = mixImdb(imdb1,imdb2,imdb3,imdb4,imdb5,imdb6);
save('./data/imdb_18_3_all_highway_train.mat','imdb');




imdb1 = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[801,882],0,'train');
imdb2 = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[901,982],0,'train');
imdb3 = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1001,1082],0,'train');
imdb4 = createImdb_plus(im_pa,im_ft,tr_pa,tr_ft,[1401,1482],0,'train');

imdb = mixImdb(imdb1,imdb2,imdb3,imdb4);
save('./data/imdb_9_3_all_highway_train.mat','imdb');

%}

%{


im_pa = 'D:\dataset\dataset\dynamicBackground\canoe\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\dynamicBackground\canoe\groundtruth';
tr_ft = 'png';


imdb1 = getImdb(im_pa,im_ft,tr_pa,tr_ft,800,81,0,'train');
imdb2 = getImdb(im_pa,im_ft,tr_pa,tr_ft,900,81,0,'train');
imdb3 = getImdb(im_pa,im_ft,tr_pa,tr_ft,1000,81,0,'train');
imdb4 = getImdb(im_pa,im_ft,tr_pa,tr_ft,1100,81,0,'train');


imdb = mixImdb(imdb1,imdb2,imdb3,imdb4);
save('./data/imdb_9_3_all_canoe_train.mat','imdb');

%}


%{
im_pa = 'D:\dataset\dataset\dynamicBackground\fountain02\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\dynamicBackground\fountain02\groundtruth';
tr_ft = 'png';


imdb1 = getImdb(im_pa,im_ft,tr_pa,tr_ft,600,81,0,'train');
imdb2 = getImdb(im_pa,im_ft,tr_pa,tr_ft,650,81,0,'train');
imdb3 = getImdb(im_pa,im_ft,tr_pa,tr_ft,700,81,0,'train');
imdb4 = getImdb(im_pa,im_ft,tr_pa,tr_ft,750,81,0,'train');


imdb = mixImdb(imdb1,imdb2,imdb3,imdb4);
save('./data/imdb_9_3_all_fountain02_train.mat','imdb');
%}



%{

im_pa = 'D:\dataset\dataset\nightVideos\bridgeEntry\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\nightVideos\bridgeEntry\groundtruth';
tr_ft = 'png';


imdb1 = getImdb(im_pa,im_ft,tr_pa,tr_ft,1100,81,0,'train');
imdb2 = getImdb(im_pa,im_ft,tr_pa,tr_ft,1210,81,0,'train');
imdb3 = getImdb(im_pa,im_ft,tr_pa,tr_ft,1691,81,0,'train');
imdb4 = getImdb(im_pa,im_ft,tr_pa,tr_ft,1742,81,0,'train');


imdb = mixImdb(imdb1,imdb2,imdb3,imdb4);
save('./data/imdb_9_3_all_bridgeEntry_train.mat','imdb');



im_pa = 'D:\dataset\dataset\cameraJitter\boulevard\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\cameraJitter\boulevard\groundtruth';
tr_ft = 'png';


imdb1 = getImdb(im_pa,im_ft,tr_pa,tr_ft,1251,9,1,'train');
imdb2 = getImdb(im_pa,im_ft,tr_pa,tr_ft,1600,9,1,'train');
imdb3 = getImdb(im_pa,im_ft,tr_pa,tr_ft,1983,9,1,'train');
imdb4 = getImdb(im_pa,im_ft,tr_pa,tr_ft,2470,9,1,'train');


imdb = mixImdb(imdb1,imdb2,imdb3,imdb4);
save('./data/imdb_9_3_all_bk_boulevard_train.mat','imdb');





im_pa = 'D:\dataset\dataset\cameraJitter\boulevard\input';
im_pa = 'D:\dataset\dataset\shadow\peopleInShade\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\cameraJitter\boulevard\groundtruth';
tr_pa = 'D:\dataset\dataset\shadow\peopleInShade\groundtruth';
tr_ft = 'png';


imdb1 = getImdb(im_pa,im_ft,tr_pa,tr_ft,300,81,0,'train');
imdb2 = getImdb(im_pa,im_ft,tr_pa,tr_ft,600,81,0,'train');
imdb3 = getImdb(im_pa,im_ft,tr_pa,tr_ft,800,81,0,'train');
imdb4 = getImdb(im_pa,im_ft,tr_pa,tr_ft,1100,81,0,'train');


imdb = mixImdb(imdb1,imdb2,imdb3,imdb4);
save('./data/imdb_9_3_all_peopleInShade_train.mat','imdb');




im_pa = 'D:\dataset\dataset\cameraJitter\boulevard\input';
im_pa = 'D:\dataset\dataset\shadow\peopleInShade\input';
im_pa = 'D:\dataset\dataset\thermal\park\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\cameraJitter\boulevard\groundtruth';
tr_pa = 'D:\dataset\dataset\shadow\peopleInShade\groundtruth';
tr_pa = 'D:\dataset\dataset\thermal\park\groundtruth';
tr_ft = 'png';


imdb1 = getImdb(im_pa,im_ft,tr_pa,tr_ft,250,81,0,'train');
imdb2 = getImdb(im_pa,im_ft,tr_pa,tr_ft,400,81,0,'train');
imdb3 = getImdb(im_pa,im_ft,tr_pa,tr_ft,400,81,0,'train');
imdb4 = getImdb(im_pa,im_ft,tr_pa,tr_ft,500,81,0,'train');


imdb = mixImdb(imdb1,imdb2,imdb3,imdb4);
save('./data/imdb_9_3_all_park_train.mat','imdb');







im_pa = 'D:\dataset\dataset\cameraJitter\boulevard\input';
im_pa = 'D:\dataset\dataset\shadow\peopleInShade\input';
im_pa = 'D:\dataset\dataset\thermal\park\input';
im_pa = 'D:\dataset\dataset\intermittentObjectMotion\winterDriveway\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\cameraJitter\boulevard\groundtruth';
tr_pa = 'D:\dataset\dataset\shadow\peopleInShade\groundtruth';
tr_pa = 'D:\dataset\dataset\thermal\park\groundtruth';
tr_pa = 'D:\dataset\dataset\intermittentObjectMotion\winterDriveway\groundtruth';

tr_ft = 'png';


imdb1 = getImdb(im_pa,im_ft,tr_pa,tr_ft,1000,81,0,'train');
imdb2 = getImdb(im_pa,im_ft,tr_pa,tr_ft,1300,81,0,'train');
imdb3 = getImdb(im_pa,im_ft,tr_pa,tr_ft,1400,81,0,'train');
imdb4 = getImdb(im_pa,im_ft,tr_pa,tr_ft,1900,81,0,'train');


imdb = mixImdb(imdb1,imdb2,imdb3,imdb4);
save('./data/imdb_9_3_all_winterDriveway_train.mat','imdb');


%}



%{
im_pa = 'D:\dataset\dataset\cameraJitter\boulevard\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\cameraJitter\boulevard\groundtruth';
tr_ft = 'png';


imdb1 = getImdb(im_pa,im_ft,tr_pa,tr_ft,1900,100,0,'train');
imdb2 = getImdb(im_pa,im_ft,tr_pa,tr_ft,2050,100,0,'train');
imdb3 = getImdb(im_pa,im_ft,tr_pa,tr_ft,2150,100,0,'train');
imdb4 = getImdb(im_pa,im_ft,tr_pa,tr_ft,2300,100,0,'train');


imdb = mixImdb(imdb1,imdb2,imdb3,imdb4);
save('./data/imdb_10_3_all_boulevard_train.mat','imdb');

%}






im_pa = 'D:\dataset\dataset\cameraJitter\boulevard\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\cameraJitter\boulevard\groundtruth';
tr_ft = 'png';


imdb1 = getImdb(im_pa,im_ft,tr_pa,tr_ft,1900,225,0,'train');
imdb2 = getImdb(im_pa,im_ft,tr_pa,tr_ft,2050,225,0,'train');
imdb3 = getImdb(im_pa,im_ft,tr_pa,tr_ft,2150,225,0,'train');
imdb4 = getImdb(im_pa,im_ft,tr_pa,tr_ft,2300,225,0,'train');


imdb = mixImdb(imdb1,imdb2,imdb3,imdb4);
save('./data/imdb_15_3_all_boulevard_train.mat','imdb');


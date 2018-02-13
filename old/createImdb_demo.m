clear all
close all
clc


addpath('D:\projects\MatLab\imageprocessing\common');

run('D:\tools\matconvnet-1.0-beta24\matlab\vl_setupnn')

rng('default');



im_pa = 'D:\dataset\dataset\baseline\highway\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\highway\groundtruth';
tr_ft = 'png';

imdb = createImdb(im_pa,im_ft,tr_pa,tr_ft,[901,982],0);
save('imdb_9_3_982_highway.mat','imdb','-v7.3');



im_pa = 'D:\dataset\dataset\baseline\highway\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\highway\groundtruth';
tr_ft = 'png';

imdb = createImdb(im_pa,im_ft,tr_pa,tr_ft,[1401,1482],0);
save('imdb_9_3_1482_highway.mat','imdb','-v7.3');


im_pa = 'D:\dataset\dataset\baseline\PETS2006\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\PETS2006\groundtruth';
tr_ft = 'png';

imdb = createImdb(im_pa,im_ft,tr_pa,tr_ft,[501,582],0);
save('imdb_9_3_582_pets2006.mat','imdb','-v7.3');





im_pa = 'D:\dataset\dataset\baseline\PETS2006\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\PETS2006\groundtruth';
tr_ft = 'png';

imdb = createImdb(im_pa,im_ft,tr_pa,tr_ft,[901,982],0);
save('imdb_9_3_982_pets2006.mat','imdb','-v7.3');




im_pa = 'D:\dataset\dataset\baseline\pedestrians\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\pedestrians\groundtruth';
tr_ft = 'png';

imdb = createImdb(im_pa,im_ft,tr_pa,tr_ft,[401,482],0);
save('imdb_9_3_482_pedestrians.mat','imdb','-v7.3');



im_pa = 'D:\dataset\dataset\baseline\pedestrians\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\pedestrians\groundtruth';
tr_ft = 'png';

imdb = createImdb(im_pa,im_ft,tr_pa,tr_ft,[901,982],0);
save('imdb_9_3_1482_pedestrians.mat','imdb','-v7.3');







im_pa = 'D:\dataset\dataset\baseline\office\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\office\groundtruth';
tr_ft = 'png';

imdb = createImdb(im_pa,im_ft,tr_pa,tr_ft,[401,482],0);
save('imdb_9_3_482_office.mat','imdb','-v7.3');



im_pa = 'D:\dataset\dataset\baseline\office\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\office\groundtruth';
tr_ft = 'png';

imdb = createImdb(im_pa,im_ft,tr_pa,tr_ft,[901,982],0);
save('imdb_9_3_1482_office.mat','imdb','-v7.3');



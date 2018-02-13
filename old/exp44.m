addpath('D:\projects\MatLab\imageprocessing\common');
addpath('./function/');
run('D:\tools\matconvnet-1.0-beta24\matlab\vl_setupnn')



im_pa = 'D:\dataset\dataset\shadow\bungalows\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\shadow\bungalows\groundtruth';
tr_ft = 'png';

sv_pa = 'D:\dataset\bgs_cnn\shadow\bungalows\';



net     = load('D:\projects\MatLab\imageprocessing\bgs_cnn\net_isse\bungalows_9\net-epoch-20.mat');
net     = net.net;

global g_net;
g_net = net;



trainimdb = load('./data/shadow_bungalows_9.mat');
trainimdb = trainimdb.imdb;

[fr br] = getFgBkRate(trainimdb);


imdb1    = getImdb_test(im_pa,im_ft,tr_pa,tr_ft,300,81,0);
imdb2    = getImdb_test(im_pa,im_ft,tr_pa,tr_ft,400,81,0);
imdb3    = getImdb_test(im_pa,im_ft,tr_pa,tr_ft,500,81,0);
imdb4    = getImdb_test(im_pa,im_ft,tr_pa,tr_ft,600,81,0);


[fr1 br1] = getFgBkRate(imdb1);
[fr2 br2] = getFgBkRate(imdb2);
[fr3 br3] = getFgBkRate(imdb3);
[fr4 br4] = getFgBkRate(imdb4);





templabs = imdb2.images.labels;
index = templabs == 255;

data = imdb2.images.data;
labs = imdb2.images.labels;
indx = imdb2.images.index;

tempimdb = imdb2;
tempimdb.images.data = data(:,:,:,index);
tempimdb.images.labels = labs(index);
tempimdb.images.index = indx(index);


[fgimg trimg re_imdb] = tempFunc(imdb1,tempimdb,tempimdb,tempimdb,tempimdb,tempimdb);


[tfr tbr] = getFgBkRate(re_imdb);
tfr

mt = (360*240 - sum(sum(fgimg == 255)))/(360*240)
sum(sum(fgimg == 255))


global g_displayMatrixImage;
g_displayMatrixImage = 1;
figure


displayMatrixImage(1,1,2,fgimg,trimg)



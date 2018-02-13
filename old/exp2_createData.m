clear all
close all
clc


addpath('D:\projects\MatLab\imageprocessing\common');
addpath('./function/');

run('D:\tools\matconvnet-1.0-beta24\matlab\vl_setupnn')

rng('default');

im_pa = 'D:\dataset\dataset\baseline\highway\input';
im_ft = 'jpg';

tr_pa = 'D:\dataset\dataset\baseline\highway\groundtruth';
tr_ft = 'png';



index_left = 821;
index_right = 901;


data = double(loadData(im_pa,im_ft));
block_im = data(:,:,:,index_left:index_right);
clear data;


[tru files] = loadData_files(tr_pa,tr_ft);
block_tr = double(imread([tr_pa '\' tru{index_right}]));
clear tru;


imdb.meta.sets = {'train' 'Val' 'test'};
imdb.meta.classes = {'0' '1'};


[row column byte frames] = size(block_im);

% num = 10000;
num = row*column;



% im_large = padarray(tempimg,[15,15],'symmetric');




data = single(zeros(27,27,3,num));
labels = zeros(1,num);
set = zeros(1,num) + 1;


block_im = padarray(block_im,[1,1],'symmetric');
block_tr = padarray(block_tr,[1,1],'symmetric');


count = 1;
for posr = 2:241
    for posc = 2:321

        tempimg = zeros(27,27,3);

        for i = 1:3
            for j = 1:3
                im = createData_byPos(block_im,posr + i - 2,posc + j - 2);
                tempr = (i - 1)*9 + 1;
                tempc = (j - 1)*9 + 1;

                tempimg(tempr:tempr+8,tempc:tempc+8,:) = im;
            end
        end


        lab = block_tr(posr,posc);
        im = tempimg;

        im = single(im);

        if lab == 0
            lab = 1;
        end

        data(:,:,:,count) = im;
        labels(count) = lab;

        count
        count = count + 1;


%        displayMatrixImage(lab,1,1,abs(im));

        if lab == 255
%            input('pause in the')
        end

    end
end

data_mean = mean(data,4);

imdb.images.data = data;
imdb.images.labels = labels;
imdb.images.set = set;
imdb.images.data_mean = data_mean;

save imdb_27_27_3.mat imdb;



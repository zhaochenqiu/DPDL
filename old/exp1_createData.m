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



data = single(zeros(12,12,3,num));
labels = zeros(1,num);
set = zeros(1,num) + 1;

count = 1;
for posr = 1:240
    for posc = 1:320
        line = block_im(posr,posc,:,:);
        lab = block_tr(posr,posc);
        line = squeeze(line);
        line = line';

        im = createRectData_plus(line,12,8);

        for n = 1:3
            value = mean(line(:,n));
            im(:,:,n) = abs(im(:,:,n) - value);
        end

        im = single(im);


        if lab == 0
            lab = 1;
        end

        data(:,:,:,count) = im;
        labels(count) = lab;

        count
        count = count + 1;


        displayMatrixImage(lab,1,1,im);

        if lab == 255
        input('pause in the')
    end

    end
end

data_mean = mean(data,4);

imdb.images.data = data;
imdb.images.labels = labels;
imdb.images.set = set;
imdb.images.data_mean = data_mean;

save imdb_size_28_28_fg.mat imdb;



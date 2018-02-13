function [fgrate bkrate] = getFgBkRate(imdb)


fglabs = imdb.images.labels == 255;
bklabs = imdb.images.labels == 1;

fgnum = sum(fglabs);
bknum = sum(bklabs);

allnum = fgnum + bknum;

fgrate = fgnum/allnum;
bkrate = bknum/allnum;


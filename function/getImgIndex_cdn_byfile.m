function re_idx = getImgIndex_cdn_byfile(im_pa)

value = load([im_pa '../temporalROI.txt']);

re_idx = value(1):value(2);




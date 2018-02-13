function re_img = imread_small(fullfile)

im = imread(fullfile);

len = max(size(im));

if len > 700
     im = scaleImage(im,0.5);
end

re_img = im;





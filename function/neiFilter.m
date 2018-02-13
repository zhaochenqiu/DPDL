function re_im = neiFilter(im,radius)

if nargin == 1
    radius = 2;
end

[row_im column_im byte_im] = size(im);

extim = padarray(im, [radius radius], 'symmetric');

re_im = im;

for i = 1:row_im
    for j = 1:column_im
        if im(i,j) ~= 0 & im(i,j) ~= 255
            posr = i + radius;
            posc = i + radius;

            block = extim(posr - radius:posr + radius, posc - radius:posc + radius);
            value_fg = sum(sum(block == 255));
            value_bk = sum(sum(block == 0));

            re_im(i,j) = 255*(value_fg > value_bk);
        end
    end
end


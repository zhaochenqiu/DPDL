row = 240;
column = 320;
byte = 3;
frame = 81;

num = row*column*byte*frame;

line = 1:num;
mat = reshape(line,row,column,byte,frame);

posr = 100;
posc = 113;
posb = 2;
posf = 23;

value = (posf - 1)*row*column*byte + (posb - 1)*row*column + (posc - 1)*row + posr;

sum(mat(posr,posc,posb,posf) - value);

t2 = mat(1,2,1,:);
t3 = reshape(t2,9,9);



m1 = mat;
m2 = permute(m1,[4 3 1 2]);
m3 = reshape(m2,9,9,byte,row*column);
t4 = m3(:,:,1,241);

sum(sum(t4 - t3))

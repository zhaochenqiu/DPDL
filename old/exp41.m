clear all
close all
clc

num = 10;
border = 0.01;

x = -num:border:num;

a = 1;
c = 0;

y = sigmf(x,[a c])

figure
plot(x,y,'b.');

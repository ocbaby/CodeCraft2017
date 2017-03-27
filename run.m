clear;clc 
%load('test1.mat')
inp;
[F cost]=cdn( W,C,consumer,need,price );
[result flow] =cvt(F)

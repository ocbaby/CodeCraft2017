clear;clc 
load('test1.mat')
F=cdn( W,C,consumer,need,price );
[result flow] =cvt(F)
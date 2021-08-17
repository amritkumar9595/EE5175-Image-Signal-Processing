

function [Wmat]= MSE(Inew,Il)

clc
clear
close all

A=[1,2,3;4,5,6;7,8,9]
B=[11,12,13;14,15,16;17,18,19]
C=[21,22,23;24,25,26;27,28,29]

d = cat(3,A,B)
d=cat(3,d,C)
e=2*d

f=(d-e)
f=f.^2
numel(f)
sum(sum(f))

        
        
        
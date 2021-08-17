function [t]=translation_matrix(x,y,z)

t=zeros(3,1);
t(1,1)=x;
t(2,1)=y;
t(3,1)=z;


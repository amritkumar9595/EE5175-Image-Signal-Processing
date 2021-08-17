function [H]=homography_matrix(T,R,d,f)

k=k_matrix();

n=zeros(1,3);
n(1,3)=1;



H=k*(R+(T*n)/d)/(k);
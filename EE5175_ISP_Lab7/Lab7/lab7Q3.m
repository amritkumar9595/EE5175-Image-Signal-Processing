load('imageFile.mat')

M1=g*transpose(g);
M2=transpose(g)*g;


[E1,D1]=eigensorted(M1);
[E2,D2]=eigensorted(M2);
% E1=-E1;
% E2=-E2;
%S=sqrtm(abs(D2))
S = E1'*g*E2
I1=E1*S*E2';

% 
% I1=uint8(I1);
% g=uint8(g);
error=I1-g;

[U,T,V] = svd(g);
I2=U*T*V';
b=U*V';
e1=U-E1;
e2=V-E2;
e3=S-T;
e4=I2-g;

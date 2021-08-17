clc
clear
close all
load('A.mat');
load('Lnew.mat');
I1=imread('Beethoven1.png');
I2=imread('Beethoven2.png');
I3=imread('Beethoven3.png');
figure(1),imshow(I1,[0,255]);
figure(2),imshow(I2,[0,255]);
figure(3),imshow(I3,[0,255]);


Ilexi=lexicograph(I1,I2,I3);
[U,S,V] = svd(Ilexi,'econ');
N=U*sqrtm(S)*A;
L=inv(A)*sqrtm(S)*V';

% M=U*sqrtm(S);


Nhat=zeros(size(N));
p=zeros(size(N,1),1);
[Nhat,p]=albedo(N);
 
Ilexi2=zeros(size(Ilexi));
Imgnew1=zeros(size(Ilexi,1),1);
Imgnew2=zeros(size(Ilexi,1),1);
Imgnew3=zeros(size(Ilexi,1),1);

Ilexi2=Nhat*Lnew;
for i=1:(size(Ilexi,1))
Ilexi2(i,:)= p(i,1)*Ilexi2(i,:);
end
Ilexi2=uint8(Ilexi2);

Imgnew1=Ilexi(:,1);
Imgnew1=reshape(Imgnew1,256,256);
Imgnew1 = imrotate(Imgnew1,-90);
figure(4),imshow(Imgnew1,[0,255]);

Imgnew2=Ilexi(:,2);
Imgnew2=reshape(Imgnew2,256,256);
Imgnew2 = imrotate(Imgnew2,-90);
figure(5),imshow(Imgnew2,[0,255]);

Imgnew3=Ilexi(:,3);
Imgnew3=reshape(Imgnew3,256,256);
Imgnew3 = imrotate(Imgnew3,-90);
figure(6),imshow(Imgnew3,[0,255]);







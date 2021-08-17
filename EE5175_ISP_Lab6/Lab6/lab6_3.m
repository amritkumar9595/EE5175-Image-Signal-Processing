clc
clear
close all
I1=imread('peppers_small.pgm');
I1=double(I1);
N=size(I1,1);

deg=45;
t=pi*deg/180;
title("IMAGE");
figure(1), 
imshow(I1,[0,255]);


img_rot=zeros(size(I1));
dft=zeros(size(I1));
dft2=zeros(size(I1));

dft_rot=zeros(size(I1));
H=zeros(size(I1));


%FINDING DFT OF IMAGE:
H=dft_matrix(N);
dft=H*I1*transpose(H);
figure(2),imshow(dft,[0,255]);
title("DFT OF IMAGE");

%ROTATING DFT:
for i=1:size(dft,1)
    for j=1:size(I1,1)
     dft_rot(i,j)= rotation(i,j,dft,t);
     end
end
figure(3),imshow(dft_rot,[0,255]);
title("ROTATING DFT OF IMAGE");


%INVERSE OF ROTATED DFT:
idft_rot=inv(H)*dft_rot*inv(transpose(H));
figure(4),imshow(idft_rot,[0,255]);
title("IDFT OF ROTATED IMAGE");

%ROTATING IMAGE:
for i=1:size(I1,1)
    for j=1:size(I1,2)
     img_rot(i,j)= rotation(i,j,I1,t);
     end
end
figure(4),imshow(img_rot,[0,255]);
title("ROTATED IMAGE");

%DFT OF ROTATED IMAGE:
dft2=H*img_rot*transpose(H);

figure(5),imshow(dft2,[0,255]);
title(" DFT OF ROTATED IMAGE");


        


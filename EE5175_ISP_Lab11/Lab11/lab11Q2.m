clc
clear
close all
I1=imread('lena.png');
kernel2=imread('mb-kernel.png');
% I1=reshape(I1,[numel(I1),1]);

sd=0.5;
sn=10;
L=1.5;

k_size=ceil(6*sd+1);

if rem(k_size,2)==0
    k_size=k_size+1;
end
kernel = zeros(k_size,k_size);
kernel1=kernelfunc(sd);

kernel_sum2=sum(sum(kernel2));
kernel2=double(kernel2)./kernel_sum2;

C=conv2(double(I1),kernel1,'same');
imshow(uint8(C));
noise=randn(277)*sn;
g=C+noise;
figure(1),imshow(uint8(g));

fhat=admmfft(g,kernel1,L,1);
figure(2),imshow(uint8(fhat));
% [min_error, argmin] = min(rms_error);
% L_min=L(argmin);


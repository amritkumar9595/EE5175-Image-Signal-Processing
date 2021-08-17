clc
clear
close all
I1=imread('lena.png');  
% I1=reshape(I1,[numel(I1),1]);

sd=1;
sn=8;

k_size=ceil(6*sd+1);

if rem(k_size,2)==0
    k_size=k_size+1;
end
kernel = zeros(k_size,k_size);
kernel=kernelfunc(sd);

H=psf2otf(kernel,[277,277]);
qx=[1,-1];
Qx=fft2(qx,277,277);
qy=[1,-1]';
Qy=fft2(qy,277,277);

C=conv2(double(I1),kernel,'same');
imshow(uint8(C));
noise=randn(277)*sn;
g=C+noise;
figure(1),imshow(uint8(g));
G= fft2(g,277,277);


L=linspace(0.01,2,200);              %% lambda
rms_error=zeros(size(L,2),1);        %% rms error


for i=1:size(L,2)
i 
Fhat=(conj(H).*G)./(conj(H).*H + L(i).*conj(Qx).*Qx + L(i).*conj(Qy).*Qy);
fhat=ifft2(Fhat);
%figure(i),imshow(uint8((fhat)));
rms_error(i) = sqrt(immse(double(I1), fhat));
end

[min_error, argmin] = min(rms_error);
L_min=L(argmin);

% image with L_min using L2 regularization:
i=argmin;
Fhat=(conj(H).*G)./(conj(H).*H + L(i).*conj(Qx).*Qx + L(i).*conj(Qy).*Qy);
fhat=ifft2(Fhat);
figure(2),imshow(uint8((fhat)));

L=0.1;
Fhat=(conj(H).*G)./(conj(H).*H + L*conj(Qx).*Qx + L*conj(Qy).*Qy);
fhat=ifft2(Fhat);
figure(3),imshow(uint8((fhat)));








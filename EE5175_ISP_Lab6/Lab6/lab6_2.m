clc
clear
close all
I1=imread('fourier.pgm');
I2=imread('fourier_transform.pgm');
figure(1), imshow(I1,[0,255])
figure(2), imshow(I2,[0,255])
dft_1=zeros(size(I1));
mag_1=zeros(size(I1));
phase_1=zeros(size(I1));
dft_2=zeros(size(I1));
mag_2=zeros(size(I1));
phase_2=zeros(size(I1));
dft_12=zeros(size(I1));
dft_21=zeros(size(I1));

for n=1:size(I1,1)
   dft_1(n,:)=fft(squeeze(I1(n,:)));
   dft_2(n,:)=fft(squeeze(I2(n,:)));
   
end

% dft_1=fftshift(dft_1);
% dft_2=fftshift(dft_2);

for n=1:size(dft_1,1)
    mag_1(n,:)=abs(squeeze(dft_1(n,:)));
    phase_1(n,:) = unwrap(angle(squeeze(dft_1(n,:))));
    mag_2(n,:)=abs(squeeze(dft_2(n,:)));
    phase_2(n,:) = unwrap(angle(squeeze(dft_2(n,:))));
end

for n=1:size(dft_1,1)
     dft_12(n,:)=mag_1(n,:).*exp(i*phase_2(n,:));
     dft_21(n,:)=mag_2(n,:).*exp(i*phase_1(n,:));
end

for n=1:size(I1,1)
   I3(n,:)=ifft(squeeze(dft_12(n,:)));
   I4(n,:)=ifft(squeeze(dft_21(n,:)));
   
end
figure(3),imshow(I3,[0,255])
figure(4),imshow(I4,[0,255])




clc
clear
close all
I1=imread('peppers.pgm');
I1=double(I1);
%figure, imshow(I1,[0,255])
dft=zeros(size(I1));
mag=zeros(size(I1));
phase=zeros(size(I1));

for i=1:size(I1,1)
   dft(i,:)=fft(squeeze(I1(i,:)));
   
end
dft=fftshift(dft);
for i=1:size(dft,1)
    i
    mag(i,:)=abs(squeeze(dft(i,:)));
    phase(i,:) = unwrap(angle(squeeze(dft(i,:))));
end
figure(1),imshow(mag,[0,255])


     
     
    
    
    


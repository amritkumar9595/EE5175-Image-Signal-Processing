clc
clear
close all
I1=imread('Nautilus.pgm');
figure, imshow(I1,[0,255])

sd=2;
k_size=ceil(6*sd+1);

if rem(k_size,2)==0
    k_size=k_size+1;
end
kernel = zeros(k_size,k_size);


mid=floor(k_size/2);

kernel=kernelfunc(sd);


s=sum(sum(kernel));
kernel=kernel./s;



I_blur = zeros(size(I1,1),size(I1,2));

for i=1:size(I_blur,1)
    for j=1:size(I_blur,2)
        
        
        I_blur(i,j)=convolution(I1,kernel,i-1,j-1);
        
    end
end

figure, imshow(I_blur,[0,255])
image_siv=I_blur;        

 







 
      



 
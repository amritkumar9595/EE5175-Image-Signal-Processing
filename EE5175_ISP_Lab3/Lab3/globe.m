clc

close all
I1=imread('Nautilus.pgm');
figure, imshow(I1,[0,255])

I_blur = zeros(size(I1,1),size(I1,2));

for i=1:size(I_blur,1)
    for j=1:size(I_blur,2)
        
%         sd=standard_deviation(size(I1,1),i,j);
        sd=1
        kernel=kernelfunc(sd);
        
        
        I_blur(i,j)=convolution(I1,kernel,i-1,j-1);
        
    end
end

figure, imshow(I_blur,[0,255])
image_spv=I_blur;
error=image_spv-image_siv;
figure,imshow(error,[0,255])
unique(error)


        

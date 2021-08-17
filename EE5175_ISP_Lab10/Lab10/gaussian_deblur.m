function [I_blur,kernel]= gaussian_deblur(sd)

In=imread('krishna_0_001.png');   % noisy image
I_blur=zeros(size(In,1),size(In,2),size(In,3));
k_size=11;
kernel = zeros(k_size,k_size);

kernel=kernelfunc(sd);
% s=sum(sum(kernel));
% kernel=kernel./s;

InR=In(:,:,1);
InG=In(:,:,2);
InB=In(:,:,3);

I_blur(:,:,1) = conv2(InR,kernel,'same');
I_blur(:,:,2) = conv2(InG,kernel,'same');
I_blur(:,:,3) = conv2(InB,kernel,'same');

% imshow(uint8(I_blur))
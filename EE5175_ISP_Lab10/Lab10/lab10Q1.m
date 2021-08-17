clc
clear
close all

%%%%%  calculating MSE and PSNR  %%%%%
%% W=5,Wsim=3   W=10,Wsim=3:
[MSE1,PSNR1]=PSNR_func(5,3);
[MSE2,PSNR2]=PSNR_func(10,3);
sig = linspace(0.1,1,10);

% base MSE and  PSNR:
In=imread('krishna_0_001.png');   % noisy image
Il=imread('krishna.png');         % latent image
In=double(In)/255;
Il=double(Il)/255;
MSE_base=sum(sum(sum((In-Il).^2)))/numel(In);
PSNR_base=10*log(1/MSE_base);

%GAUSSIAN DEBLURRING:
MSE_g=zeros(10,1);
PSNR_g=zeros(10,1);
sig=linspace(0.1,1,10);
Il=imread('krishna.png');
Il=double(Il)/255;

Iblur=zeros(size(Il,1),size(Il,2),size(Il,3));
for i=1:10
    i
    Iblur = gaussian_deblur(sd(i));
    figure, imshow(uint8(Iblur))
    Iblur=Iblur/255;
    MSE_g(i)=sum(sum(sum((Iblur-double(Il).^2)))/numel(Il));
    PSNR_g(i)=10*log(1/MSE_g(i));
end


plot(sig,PSNR1);
hold on
plot(sig,PSNR2);
plot(sig,PSNR_g)
title('Comparing PSNR1,PSNR2')
hold off
legend('W=5,Wsim=3', 'W=10,Wsim=3','Gaussian filter')

%%%%%%  plot filter kernel NLM  %%%%%%%%
%%
In=imread('krishna_0_001.png');   % noisy image
Il=imread('krishna.png');         % latent image
In=double(In)/255;
sig=0.5;
W=5;
Wsim=3;
row=63;
col=93;       
Wmat=zeros(2*W+1,2*W+1,3);
Wmat=In(row-W:row+W,col-W:col+W,:);
Wsimp=In(row-Wsim:row+Wsim,col-Wsim:col+Wsim,:);
vectorp=double(reshape(Wsimp,[numel(Wsimp),1]));
filter=zeros(2*W+1,2*W+1);
Wmat=padarray(Wmat,[Wsim Wsim],0,'both');
for k=Wsim+1:size(Wmat,1)-2*Wsim
      for l=Wsim+1:size(Wmat,2)-2*Wsim
                
    Wsimq=Wmat(k-Wsim:k+Wsim,l-Wsim:l+Wsim,:);
    vectorq=double(reshape(Wsimq,[numel(Wsimq),1]));
    filter(k,l)=exp(dot(-(vectorp-vectorq)',(vectorp-vectorq)))/(sig*sig);
end
end
imshow(uint8(filter*255),'InitialMagnification',1000)

k_size=11;
kernel = zeros(k_size,k_size);
mid=floor(k_size/2);
kernel=kernelfunc(sd);


s=sum(sum(kernel));
kernel=kernel./s;
%%
%%%%%  plot filter kernel GAUSSIAN %%%%%%%%
%%
sd=1;
k_size=11;
kernel = zeros(k_size,k_size);
kernel=kernelfunc(sd);
s=sum(sum(kernel));
kernel=kernel./s;
imshow(unit8(kernel*255),'InitialMagnification',1000)
%%



%%%%% image patch from the noisy image and the denoised images  %%%%%%
%%
row=63;
col=93;
Inoisy=zeros(11,11,3);
Inoisy=In(row-W:row+W,col-W:col+W,:);
imshow((uint8(Inoisy.*255)),'InitialMagnification',1000);

I=imread('krishna_0_001.png');   % noisy image
Il=imread('krishna.png');  % latent image
I=double(I)/255;
Il=double(Il)/255;
I=padarray(I,[W W],0,'both');
Il=padarray(Il,[W W],0,'both');

sig=0.5

Inew=zeros(size(I,1),size(I,2),size(I,3));
Wmat=zeros(2*W+1,2*W+1,3);
Wsimp=zeros(2*Wsim+1,2*Wsim+1,3);
Wsimq=zeros(2*Wsim+1,2*Wsim+1,3);
filter=zeros(2*W+1,2*W+1);

for i=W+1:size(I,1)-2*W
    
    i
    for j=W+1:size(I,2)-2*W
        
        Wmat=zeros(2*W+1,2*W+1,3);
        Wmat=I(i-W:i+W,j-W:j+W,:);
        Wsimp=I(i-Wsim:i+Wsim,j-Wsim:j+Wsim,:);
        vectorp=reshape(Wsimp,[numel(Wsimp),1]);
        filter=zeros(2*W+1,2*W+1);
%         size(Wmat,2)
        Wmat=padarray(Wmat,[Wsim Wsim],0,'both');
        for k=Wsim+1:size(Wmat,1)-2*Wsim
            
            
            for l=Wsim+1:size(Wmat,2)-2*Wsim
                
                
%                 q=I(k,l,:);
                
                Wsimq=Wmat(k-Wsim:k+Wsim,l-Wsim:l+Wsim,:);
                vectorq=reshape(Wsimq,[numel(Wsimq),1]);
                filter(k,l)=exp(-transpose(vectorp-vectorq)*(vectorp-vectorq)/(sig*sig));
            end
        end
        
        filter=reshape(filter,[numel(filter),1]);
        filter=filter/sum(filter);
        Wmat=Wmat(Wsim+1:size(Wmat)-Wsim,Wsim+1:size(Wmat)-Wsim,:);
        R=Wmat(:,:,1);
        G=Wmat(:,:,2);
        B=Wmat(:,:,3);
        
        vectorR=reshape(R,[numel(R),1]);
        vectorG=reshape(G,[numel(G),1]);
        vectorB=reshape(B,[numel(B),1]);
        Inew(i,j,1)=vectorR'*filter;
        Inew(i,j,2)=vectorG'*filter;
        Inew(i,j,3)=vectorB'*filter;
    end
end
imshow(uint8(Inew*255))
Idenoised=zeros(11,11,3);
Idenoised=Inew(row-W:row+W,col-W:col+W,:);
imshow((uint8(Idenoised*255)),'InitialMagnification',1000)
%%










        





       


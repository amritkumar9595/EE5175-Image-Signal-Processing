function [MSE,PSNR]= PSNR_func(W,Wsim)
% W=5;
% Wsim=3;
I=imread('krishna_0_001.png');   % noisy image
Il=imread('krishna.png');  % latent image
I=double(I)/255;
Il=double(Il)/255;
I=padarray(I,[W W],0,'both');
Il=padarray(Il,[W W],0,'both');
figure(1),imshow(I);
MSE=zeros(10,1);
PSNR=zeros(10,1);
% MSE2=zeros(10,1);
% PSNR2=zeros(10,1);

for t=1:10
sig=t/10;

Inew=zeros(size(I,1),size(I,2),size(I,3));
Wmat=zeros(2*W+1,2*W+1,3);
Wsimp=zeros(2*Wsim+1,2*Wsim+1,3);
Wsimq=zeros(2*Wsim+1,2*Wsim+1,3);
filter=zeros(2*W+1,2*W+1);
size(I,1);

for i=W+1:size(I,1)-2*W
    t
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
% figure(t),imshow(uint8(Inew*255))
MSE(t)=sum(sum(sum((Inew-Il).^2)))/numel(Inew)
% PSNR1(t)=10*log(1/MSE1(t))
end

PSNR=10*log(1./MSE);
% PSNR2=10*log(1./MSE2);


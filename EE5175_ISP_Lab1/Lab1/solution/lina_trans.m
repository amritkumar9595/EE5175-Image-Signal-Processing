clc
clear
close all


A=imread('D:\EE5175-Image-Signal-Processing\EE5175_ISP_Lab1\Lab1\lena_translate.pgm');
B=zeros(size(A));
C=zeros(size(A));

tx=3.75;
ty=4.3;


figure(1),imshow(A,[0,255])


for i=1:256
    disp(i);
    for j=1:256
        A=imread('D:\EE5175-Image-Signal-Processing\EE5175_ISP_Lab1\Lab1\lena_translate.pgm');
    

        a=tx-floor(tx);
        b=ty-floor(ty);
        
       
        if (i-floor(tx)>=1 && j-floor(ty)>=1 &&  i-floor(tx)<=size(A,1) && j-floor(ty)<=size(A,2));
            C(i,j)=(1-a)*(1-b)*A(i-floor(tx),j-floor(ty))+a*(1-b)*A(i-floor(tx),j-floor(ty)+1)+b*(1-a)*A(i-floor(tx)+1,j-floor(ty))+a*b*A(i-floor(tx)+1,j-floor(ty)+1);  
        end
             
        
        
        
    end
end

figure(2),imshow(C,[0 255])




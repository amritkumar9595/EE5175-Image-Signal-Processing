clc
clear
close all


A = imread('/home/amrit/Documents/EE5175/EE5175_ISP_Lab1/Lab1/cells_scale.pgm');
figure(1),imshow(A,[0,255])

B=zeros(2*size(A));
[m,n] = size(B);

t=1.3

for i=1:m
    for j=1:n
        
        xx=i/t;
        yy=j/t;
        
        a=xx-floor(xx);
        b=yy-floor(yy);
        
%         xx=floor(xx)+xc;
%         yy=floor(yy)+yc;
%         
        if (floor(xx)>=1 && floor(yy)>=1 &&  floor(xx)+1<=size(A,1) && floor(yy)+1<=size(A,2))
            B(i,j)=(1-a)*(1-b)*A(floor(xx),floor(yy))+a*(1-b)*A(floor(xx),floor(yy)+1)+b*(1-a)*A(floor(xx)+1,floor(yy))+a*b*A(floor(xx)+1,floor(yy)+1);  
           
        end

        
        
    end
end

B
i
figure(2),imshow(B,[0,255])

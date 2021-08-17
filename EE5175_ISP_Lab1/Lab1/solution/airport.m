clc
clear
close all
I1=imread('/home/amrit/Documents/EE5175/EE5175_ISP_Lab1/Lab1/IMG1.pgm')
I2=imread('/home/amrit/Documents/EE5175/EE5175_ISP_Lab1/Lab1/IMG2.pgm');
figure, imshow(I1,[0,255])
figure,imshow(I2,[0,255])
B=uint8(zeros(size(I2)));

[m,n] = size(I2);

A=[94 249 1 0; 249 -94 0 1; 329 400 1 0;400 -329 0 1];
y=[30 125 158 373];
y=y'
x=inv(A)*y

tx=x(3);
ty=x(4);


for i=1:size(B,1)
    for j=1:size(B,2)
        xx=(i)*x(1)+(j)*x(2)+tx;
        yy=-(i)*x(2)+(j)*x(1)+ty;
        
%         xx=round(xx);
%         yy=round(yy);
%         
%         if (xx>=1 && yy>=1 && xx<=size(I1,1) && yy<=size(I1,2))
%              B(i,j)=I1(xx,yy);
%              
%         end
        a=xx-floor(xx);
        b=yy-floor(yy);
        

        
        if (floor(xx)>=1 && floor(yy)>=1 &&  floor(xx)+1<=size(I1,1) && floor(yy)+1<=size(I1,2))
            B(i,j)=(1-a)*(1-b)*I1(floor(xx),floor(yy))+a*(1-b)*I1(floor(xx),floor(yy)+1)+b*(1-a)*I1(floor(xx)+1,floor(yy))+a*b*I1(floor(xx)+1,floor(yy)+1);  
           
        end

        
    end
end

figure,imshow(B,[0,255])

temp=I2-B;
temp2=abs(double(B)-double(I2));
figure(4),imshow(temp2,[0,255])
clear all; clc;


I=double(imread('peppers_small.pgm'));
D=(pi/10);
R=[cos(D) -sin(D) 0;sin(D) cos(D) 0;0 0 1];
T=[1 0 41;0 1 41;0 0 1];
W=zeros(82,82);
for c=1:82
    for b=1:82
        W(c,b)=exp(-(1i*(c-41)*(b-41)*2*pi)/82);
    end
end
V=W*I*(W');
V1=(V);
figure(1)
imshow(abs(V),[25,100000]);
colormap gray;
H=T*R*inv(T);
V2=zeros(82,82);
for a=1:82
    for b=1:82
        B=inv(H)*[b;a;1];
%         V2(a,b) = interp2(V1,B(1)/B(3),B(2)/B(3),'linear',0);
        %V2(a,b)=inter(B(2)/B(3),B(1)/B(3),V1);
    end
end
figure(2)
imshow(abs(V2),[25,100000]);
colormap gray;

U=W'*V2*(W);
figure(3)
imshow(uint8(U/(82*82)));

I2=zeros(82,82);

for e=1:82
    for f=1:82
        E=H*[f;e;1];
        I2(e,f)=inter(E(2)/E(3),E(1)/E(3),I);
%         I2(e,f) = interp2(I,E(1)/E(3),E(2)/E(3),'linear',0);
    end
end
figure(4)
imshow(uint8(I2));

















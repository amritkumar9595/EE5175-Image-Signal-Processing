function [I1,I2,I3]=newimage(Lnew,Nhat,p)
I1=zeros(size(Nhat,1),1);
I2=zeros(size(Nhat,1),1);
I3=zeros(size(Nhat,1),1);
Ilexinew=zeros(size(Nhat));


Ilexinew=Nhat*Lnew;
p

for i=1:(size(Nhat,1))
Ilexinew(i,:)= p(i,1)*Ilexinew(i,:);
end
Ilexinew=uint8(Ilexinew);
% for i=1:size(N,1)
%     i
%     Ilexinew(i,:)=p(i,1)*Ilexinew(i,:);
% end

I1=Ilexinew(:,1);
I1=reshape(I1,256,256);

I2=Ilexinew(:,2);
I2=reshape(I2,256,256);

I3=Ilexinew(:,3);
I3=reshape(I3,256,256);

%    
% I1(:,1)=Ilexinew(:,1);
% I2(:,1)=Ilexinew(:,2);
% I3(:,1)=Ilexinew(:,3);
%     I1(i,1)=p(i,1)*(N(i,1)*L(1,1)+N(i,2)*L(2,1)+N(i,3)*L(3,1));
%     I2(i,1)=p(i,1)*(N(i,1)*L(1,2)+N(i,2)*L(2,2)+N(i,3)*L(3,2));
%     I3(i,1)=p(i,1)*(N(i,1)*L(1,3)+N(i,2)*L(2,3)+N(i,3)*L(3,3));
 

% I1=reshape(I1,256,256);
% I2=reshape(I2,256,256);
% I3=reshape(I3,256,256);
end

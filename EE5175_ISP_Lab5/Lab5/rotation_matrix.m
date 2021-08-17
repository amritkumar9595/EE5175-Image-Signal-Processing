function [R]=rotation_matrix(rx,ry,rz)

Rx=zeros(3,3);
Ry=zeros(3,3);
Rz=zeros(3,3);

Rx(1,1)=1;
Rx(2,2)=cos(rx);
Rx(2,3)=-sin(rx);
Rx(3,2)=sin(rx);
Rx(3,3)=cos(rx);

Ry(1,1)=cos(ry);
Ry(1,3)=sin(ry);
Ry(2,2)=1;
Ry(3,1)=-sin(ry);
Ry(3,3)=cos(ry);

Rz(1,1)=cos(rz);
Rz(1,2)=-sin(rz);
Rz(2,1)=sin(rz);
Rz(2,2)=cos(rz);
Rz(3,3)=1;

R=Rz*Ry*Rx;
end

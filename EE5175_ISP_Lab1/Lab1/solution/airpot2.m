syms a b tx ty
eqn1 = 30*a + 125*b + tx== 64;
eqn2 = -30*b + 125*a + ty == 124;
eqn3 = 158*a + 373*b + tx == 171;
eqn4 = -158*b + 373*a + ty == 27;

sol = solve([eqn1, eqn2, eqn3], [a, b, tx, ty]);
aSol = sol.a;
bSol = sol.b;
txSol = sol.tx;
tySol=sol.ty;

deg=acosd(aSol);

A=imread('/home/amrit/Documents/EE5175/EE5175_ISP_Lab1/Lab1/IMG1.pgm');
B=imread('/home/amrit/Documents/EE5175/EE5175_ISP_Lab1/Lab1/IMG2.pgm');
imshow(A,[0,255])
imshow(B,[0,255])
x1=zeros([size(A,1)*size(A,2) 1]);
x2=zeros([size(A,2)*size(A,1) 1]);

%Specify the degree
%deg=5;
%Change the image size
C=uint8(zeros([size(A,1) size(A,2) 1 ]));

m=1;
%Find the midpoint
midx=ceil((size(C,1)+1)/2);
midy=ceil((size(C,2)+1)/2);

for i=1:size(A,1)
    i1=i-midx;
    for j=1:size(A,2)
        %convert from cartesian to polar
        [t,r]=cart2pol(i1,j-midy);
        %Convert from radians to degree and add the degree value
        t1=rad2deg(t)+deg;
        %Convert from degree to radians
        t=deg2rad(t1);
        %Convert to Cartesian Co-ordinates
        [x,y]=pol2cart(t,r);
        x1(m)=round(x+midx);
        x2(m)=round(y+midy);
       
         
        m=m+1;
       
       
       
    end
   
end
%check whether the values are within the image size.
%x1(find(x1 < 1))=1;
%x2(find(x2 < 1))=1;

n=1;
for i=1:size(A,1)
    for j=1:size(A,2)
        C(x1(n)+1000,x2(n)+1000)=A(i,j);
       
        n=n+1;
    end
   
end
imshow(C)   dimension.
%
%   C = HORZCAT(A,B) is called for the syntax [A B].
%
%   See also VERTCAT.

%   Copyright 2008-2011 The MathWorks, Inc.

args = privResolveArgs(varargin{:});
strs = cellfun(@(x)x.s,args,'UniformOutput',false);
try
    ySym = mupadmex('(symobj::extractscalar@symobj::horzcat)',strs{:});
catch





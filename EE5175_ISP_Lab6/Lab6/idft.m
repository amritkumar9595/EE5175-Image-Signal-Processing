function v = inversediscretefouriertransform(m,n,F)
N=size(F,1);
[k,l]=size(F);

M=[n;m];
xc=m/2;
yc=n/2;

% R=[cos(F) -sin(F);sin(F) cos(F)];
v=0;
for x=1:(size(F,1))
    
    for y=1:(size(F,2))
        k=x-xc;
        l=y-yc;
        K=[l;k];
        
        pr=(i*2*pi/N)*transpose(M)*K;
        v=v+F(x,y)*exp(pr);
        
    end
end
end
        
        


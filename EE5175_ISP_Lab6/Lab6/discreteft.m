function H = discreteft(I,U)
f
V=H*I*transpose(H);        

% N=size(f,1);
% [m,n]=size(f);
% xc=m/2;
% yc=n/2;
% 
% K=[l;k];
% R=[cos(t) -sin(t);sin(t) cos(t)];
% v=0;
% for x=1:(size(f,1))
%     
%     for y=1:(size(f,2))
%         m=x-xc-1;
%         n=y-yc-1;
%         M=[n;m];
%         
%         pr=-(1i*2*pi/N)*transpose(M)*R*K;
%         v=v+f(x,y)*exp(pr);
%     end
% end
% end
%         
%         
% 

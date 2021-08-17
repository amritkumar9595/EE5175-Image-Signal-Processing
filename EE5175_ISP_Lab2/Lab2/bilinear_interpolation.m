function [B]=BilinearInterp(xx,yy,A)
        
        a=xx-floor(xx);
        b=yy-floor(yy);
        
        if (floor(xx)>=1 && floor(yy)>=1 &&  floor(xx)+1<=size(A,1) && floor(yy)+1<=size(A,2))
            B=(1-a)*(1-b)*A(floor(xx),floor(yy))+a*(1-b)*A(floor(xx),floor(yy)+1)+b*(1-a)*A(floor(xx)+1,floor(yy))+a*b*A(floor(xx)+1,floor(yy)+1);  
        end
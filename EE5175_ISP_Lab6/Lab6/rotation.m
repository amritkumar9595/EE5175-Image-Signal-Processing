function v = rotation(i,j,A,t)

        N = size(A,1);
        xc=ceil((1+N)/2);
        yc=ceil((1+N)/2);
        
        T1=[1,0,xc; 0,1,yc; 0,0,1];
        
        T2=[1,0,-xc ; 0,1,-yc ; 0,0,1];
        
        R=[cos(t),-sin(t),0 ; sin(t),cos(t),0 ; 0,0,1];
        
        t=[i;j;1];
        r=inv(T2)*inv(R)*inv(T1)*t;
        
        a=r(1)-floor(r(1));
        b=r(2)-floor(r(2));

        if (floor(r(1))>=1 && floor(r(2))>=1 &&  floor(r(1))+1<=size(A,1) && floor(r(2))+1<=size(A,2))
             v=(1-a)*(1-b)*A(floor(r(1)),floor(r(2)))+a*(1-b)*A(floor(r(1)),floor(r(2))+1)+b*(1-a)*A(floor(r(1))+1,floor(r(2)))+a*b*A(floor(r(1))+1,floor(r(2))+1);  
        else
            v=0;
        end
 end
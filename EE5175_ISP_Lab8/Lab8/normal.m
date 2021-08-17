function [N]=normal(M)
N=zeros(size(M));
for i=1:(size(M,1))
    d=M(i,3);
    if(d~=0)
        N(i,1)=M(i,1)/d;
        N(i,2)=M(i,2)/d;
        N(i,3)=M(i,3)/d;
    end
end
end
    
    
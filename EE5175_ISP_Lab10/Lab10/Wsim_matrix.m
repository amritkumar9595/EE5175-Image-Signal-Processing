function [Wsim]= Wsim_matrix(I,J,W,Img)

Wsim=zeros(2*W+1,2*W+1,3);

for i=1:size(Wsim,1)
    for j=1:size(Wsim,2)
        a=I-W+i-1;
        b=J-W+j-1;
       
        if((a>0 & b>0)&(a<256 & b<256))
            Wsim(i,j,:)=Img(a,b,:);
        end
    end
end   

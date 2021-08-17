function [I]=lexicograph(I1,I2,I3)
I=zeros((size(I1,1)*size(I1,2)),3);

i=0;
for m=1:size(I1,2)
    for n=1:size(I1,1)
         i=i+1;
         I(i,1)=I1(m,n);
    end
end
i=0;
for m=1:size(I2,2)
    for n=1:size(I2,1)
         i=i+1;
         I(i,2)=I2(m,n);
    end
end
i=0;
for m=1:size(I3,2)
    for n=1:size(I3,1)
         i=i+1;
         I(i,3)=I3(m,n);
    end
end
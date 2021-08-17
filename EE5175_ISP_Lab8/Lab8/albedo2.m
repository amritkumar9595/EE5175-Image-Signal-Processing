function [M]=albedo2(L,I)
N=zeros(size(M));
q=zeros(size(M,1),1);
i=zeros(1,3);

for i=1:size(M,1)
    m
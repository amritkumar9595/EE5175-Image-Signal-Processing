function [N,q]=albedo(M)
N=zeros(size(M));
q=zeros(size(M,1),1);

for i=1:size(M,1)
    q(i,1)=sqrt(M(i,1)*M(i,1)+M(i,2)*M(i,2)+M(i,3)*M(i,3));
    if(q(i,1)~=0)
      N(i,1)=M(i,1)/q(i,1);
      N(i,2)=M(i,2)/q(i,1);
      N(i,3)=M(i,3)/q(i,1);
    end
end
size(q)
end

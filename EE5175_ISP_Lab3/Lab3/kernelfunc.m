function [kernel]=kernelfunc(sd) 


k_size=ceil(6*sd+1);

if rem(k_size,2)==0
    k_size=k_size+1;
end
kernel = zeros(k_size,k_size);

mid=floor(k_size/2);

for i=1:k_size
    for j=1:k_size
        
        x=i-mid;
        y=j-mid;
        n=-1*(x*x+y*y)/(2*sd*sd);
        kernel(i,j)=exp(n)/(2*pi*sd*sd);
    end
end

s=sum(sum(kernel));
kernel=kernel./s;
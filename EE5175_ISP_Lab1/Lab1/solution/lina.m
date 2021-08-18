A = imread('D:\EE5175-Image-Signal-Processing\EE5175_ISP_Lab1\Lab1\cells_scale.pgm');
imshow(A,[0,255])

B=zeros(size(A));
[m,n] = size(B);

a=0.8

for i=1:m
    for j=1:n
        
        xs=round(i/a);
        ys=round(j/a);

        if (xs>=1 && ys>=1 && xs<=size(A,1) && ys<=size(A,2))
             B(i,j)=A(xs,ys);
             
        end
        
    end
end

B
imshow(B,[0,255])

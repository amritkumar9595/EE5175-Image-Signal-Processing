function [canvas]=homography(H,A)

canvas=zeros(size(A));
[NumCanvasRows,NumCanvasColumns,NumCanvasDepth]=size(A);

for jj = 1:NumCanvasColumns
        for ii = 1:NumCanvasRows
            
            tmp = (H) * [jj;ii;1];
      
            j1 = tmp(1) / tmp(3);
            i1 = tmp(2) / tmp(3);
      
            v = BilinearInterp(i1,j1,A);
            
            canvas(ii,jj) = v;
        end
    end
end


   

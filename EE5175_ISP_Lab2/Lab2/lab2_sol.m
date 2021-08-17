clc
clear
close all
I1=imread('img1.pgm');
I2=imread('img2.pgm');
I3=imread('img3.pgm');
% figure, imshow(I1,[0,255])
% figure,imshow(I2,[0,255])
% figure,imshow(I3,[0,255])
concensus_ctr21=0;
concensus_ctr23=0;
 
%finding correspondence between image 2 and image 1

[corresp1, corresp2] = sift_corresp('img1.pgm','img2.pgm');

while (concensus_ctr21<0.8*size(corresp1,1))

    [H21,concensus_ctr21]=homography(corresp1,corresp2);
end

% finding correspondence between image 2 and image 3

 [corresp3, corresp2] = sift_corresp('img3.pgm','img2.pgm');
 while (concensus_ctr23<0.8*size(corresp3,1))
 
     [H23,concensus_ctr23]=homography(corresp3,corresp2);
 end
 
 
 NumCanvasRows=2*size(I1,1);
 NumCanvasColumns=2*size(I1,2)+250;
 
 OffsetColumn=300;
 OffsetRow=100;
 
 canvas = zeros(NumCanvasRows,NumCanvasColumns);
 
 for jj = 1:NumCanvasColumns
 
     for ii = 1:NumCanvasRows
      i = ii - OffsetRow;
      j = jj - OffsetColumn;
     
      tmp = (H21) * [j;i;1];
      
      j1 = tmp(1) / tmp(3);
      i1 = tmp(2) / tmp(3);
      
      tmp = (H23) * [j;i;1];
      
      j3 = tmp(1) / tmp(3);
      i3 = tmp(2) / tmp(3);
     
      v1 = BilinearInterp(i1,j1,I1);
      v2 = BilinearInterp(i,j,I2);
      v3 = BilinearInterp(i3,j3,I3);
 
      canvas(ii,jj) = BlendValues(v1,v2,v3);
 end
 end
 
 
 
 figure,imshow(canvas,[0,255])
 
% t=H21*[207;443;1]
% t/t(3,1)
%         
%         
% 
% 
%     

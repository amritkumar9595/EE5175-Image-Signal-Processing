H=psf2otf(kernel,[277,277]);
qx=[1,-1]
Qx=psf2otf(qx,[277,277]);
qy=[1,-1]';
Qy=psf2otf(qy,[277,277]);

C=zeros(size(I1,1),size(I1,2));
C=conv2(kernel,I1)
imshow(C);

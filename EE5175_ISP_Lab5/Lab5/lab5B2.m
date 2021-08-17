load("frames.mat");
ref_image=eval(['frame',sprintf('%.2d',6)]);
%figure(1),imshow(ref_image);
imageall=zeros(11,720,1280,3);

%creating images from frames:
for n=(1:11)
    n
    I=eval(['frame',sprintf('%.2d',n)]);
    imwrite(I,['img' num2str(n) '.png']);  
end

H=zeros(3,3,11);

%finding correspondence between reference image and other images:
for n = setdiff(1:11, 6)
    concensus_ctr=0; 
    [corresp1, corresp2] = sift_corresp(['img' num2str(n) '.png'],'img6.png');

     while (concensus_ctr<0.8*size(corresp1,1))

          [H(:,:,n),concensus_ctr]=homographyfromsift(corresp1,corresp2);
         
     end
     
end

% finding the images from the corresponding points by applying HOMOGRAPHY:
for n = setdiff(1:11, 6)
    n
    for k=(1:3)
        I=eval(['frame',sprintf('%.2d',n)]);
        A=squeeze(I(:,:,k));
        imageall(n,:,:,k) = homography(H(:,:,n),A);
    end
end
imageall(6,:,:,:)=eval(['frame',sprintf('%.2d',6)]);
imageall=uint8(imageall);

blur_image2=zeros(size(eval(['frame',sprintf('%.2d',1)])));
for i=1:11
    i
    I=squeeze(imageall(i,:,:,:));
    I=double(I);
    blur_image2=blur_image2+I;
    
end
blur_image2=blur_image2/11;
blur_image2=uint8(blur_image2);

figure(2),imshow(blur_image2)

        


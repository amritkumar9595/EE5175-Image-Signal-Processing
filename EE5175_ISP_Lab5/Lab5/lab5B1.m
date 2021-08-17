%PART1: Creating Blurred image from the given frames:
load("frames.mat");
blur_image1=zeros(size(eval(['frame',sprintf('%.2d',1)])));
%figure(1),imshow(frame01);

for i=1:11
    i
    I=eval(['frame',sprintf('%.2d',i)]);
    I=double(I);
    blur_image1=blur_image1+I;
    
end
blur_image1=blur_image1/11;
blur_image1=uint8(blur_image1);

figure(2),imshow(blur_image1)

%PART2: CREATING BLURRED IMAGE  BY APPLYING HOMOGRAPHY:
ref_image=eval(['frame',sprintf('%.2d',6)]);
imageall=zeros(11,720,1280,3);

%creating images .png from frames:
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

          [H(:,:,n),concensus_ctr]=homographyfromsift(corresp1,corresp2);  % 11 homography matrices obtained
         
     end
     
end

% finding the images from the corresponding points by applying HOMOGRAPHY:
for n = setdiff(1:11, 6)
    n
    for k=(1:3)
        I=eval(['frame',sprintf('%.2d',n)]);
        A=squeeze(I(:,:,k));
        imageall(n,:,:,k) = homography(H(:,:,n),A);  %imageall(4D-matrix) stores all the images:[#of image,xx,yy,zz] 
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

figure(3),imshow(blur_image2)

%determining error between the 2 blur images:
Np=size(blur_image1,1)*size(blur_image1,2)*size(blur_image1,3);

for i =(1:size(blur_image1,1))
    for j=(1:size(blur_image1,2))
        for k=(1:size(blur_image1,3))
            error=(blur_image1(i,j,k)-blur_image2(i,j,k))^2;
        end
    end
end

error_image=(blur_image1-blur_image2);
figure(4),imshow(error_image)
abserror_image=imabsdiff(blur_image1,blur_image2);
figure(5),imshow(abserror_image)


